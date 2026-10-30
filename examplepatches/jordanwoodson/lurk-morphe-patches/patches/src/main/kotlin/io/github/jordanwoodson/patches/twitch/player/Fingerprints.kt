package io.github.jordanwoodson.patches.twitch.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val DRAGGABLE = "Ltv/twitch/android/shared/ui/elements/draggable/"

// Twitch's IVS player wrapper: the live latency of its MediaPlayer, -1 without one.
internal object NativePlayerLatencyFingerprint : Fingerprint(
    returnType = "J", parameters = emptyList(),
    filters = listOf(
        fieldAccess(type = "Lcom/amazonaws/ivs/player/MediaPlayer;", opcode = Opcode.IGET_OBJECT),
        methodCall(name = "getLiveLatency", returnType = "J"),
    ),
)

// The base class of the native player presenters (live, VOD, clips, vertical): its property delegates
// keep their Kotlin names.
internal object PlayerPresenterFingerprint : Fingerprint(
    name = "<clinit>", strings = listOf("playerStateAndEventDisposable", "followStatusDisposable"),
)

// The player error screen's Retry button: its last parameter is the action that retries the player.
internal object PlayerErrorRetryFingerprint : Fingerprint(
    returnType = "V", strings = listOf("At least one non-null argument is required"),
)

// The classic VOD and clip player overlay (player_control_overlay_widget) finding its settings button.
internal object VodPlayerOverlayFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "share_button"),
        resourceLiteral(ResourceType.ID, "settings_button"),
        resourceLiteral(ResourceType.ID, "play_pause_fast_seek_view"),
    ),
)

// The classic live theatre inflating its player overlay (player_control_overlay) and finding its buttons.
internal object LivePlayerOverlayFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "player_control_overlay"),
        resourceLiteral(ResourceType.ID, "settings_button"),
        resourceLiteral(ResourceType.ID, "share_button"),
    ),
)

// The native player's gesture listener: Twitch emits a long press with its position, then ignores it.
internal object PlayerLongPressFingerprint : Fingerprint(
    name = "onLongPress", returnType = "V", parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/view/MotionEvent;", name = "getX", parameters = emptyList()),
        methodCall(definingClass = "Landroid/view/MotionEvent;", name = "getY", parameters = emptyList()),
    ),
    custom = { _, classDef -> classDef.superclass == "Landroid/view/GestureDetector\$SimpleOnGestureListener;" },
)

// The classic VOD overlay's rewind and forward buttons: -10 and +30 seconds, sent on touch down.
internal object VodSeekTouchFingerprint : Fingerprint(
    name = "onTouch", returnType = "Z", parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
    filters = listOf(
        literal(-10),
        methodCall(definingClass = "Ljava/lang/Integer;", name = "valueOf"),
        literal(30),
        methodCall(definingClass = "Ljava/lang/Integer;", name = "valueOf"),
    ),
)

// The view holding those buttons (play_pause_fast_seek_view).
internal object VodSeekViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "seek_rewind_button"),
        resourceLiteral(ResourceType.ID, "seek_rewind_amount_text_view"),
        resourceLiteral(ResourceType.ID, "seek_forward_button"),
    ),
)

// The vertical VOD theatre's Compose skip buttons: 10 and 30 seconds with their talkback and icon.
internal object VerticalVodSeekFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "rewind_10_vod_talkback"),
        resourceLiteral(ResourceType.DRAWABLE, "skip_backwards_10"),
        resourceLiteral(ResourceType.STRING, "forward_30_vod_talkback"),
        resourceLiteral(ResourceType.DRAWABLE, "skip_forward_30"),
    ),
)

// The media notification and session's VOD seeks, in milliseconds, tagged with the seek's origin.
internal object MediaSeekBackFingerprint : Fingerprint(
    returnType = "V", parameters = emptyList(),
    filters = listOf(literal(-10000), fieldAccess(name = "BACK_BUTTON", opcode = Opcode.SGET_OBJECT)),
)

internal object MediaSeekForwardFingerprint : Fingerprint(
    returnType = "V", parameters = emptyList(),
    filters = listOf(literal(30000), fieldAccess(name = "FORWARD_BUTTON", opcode = Opcode.SGET_OBJECT)),
)

// Every use of an icon that draws Twitch's 10 or 30: the overlay, Compose and notification buttons.
internal object SeekIconFingerprint : Fingerprint(
    filters = listOf(anyInstruction(
        resourceLiteral(ResourceType.DRAWABLE, "ic_rewind_10"),
        resourceLiteral(ResourceType.DRAWABLE, "ic_forward_30"),
        resourceLiteral(ResourceType.DRAWABLE, "skip_backwards_10"),
        resourceLiteral(ResourceType.DRAWABLE, "skip_forward_30"),
    )),
)

// The theatre root of every player screen (classic, vertical, portal, React Native). Both classes are
// named in layout XML, so they keep their names, and these are framework overrides.
internal object TheatreInterceptFingerprint : Fingerprint(
    definingClass = "${DRAGGABLE}DraggableConstraintLayout;", name = "onInterceptTouchEvent",
    returnType = "Z", parameters = listOf("Landroid/view/MotionEvent;"),
)

internal object TheatreTouchFingerprint : Fingerprint(
    definingClass = "${DRAGGABLE}ConstraintTheatreContainerView;", name = "onTouchEvent",
    returnType = "Z", parameters = listOf("Landroid/view/MotionEvent;"),
)

// The native player's load into IVS (live, VOD, clips; classic, vertical and portal), which tags the
// session with the player type and channel before loading.
internal object NativePlayerLoadFingerprint : Fingerprint(
    returnType = "V", strings = listOf("player", "channel_id"),
    filters = listOf(
        methodCall(definingClass = "Lcom/amazonaws/ivs/player/SessionConfig;", name = "addAnalyticsProperty"),
        fieldAccess(type = "Lcom/amazonaws/ivs/player/MediaPlayer;", opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = "Lcom/amazonaws/ivs/player/MediaPlayer;", name = "load"),
    ),
)

// The Create Clip button's state, shared by the live overlay, the VOD/clip overlay and vertical theatre.
internal object ClipButtonStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ClipButtonUiState(isClipButtonVisible=", ", isClippingEnabled="),
)

// The live player overlay's options: share and clip. R8 folds the constant info fields into the first
// label, and Morphe Patcher 2.0 compares fingerprint strings exactly, so the label is given whole.
internal object PlayerOverlayOptionsFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf(
        "PlayerOverlayOptions(isInfoOptionVisible=false, infoOptionContentDescription=null, isShareOptionVisible=",
        ", isClipOptionVisible=",
    ),
)

// AndroidX MediaRouter's cast button (library class, not renamed).
internal object CastButtonVisibilityFingerprint : Fingerprint(
    definingClass = "Landroidx/mediarouter/app/MediaRouteButton;",
    name = "setVisibility", returnType = "V", parameters = listOf("I"),
)

internal object CastButtonAttachedFingerprint : Fingerprint(
    definingClass = "Landroidx/mediarouter/app/MediaRouteButton;",
    name = "onAttachedToWindow", returnType = "V", parameters = emptyList(),
)

// The VOD/clip ("seekable") player overlay: its share button is only shown by the layout default.
internal object SeekableOverlayFingerprint : Fingerprint(
    name = "<init>", returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/view/View;", "L", "L", "L", "L"),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "create_clip_button_compose_view"),
        resourceLiteral(ResourceType.ID, "share_button"),
        resourceLiteral(ResourceType.ID, "media_route_button"),
    ),
)

// Vertical theatre's Share action (Compose): (onClick, Composer, changed).
internal object VerticalShareActionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("L", "L", "I"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "share"),
        resourceLiteral(ResourceType.DRAWABLE, "share_android"),
    ),
)

// Fill screen: the native player's display types (AspectRatio, ForceCrop, MatchWidth), an enum whose
// constants keep their names.
internal object PlayerDisplayTypeFingerprint : Fingerprint(
    name = "<clinit>", strings = listOf("AspectRatio", "ForceCrop", "MatchWidth"),
)

// Fill screen: the native player view delegate (player_view_delegate) finding its video container, error
// frame and captions.
internal object PlayerViewDelegateFingerprint : Fingerprint(
    name = "<init>", returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "playback_view_container"),
        resourceLiteral(ResourceType.ID, "error_frame"),
        resourceLiteral(ResourceType.ID, "cc_tv"),
    ),
)

// Fill screen: Twitch's insets listener for its full-screen containers, the theatre's among them. It pads the
// view by the WindowInsetsCompat types systemBars | ime | displayCutout (0x28f), or without the cutout (0x20f).
internal object FullscreenInsetsFingerprint : Fingerprint(
    name = "onApplyWindowInsets", returnType = "L", parameters = listOf("Landroid/view/View;", "L"),
    filters = listOf(
        literal(0x28f),
        literal(0x20f),
        methodCall(smali = "Landroid/view/View;->setPadding(IIII)V"),
    ),
)

// Fill screen: the React Native player's surface sizing for its player view (the class keeps its name).
internal object RNSurfaceMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/twitchrn/player/PlaybackSurface;", name = "measureForContent", returnType = "V",
    parameters = listOf("I", "I", "F", "Lcom/amazonaws/ivs/player/ResizeMode;"),
)
