package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val HOME_FRAGMENT = "LIIIIIIlIllIIlIIl;"
private const val FRAGMENT = "Landroidx/fragment/app/IIllIIlllIIIl;"

internal val homeLoadingPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val fragment = mutableClassDefBy(HOME_FRAGMENT)
        check(fragment.methods.none { it.name == "run" && it.parameterTypes.isEmpty() })
        check(fragment.interfaces.add("Ljava/lang/Runnable;"))
        check(fragment.fields.add(MutableField(ImmutableField(
            HOME_FRAGMENT, "morpheHomeRecovered", "Z",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null, emptySet(), emptySet(),
        ))))

        val retry = MutableMethod(ImmutableMethod(
            HOME_FRAGMENT, "run", emptyList(), "V", AccessFlags.PUBLIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
        ))
        retry.addInstructionsWithLabels(
            0,
            """
                invoke-virtual {p0}, $FRAGMENT->isResumed()Z
                move-result v0
                if-eqz v0, :done
                invoke-virtual {p0}, $FRAGMENT->getView()Landroid/view/View;
                move-result-object v0
                if-eqz v0, :done
                invoke-virtual {v0}, Landroid/view/View;->isShown()Z
                move-result v0
                if-eqz v0, :done
                iget-object v0, p0, LIIIlIlIIIIllll;->IlllllIIIIIIlIII:Landroidx/recyclerview/widget/RecyclerView;
                if-eqz v0, :done
                invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I
                move-result v1
                add-int/lit8 v1, v1, -0x1
                if-nez v1, :done
                invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
                move-result-object v0
                instance-of v1, v0, LllIlIllIIIIllll;
                if-eqz v1, :done
                sget-boolean v0, $HOME_FRAGMENT->morpheHomeRecovered:Z
                if-nez v0, :done
                const/4 v0, 0x1
                sput-boolean v0, $HOME_FRAGMENT->morpheHomeRecovered:Z
                invoke-virtual {p0}, $FRAGMENT->requireActivity()Landroidx/fragment/app/IllIlIlllllllIIl;
                move-result-object v0
                invoke-virtual {v0}, Landroid/app/Activity;->recreate()V
                :done
                return-void
            """.trimIndent(),
        )
        check(fragment.methods.add(retry))

        val resumed = fragment.methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }
        // Recognize the native loading row without relying on its child-view order.
        // Schedule after resume: the view may exist behind the sign-in screen for longer than the delay.
        // Recreate once per process to reset the first-login loading state; never loop on network errors.
        resumed.addInstructionsWithLabels(
            1,
            """
                invoke-virtual {p0}, $FRAGMENT->requireArguments()Landroid/os/Bundle;
                move-result-object v0
                const-string v1, "page_key"
                invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "home"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :continue
                invoke-virtual {p0}, $FRAGMENT->getView()Landroid/view/View;
                move-result-object v2
                if-eqz v2, :continue
                const-wide/16 v0, 0x1770
                invoke-virtual {v2, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
                :continue
                nop
            """.trimIndent(),
        )
    }
}
