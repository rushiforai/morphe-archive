package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private const val FRAGMENT_PKG = "Lcom/apple/android/music/player/fragment/"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
private const val RECYCLER_VIEW_PREFIX = "Landroidx/recyclerview/widget/RecyclerView\$"
private const val LAYOUT_MANAGER = "Landroidx/recyclerview/widget/LinearLayoutManager;"
private const val SONG_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val SONG_NATIVE = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;"
private const val LYRICS_VM = "Lcom/apple/android/music/player/viewmodel/PlayerLyricsViewModel;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val VIEW = "Landroid/view/View;"
private const val LINKED_LIST = "Ljava/util/LinkedList;"
private const val POPUP_WINDOW = "Landroid/widget/PopupWindow;"
private const val HOST_IFACE = "Lapp/voidhack/extension/applemusic/lyrics/LyricsScrollHost;"
private const val SYNC = "Lapp/voidhack/extension/applemusic/lyrics/LyricsScrollSync;"

private object LyricsScrollStateListener : Fingerprint(
    parameters = listOf(RECYCLER_VIEW, "I"),
    returnType = "V",
    filters = listOf(
        methodCall(name = "setVerticalScrollBarEnabled", parameters = listOf("Z")),
    ),
    custom = { _, classDef ->
        classDef.type.startsWith(FRAGMENT_PKG) &&
            classDef.superclass?.startsWith(RECYCLER_VIEW_PREFIX) == true &&
            classDef.fields.any { it.type == FRAGMENT }
    },
)

private object LyricsActiveLineCallback : Fingerprint(
    parameters = listOf("I", "I"),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = RECYCLER_VIEW, name = "getScrollState", returnType = "I"),
        methodCall(definingClass = LYRICS_VM, name = "setCurrentHighlightedLine", parameters = listOf("I")),
    ),
    custom = { _, classDef ->
        classDef.type.startsWith(FRAGMENT_PKG) && classDef.fields.any { it.type == FRAGMENT }
    },
)

private object LyricsItemTouchListener : Fingerprint(
    parameters = listOf(RECYCLER_VIEW, MOTION_EVENT),
    returnType = "Z",
    filters = listOf(
        methodCall(definingClass = MOTION_EVENT, name = "getAction", returnType = "I"),
        methodCall(definingClass = "Landroid/os/Handler;", name = "obtainMessage", parameters = listOf("I")),
    ),
    custom = { _, classDef ->
        classDef.type.startsWith(FRAGMENT_PKG) &&
            classDef.interfaces.any { it.startsWith(RECYCLER_VIEW_PREFIX) } &&
            classDef.fields.any { it.type == FRAGMENT }
    },
)

private object LyricsWindowFocusListener : Fingerprint(
    name = "onWindowFocusChanged",
    parameters = listOf("Z"),
    returnType = "V",
    custom = { _, classDef ->
        classDef.type.startsWith(FRAGMENT_PKG) &&
            classDef.interfaces.contains("Landroid/view/ViewTreeObserver\$OnWindowFocusChangeListener;") &&
            classDef.fields.any { it.type == FRAGMENT }
    },
)

private object LyricsProcessEvents : Fingerprint(
    definingClass = FRAGMENT,
    parameters = listOf("I"),
    returnType = "J",
    filters = listOf(
        methodCall(name = "getMediaBrowser"),
        methodCall(name = "isPlaying", returnType = "Z"),
        methodCall(name = "getCurrentPosition", returnType = "J"),
    ),
)

internal val lyricsScrollSyncPatch = bytecodePatch {
    execute {
        val fragmentClass = mutableClassDefBy(FRAGMENT)
        val midClassType = checkNotNull(fragmentClass.superclass) { "Missing superclass of $FRAGMENT" }
        val midClass = mutableClassDefBy(midClassType)

        // 1. Discover fields & methods from L.a(RecyclerView, int)V.
        val scrollClass = LyricsScrollStateListener.classDef
        val scrollMethod = LyricsScrollStateListener.method
        val scrollInsns = scrollMethod.instructions
        val scrollFragField = scrollClass.fields.single { it.type == FRAGMENT }
        val activeAdapterField = scrollInsns
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .first { it.definingClass == FRAGMENT && it.type != SONG_PTR }
        val adapterBaseType = activeAdapterField.type
        val setAnimateOnMoveMethod = scrollInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == adapterBaseType && it.parameterTypes == listOf("Z") && it.returnType == "V" }
            .distinct()
            .single()
        val forceSyncField = scrollInsns
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT }
            .distinct()
            .single()
        val songInfoField = scrollInsns
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT && it.type == SONG_PTR }
            .distinct()
            .single()
        val isStaticCall = scrollInsns.withIndex().single { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.returnType == "Z" && it.parameterTypes.size == 3 && it.parameterTypes[1] == SONG_NATIVE
            } == true
        }
        val isStaticHelper = (isStaticCall.value as ReferenceInstruction).reference as MethodReference
        val isStaticRegs = isStaticCall.value as FiveRegisterInstruction
        val v0Field = scrollInsns.take(isStaticCall.index).asReversed()
            .first { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == isStaticRegs.registerC }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val itemField = scrollInsns.take(isStaticCall.index).asReversed()
            .first { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == isStaticRegs.registerE }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val activeLineIntFields = scrollInsns
            .filter { it.opcode == Opcode.IGET }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT && it.type == "I" }
            .distinct()
        check(activeLineIntFields.size == 2) { "Expected 2 active line fields in L.a, found ${activeLineIntFields.size}" }
        val firstActiveLineField = activeLineIntFields[0]
        val lastActiveLineField = activeLineIntFields[1]
        val isLineVisibleRef = scrollInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .first { it.definingClass == FRAGMENT && it.parameterTypes == listOf(FRAGMENT, "I") && it.returnType == "Z" }
        val hasInstrumentalRef = scrollInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == FRAGMENT && it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .distinct()
            .single()
        val setScrolledAwayRef = scrollInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == FRAGMENT && it.parameterTypes == listOf("Z") && it.returnType == "V" }
            .distinct()
            .single()

        // 2. Discover fields & methods from M.c(RecyclerView, MotionEvent)Z and s2()V.
        val itemTouchClass = LyricsItemTouchListener.classDef
        val itemTouchMethod = LyricsItemTouchListener.method
        val itemTouchInsns = itemTouchMethod.instructions
        val itemTouchFragField = itemTouchClass.fields.single { it.type == FRAGMENT }
        val sharePendingField = itemTouchInsns
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT }
            .distinct()
            .single()
        val clearShareLockRef = itemTouchInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == FRAGMENT && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .distinct()
            .single()
        val clearShareLockMethod = fragmentClass.methods.single {
            it.name == clearShareLockRef.name && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val possibleShareField = clearShareLockMethod.instructions
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT }
            .distinct()
            .single()

        // 3. Discover fields & methods from K.b(int, int)V and K.a(int)V.
        val callbackClass = LyricsActiveLineCallback.classDef
        val activeLineMethod = LyricsActiveLineCallback.method
        val activeLineInsns = activeLineMethod.instructions
        val callbackFragField = callbackClass.fields.single { it.type == FRAGMENT }
        val seekLineMethod = callbackClass.methods.single {
            it.parameterTypes == listOf("I") && it.returnType == "V"
        }
        val isScrolledAwayMethod = activeLineInsns.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.definingClass == adapterBaseType && it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .distinct()
            .single()
        val bgOffsetResetField = activeLineInsns
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT && it != forceSyncField }
            .distinct()
            .single()
        val anchorLineWrite = activeLineInsns.withIndex().single { (_, insn) ->
            insn.opcode == Opcode.IPUT &&
                ((insn as ReferenceInstruction).reference as FieldReference).let {
                    it.type == "I" && it.definingClass != FRAGMENT
                }
        }
        val anchorLineField = (anchorLineWrite.value as ReferenceInstruction).reference as FieldReference
        val itemAnimatorField = activeLineInsns.take(anchorLineWrite.index).asReversed()
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .first { it.definingClass == FRAGMENT }
        val topOffsetRead = activeLineInsns.withIndex().single { (_, insn) ->
            insn.opcode == Opcode.IGET &&
                ((insn as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass != FRAGMENT && it.type == "I"
                }
        }
        val topOffsetField = (topOffsetRead.value as ReferenceInstruction).reference as FieldReference
        val observableValueField = activeLineInsns.take(topOffsetRead.index).asReversed()
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .first { it.definingClass != FRAGMENT }
        val spacingObservableField = activeLineInsns.take(topOffsetRead.index).asReversed()
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .first { it.definingClass == FRAGMENT && it.type == observableValueField.definingClass }
        val scrollToPosCall = activeLineInsns.withIndex().single { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.parameterTypes == listOf("I", "I") && it.returnType == "V"
            } == true
        }
        val scrollToPosOffsetMethod = (scrollToPosCall.value as ReferenceInstruction).reference as MethodReference
        val layoutManagerField = activeLineInsns.take(scrollToPosCall.index).asReversed()
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .first { field ->
                field.definingClass == FRAGMENT && (
                    field.type == LAYOUT_MANAGER ||
                        field.type == scrollToPosOffsetMethod.definingClass ||
                        classDefByOrNull(field.type)?.superclass == LAYOUT_MANAGER
                    )
            }

        // 4. Discover LinearLayoutManager visible range + findViewByPosition methods.
        val isLineVisibleMethod = fragmentClass.methods.single {
            it.name == isLineVisibleRef.name && it.parameterTypes == listOf(FRAGMENT, "I") && it.returnType == "Z"
        }
        val visibleRangeCalls = isLineVisibleMethod.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.parameterTypes.isEmpty() && it.returnType == "I" }
        check(visibleRangeCalls.size == 2) { "Expected 2 visible range calls in e2, found ${visibleRangeCalls.size}" }
        val findFirstVisibleMethod = visibleRangeCalls[0]
        val findLastVisibleMethod = visibleRangeCalls[1]
        val linearLayoutManagerClass = mutableClassDefBy(LAYOUT_MANAGER)
        val findViewByPositionMethod = linearLayoutManagerClass.methods.single {
            it.parameterTypes == listOf("I") && it.returnType == VIEW
        }

        // 5. Discover adapter (g1 / RecyclerView$f) methods.
        val adapterBaseClass = mutableClassDefBy(adapterBaseType)
        val recyclerAdapterType = checkNotNull(adapterBaseClass.superclass) { "Missing superclass of $adapterBaseType" }
        val recyclerAdapterClass = mutableClassDefBy(recyclerAdapterType)
        val lineToAdapterMethod = adapterBaseClass.methods.single {
            it.parameterTypes == listOf("I", "Z") && it.returnType == "I"
        }
        val hasInstrumentalMethod = fragmentClass.methods.single {
            it.name == hasInstrumentalRef.name && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        val adapterViewTypeMethod = hasInstrumentalMethod.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter {
                (it.definingClass == adapterBaseType || it.definingClass == recyclerAdapterType) &&
                    it.parameterTypes == listOf("I") && it.returnType == "I"
            }
            .distinct()
            .single()
        val adapterItemCountMethod = recyclerAdapterClass.methods.single {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "I"
        }

        // 6. Discover MediaBrowser, PopupWindow, WindowFocus, PlaybackState & Lifecycle members.
        val processEventsMethod = LyricsProcessEvents.method
        val processEventsRefs = processEventsMethod.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        val getMediaBrowserMethod = processEventsRefs.first { it.name == "getMediaBrowser" && it.parameterTypes.isEmpty() }
        val isPlayingMethod = processEventsRefs.first { it.name == "isPlaying" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        val getCurrentPositionMethod = processEventsRefs.first { it.name == "getCurrentPosition" && it.parameterTypes.isEmpty() && it.returnType == "J" }
        val playbackStateMethod = fragmentClass.methods.single { method ->
            method.parameterTypes == listOf("I") && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == FRAGMENT && ref.name == processEventsMethod.name &&
                            ref.parameterTypes == listOf("I") && ref.returnType == "J"
                    } == true
                } == true
        }
        val mediaBrowserType = getMediaBrowserMethod.returnType
        val getPlaybackStateMethod = fragmentClass.methods.firstNotNullOf { method ->
            method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                ?.firstOrNull {
                    it.name == "getPlaybackState" &&
                        it.parameterTypes.isEmpty() &&
                        it.returnType == "I" &&
                        (it.definingClass == mediaBrowserType || it.definingClass == isPlayingMethod.definingClass)
                }
        }
        val windowFocusClass = LyricsWindowFocusListener.classDef
        val windowFocusMethod = LyricsWindowFocusListener.method
        val windowFocusFragField = windowFocusClass.fields.single { it.type == FRAGMENT }
        val windowUnfocusedField = windowFocusMethod.instructions
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.definingClass == FRAGMENT }
            .distinct()
            .single()
        val popupWindowField = fragmentClass.fields.single { it.type == POPUP_WINDOW }
        val getRecyclerViewMethod = fragmentClass.methods.single {
            it.name == "getRecyclerView" && it.parameterTypes.isEmpty() && it.returnType == RECYCLER_VIEW
        }

        fun invokeVirtualOrInterface(ref: MethodReference): String {
            val defining = classDefByOrNull(ref.definingClass)
            return if (defining != null && AccessFlags.INTERFACE.isSet(defining.accessFlags)) {
                "invoke-interface"
            } else {
                "invoke-virtual"
            }
        }

        // 7. Implement LyricsScrollHost on PlayerLyricsViewFragment.
        fragmentClass.interfaces.add(HOST_IFACE)
        fragmentClass.addBridge("voidhackIsSyncedLyrics", emptyList(), "Z", 5,
            """
                iget-object v0, p0, $songInfoField
                if-eqz v0, :no
                invoke-virtual {v0}, $SONG_PTR->get()$SONG_NATIVE
                move-result-object v1
                if-eqz v1, :no
                iget-object v0, p0, $v0Field
                iget-object v2, p0, $itemField
                invoke-static {v0, v1, v2}, $isStaticHelper
                move-result v0
                if-nez v0, :no
                const/4 v0, 0x1
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackIsPlaying", emptyList(), "Z", 3,
            """
                ${invokeVirtualOrInterface(getMediaBrowserMethod)} {p0}, $getMediaBrowserMethod
                move-result-object v0
                if-eqz v0, :no
                ${invokeVirtualOrInterface(isPlayingMethod)} {v0}, $isPlayingMethod
                move-result v0
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackPlaybackPositionMs", emptyList(), "J", 4,
            """
                ${invokeVirtualOrInterface(getMediaBrowserMethod)} {p0}, $getMediaBrowserMethod
                move-result-object v0
                if-eqz v0, :none
                ${invokeVirtualOrInterface(getCurrentPositionMethod)} {v0}, $getCurrentPositionMethod
                move-result-wide v0
                return-wide v0
                :none
                const-wide/16 v0, -0x1
                return-wide v0
            """,
        )
        fragmentClass.addBridge("voidhackIsUiActive", emptyList(), "Z", 3,
            """
                invoke-virtual {p0}, $FRAGMENT->isHidden()Z
                move-result v0
                if-nez v0, :no
                invoke-virtual {p0}, $FRAGMENT->isResumed()Z
                move-result v0
                if-eqz v0, :no
                iget-boolean v0, p0, $windowUnfocusedField
                if-nez v0, :no
                iget-object v0, p0, $popupWindowField
                if-eqz v0, :check_view
                invoke-virtual {v0}, $POPUP_WINDOW->isShowing()Z
                move-result v0
                if-nez v0, :no
                :check_view
                invoke-virtual {p0}, $FRAGMENT->getView()$VIEW
                move-result-object v0
                if-eqz v0, :no
                invoke-virtual {v0}, $VIEW->isAttachedToWindow()Z
                move-result v0
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackScrollState", emptyList(), "I", 3,
            """
                ${invokeVirtualOrInterface(getRecyclerViewMethod)} {p0}, $getRecyclerViewMethod
                move-result-object v0
                if-eqz v0, :idle
                invoke-virtual {v0}, $RECYCLER_VIEW->getScrollState()I
                move-result v0
                return v0
                :idle
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackFirstVisiblePosition", emptyList(), "I", 3,
            """
                iget-object v0, p0, $layoutManagerField
                if-eqz v0, :none
                ${invokeVirtualOrInterface(findFirstVisibleMethod)} {v0}, $findFirstVisibleMethod
                move-result v0
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackLastVisiblePosition", emptyList(), "I", 3,
            """
                iget-object v0, p0, $layoutManagerField
                if-eqz v0, :none
                ${invokeVirtualOrInterface(findLastVisibleMethod)} {v0}, $findLastVisibleMethod
                move-result v0
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackActiveLineStart", emptyList(), "I", 2,
            """
                iget v0, p0, $firstActiveLineField
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackActiveLineEnd", emptyList(), "I", 2,
            """
                iget v0, p0, $lastActiveLineField
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackIsScrolledAway", emptyList(), "Z", 3,
            """
                iget-object v0, p0, $activeAdapterField
                if-eqz v0, :no
                ${invokeVirtualOrInterface(isScrolledAwayMethod)} {v0}, $isScrolledAwayMethod
                move-result v0
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackIsSharePending", emptyList(), "Z", 2,
            """
                iget-boolean v0, p0, $sharePendingField
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackIsPossibleShare", emptyList(), "Z", 2,
            """
                iget-boolean v0, p0, $possibleShareField
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackClearSharePending", emptyList(), "V", 2,
            """
                const/4 v0, 0x0
                iput-boolean v0, p0, $sharePendingField
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackClearShareLock", emptyList(), "V", 2,
            """
                ${invokeVirtualOrInterface(clearShareLockRef)} {p0}, $clearShareLockRef
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackSetScrolledAway", listOf("Z"), "V", 3,
            """
                iget-object v0, p0, $activeAdapterField
                if-eqz v0, :done
                invoke-virtual {p0}, $FRAGMENT->getView()$VIEW
                move-result-object v0
                if-eqz v0, :done
                ${invokeVirtualOrInterface(setScrolledAwayRef)} {p0, p1}, $setScrolledAwayRef
                :done
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackSetForceSync", listOf("Z"), "V", 2,
            """
                iput-boolean p1, p0, $forceSyncField
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackTopOffset", emptyList(), "I", 3,
            """
                iget-object v0, p0, $spacingObservableField
                if-eqz v0, :zero
                iget-object v0, v0, $observableValueField
                if-eqz v0, :zero
                check-cast v0, ${topOffsetField.definingClass}
                iget v0, v0, $topOffsetField
                return v0
                :zero
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackSnapToSyncedPosition", listOf("I", "I", "Z"), "V", 8,
            """
                invoke-virtual {p0}, $FRAGMENT->getView()$VIEW
                move-result-object v0
                if-eqz v0, :done
                ${invokeVirtualOrInterface(getRecyclerViewMethod)} {p0}, $getRecyclerViewMethod
                move-result-object v0
                iget-object v1, p0, $activeAdapterField
                iget-object v2, p0, $layoutManagerField
                if-eqz v0, :done
                if-eqz v1, :done
                if-eqz v2, :done
                const/4 v3, 0x0
                invoke-virtual {v0, v3}, $RECYCLER_VIEW->setVerticalScrollBarEnabled(Z)V
                # Keep Q(false) during A2(false) so notifyDataSetChanged() highlights the active line immediately.
                ${invokeVirtualOrInterface(setAnimateOnMoveMethod)} {v1, v3}, $setAnimateOnMoveMethod
                ${invokeVirtualOrInterface(setScrolledAwayRef)} {p0, v3}, $setScrolledAwayRef
                iget-object v1, p0, $itemAnimatorField
                if-eqz v1, :skip_anim
                iput p2, v1, $anchorLineField
                :skip_anim
                iput-boolean p3, p0, $forceSyncField
                const/4 v3, 0x1
                iput-boolean v3, p0, $bgOffsetResetField
                if-ltz p1, :done
                invoke-virtual {p0}, $FRAGMENT->voidhackTopOffset()I
                move-result v3
                ${invokeVirtualOrInterface(scrollToPosOffsetMethod)} {v2, p1, v3}, $scrollToPosOffsetMethod
                :done
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackEnsureLyricsTimerRunning", emptyList(), "V", 3,
            """
                ${invokeVirtualOrInterface(getMediaBrowserMethod)} {p0}, $getMediaBrowserMethod
                move-result-object v0
                if-eqz v0, :done
                ${invokeVirtualOrInterface(isPlayingMethod)} {v0}, $isPlayingMethod
                move-result v1
                if-eqz v1, :done
                ${invokeVirtualOrInterface(getPlaybackStateMethod)} {v0}, $getPlaybackStateMethod
                move-result v1
                ${invokeVirtualOrInterface(processEventsMethod)} {p0, v1}, $processEventsMethod
                :done
                return-void
            """,
        )
        fragmentClass.addBridge("voidhackLineToAdapterPosition", listOf("I"), "I", 4,
            """
                iget-object v0, p0, $activeAdapterField
                if-eqz v0, :passthrough
                const/4 v1, 0x0
                ${invokeVirtualOrInterface(lineToAdapterMethod)} {v0, p1, v1}, $lineToAdapterMethod
                move-result v0
                return v0
                :passthrough
                return p1
            """,
        )
        fragmentClass.addBridge("voidhackAdapterItemCount", emptyList(), "I", 3,
            """
                iget-object v0, p0, $activeAdapterField
                if-eqz v0, :zero
                ${invokeVirtualOrInterface(adapterItemCountMethod)} {v0}, $adapterItemCountMethod
                move-result v0
                return v0
                :zero
                const/4 v0, 0x0
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackAdapterItemViewType", listOf("I"), "I", 3,
            """
                iget-object v0, p0, $activeAdapterField
                if-eqz v0, :none
                ${invokeVirtualOrInterface(adapterViewTypeMethod)} {v0, p1}, $adapterViewTypeMethod
                move-result v0
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackPlaybackLineIndex", emptyList(), "I", 5,
            """
                iget-object v0, p0, $songInfoField
                if-eqz v0, :none
                invoke-virtual {p0}, $FRAGMENT->voidhackPlaybackPositionMs()J
                move-result-wide v1
                invoke-static {v0, v1, v2}, $SYNC->findLineIndexForTime(Ljava/lang/Object;J)I
                move-result v0
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )
        fragmentClass.addBridge("voidhackIsAlignedNearTop", listOf("I"), "Z", 5,
            """
                ${invokeVirtualOrInterface(getRecyclerViewMethod)} {p0}, $getRecyclerViewMethod
                move-result-object v0
                iget-object v1, p0, $layoutManagerField
                if-eqz v0, :no
                if-eqz v1, :no
                ${invokeVirtualOrInterface(findViewByPositionMethod)} {v1, p1}, $findViewByPositionMethod
                move-result-object v1
                invoke-virtual {p0}, $FRAGMENT->voidhackTopOffset()I
                move-result v2
                invoke-static {v0, v1, p1, v2}, $SYNC->isViewAlignedNearTop(${VIEW}${VIEW}II)Z
                move-result v0
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )

        // 8. Fix controls_tap_target OnTouchListener (ViewOnTouchListenerC3935c) dropping ACTION_CANCEL / !clickable cleanup.
        val midOnViewCreated = midClass.methods.single {
            it.name == "onViewCreated" && it.parameterTypes == listOf(VIEW, "Landroid/os/Bundle;")
        }
        val setTouchIdx = midOnViewCreated.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == VIEW && ref.name == "setOnTouchListener"
            } == true
        }
        check(setTouchIdx > 0) { "Could not locate setOnTouchListener in $midClassType.onViewCreated" }
        val tapTouchType = midOnViewCreated.instructions.take(setTouchIdx).asReversed()
            .first { it.opcode == Opcode.NEW_INSTANCE }
            .let { ((it as ReferenceInstruction).reference as TypeReference).type }
        val tapTouchClass = mutableClassDefBy(tapTouchType)
        val tapTouchOnTouch = tapTouchClass.methods.single {
            it.name == "onTouch" && it.parameterTypes == listOf(VIEW, MOTION_EVENT) && it.returnType == "Z"
        }
        val tapFragField = tapTouchClass.fields.single { it.type == midClassType }
        val tapPendingField = tapTouchClass.fields.single { it.type == LINKED_LIST }
        val tapGestureDetectorField = tapTouchClass.fields.single { it.type == "Landroid/view/GestureDetector;" }
        val tapStartYField = tapTouchClass.fields.single { it.type == "F" }
        val tapBoolFields = tapTouchClass.fields.filter { it.type == "Z" }
        check(tapBoolFields.size == 2) { "Expected 2 boolean flags on $tapTouchType, found ${tapBoolFields.size}" }
        val midGetRecyclerView = midClass.methods.single {
            it.name == "getRecyclerView" && it.parameterTypes.isEmpty() && it.returnType == RECYCLER_VIEW
        }

        val origTapTouchName = tapTouchOnTouch.name
        tapTouchOnTouch.name = "voidhackNativeOnTouch"
        tapTouchClass.addBridge(origTapTouchName, listOf(VIEW, MOTION_EVENT), "Z", 11,
            """
                iget-object v0, p0, $tapFragField
                iget-boolean v1, p0, ${tapBoolFields[0]}
                iget-boolean v2, p0, ${tapBoolFields[1]}
                or-int/2addr v1, v2
                invoke-static {v0, p1, p2, v1}, $SYNC->shouldHandleTapTargetCancel(Ljava/lang/Object;${VIEW}${MOTION_EVENT}Z)Z
                move-result v2
                if-eqz v2, :native_touch
                move v6, v1
                move-object v1, p1
                invoke-virtual {v0}, $midGetRecyclerView
                move-result-object v2
                iget-object v3, p0, $tapPendingField
                iget-object v4, p0, $tapGestureDetectorField
                move-object v5, p2
                invoke-static/range {v0 .. v6}, $SYNC->handleTapTargetCancel(Ljava/lang/Object;${VIEW}${VIEW}${LINKED_LIST}Landroid/view/GestureDetector;${MOTION_EVENT}Z)Z
                move-result v1
                const/4 v2, 0x0
                iput-boolean v2, p0, ${tapBoolFields[0]}
                iput-boolean v2, p0, ${tapBoolFields[1]}
                const/high16 v2, -0x40800000
                iput v2, p0, $tapStartYField
                return v1
                :native_touch
                invoke-static {v0, p1, p2}, $SYNC->onTapTargetTouchBefore(Ljava/lang/Object;${VIEW}${MOTION_EVENT})V
                invoke-virtual {p0, p1, p2}, $tapTouchType->voidhackNativeOnTouch(${VIEW}${MOTION_EVENT})Z
                move-result v1
                invoke-static {v0, p1, p2}, $SYNC->onTapTargetTouchAfter(Ljava/lang/Object;${VIEW}${MOTION_EVENT})V
                return v1
            """,
        )

        // 9. Fix M.c(RecyclerView, MotionEvent)Z: use getActionMasked() and notify LyricsScrollSync.
        val getActionIdx = itemTouchMethod.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == MOTION_EVENT && ref.name == "getAction" && ref.parameterTypes.isEmpty()
            } == true
        }
        check(getActionIdx >= 0) { "Could not locate MotionEvent.getAction() in $itemTouchClass" }
        val getActionReg = (itemTouchMethod.instructions[getActionIdx] as FiveRegisterInstruction).registerC
        itemTouchMethod.replaceInstruction(
            getActionIdx,
            "invoke-virtual {v$getActionReg}, $MOTION_EVENT->getActionMasked()I",
        )
        val origItemTouchName = itemTouchMethod.name
        itemTouchMethod.name = "voidhackNativeInterceptTouch"
        itemTouchClass.addBridge(origItemTouchName, listOf(RECYCLER_VIEW, MOTION_EVENT), "Z", 5,
            """
                iget-object v0, p0, $itemTouchFragField
                invoke-static {v0, p2}, $SYNC->onRecyclerTouchBefore(Ljava/lang/Object;${MOTION_EVENT})V
                invoke-virtual {p0, p1, p2}, ${itemTouchClass.type}->voidhackNativeInterceptTouch(${RECYCLER_VIEW}${MOTION_EVENT})Z
                move-result v1
                invoke-static {v0, p2}, $SYNC->onRecyclerTouchAfter(Ljava/lang/Object;${MOTION_EVENT})V
                return v1
            """,
        )

        // 10. Hook L.a(RecyclerView, int)V.
        val origScrollName = scrollMethod.name
        scrollMethod.name = "voidhackNativeScrollStateChanged"
        scrollClass.addBridge(origScrollName, listOf(RECYCLER_VIEW, "I"), "V", 4,
            """
                invoke-virtual {p0, p1, p2}, ${scrollClass.type}->voidhackNativeScrollStateChanged(${RECYCLER_VIEW}I)V
                iget-object v0, p0, $scrollFragField
                invoke-static {v0, p2}, $SYNC->onScrollStateChanged(Ljava/lang/Object;I)V
                return-void
            """,
        )

        // 11. Hook K.b(int, int)V and K.a(int)V.
        val origActiveLineName = activeLineMethod.name
        activeLineMethod.name = "voidhackNativeActiveLineChanged"
        callbackClass.addBridge(origActiveLineName, listOf("I", "I"), "V", 4,
            """
                iget-object v0, p0, $callbackFragField
                invoke-static {v0, p1, p2}, $SYNC->beforeActiveLineUpdate(Ljava/lang/Object;II)V
                invoke-virtual {p0, p1, p2}, ${callbackClass.type}->voidhackNativeActiveLineChanged(II)V
                invoke-static {v0, p1, p2}, $SYNC->afterActiveLineUpdate(Ljava/lang/Object;II)V
                return-void
            """,
        )
        seekLineMethod.addInstructions(
            0,
            """
                iget-object v0, p0, $callbackFragField
                invoke-static {v0}, $SYNC->onUserSeekLine(Ljava/lang/Object;)V
            """,
        )

        // 12. Hook H.onWindowFocusChanged(boolean)V.
        val origWindowFocusName = windowFocusMethod.name
        windowFocusMethod.name = "voidhackNativeWindowFocusChanged"
        windowFocusClass.addBridge(origWindowFocusName, listOf("Z"), "V", 3,
            """
                invoke-virtual {p0, p1}, ${windowFocusClass.type}->voidhackNativeWindowFocusChanged(Z)V
                iget-object v0, p0, $windowFocusFragField
                invoke-static {v0, p1}, $SYNC->onWindowFocusChanged(Ljava/lang/Object;Z)V
                return-void
            """,
        )

        // 13. Hook PlayerLyricsViewFragment.s2()V, X1(I)V, onResume, onPause, onHiddenChanged, onDestroyView.
        clearShareLockMethod.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $SYNC->onShareLockCleared(Ljava/lang/Object;)V",
        )

        val origPlaybackStateName = playbackStateMethod.name
        playbackStateMethod.name = "voidhackNativePlaybackStateChanged"
        fragmentClass.addBridge(origPlaybackStateName, listOf("I"), "V", 2,
            """
                invoke-virtual {p0, p1}, $FRAGMENT->voidhackNativePlaybackStateChanged(I)V
                invoke-static {p0}, $SYNC->onPlaybackStateChanged(Ljava/lang/Object;)V
                return-void
            """,
        )

        val onResume = fragmentClass.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() }
        onResume.name = "voidhackNativeOnResume"
        fragmentClass.addBridge("onResume", emptyList(), "V", 1,
            """
                invoke-virtual {p0}, $FRAGMENT->voidhackNativeOnResume()V
                invoke-static {p0}, $SYNC->onBecameVisible(Ljava/lang/Object;)V
                return-void
            """,
        )

        val onPause = fragmentClass.methods.single { it.name == "onPause" && it.parameterTypes.isEmpty() }
        onPause.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $SYNC->onBecameHidden(Ljava/lang/Object;)V",
        )

        val onHiddenChanged = fragmentClass.methods.single { it.name == "onHiddenChanged" && it.parameterTypes == listOf("Z") }
        onHiddenChanged.name = "voidhackNativeOnHiddenChanged"
        fragmentClass.addBridge("onHiddenChanged", listOf("Z"), "V", 2,
            """
                invoke-virtual {p0, p1}, $FRAGMENT->voidhackNativeOnHiddenChanged(Z)V
                if-eqz p1, :shown
                invoke-static {p0}, $SYNC->onBecameHidden(Ljava/lang/Object;)V
                return-void
                :shown
                invoke-static {p0}, $SYNC->onBecameVisible(Ljava/lang/Object;)V
                return-void
            """,
        )

        val onDestroyView = fragmentClass.methods.single { it.name == "onDestroyView" && it.parameterTypes.isEmpty() }
        onDestroyView.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $SYNC->onDestroyView(Ljava/lang/Object;)V",
        )
    }
}

private fun MutableClass.addBridge(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    code: String,
) {
    val method = ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        returnType,
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
    ).toMutable()
    method.addInstructions(0, code)
    methods.add(method)
}
