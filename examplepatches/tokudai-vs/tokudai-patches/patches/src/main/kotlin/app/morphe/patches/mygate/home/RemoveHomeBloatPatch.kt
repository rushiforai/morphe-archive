/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.mygate.shared.Constants.COMPATIBILITY_MYGATE

@Suppress("unused")
val removeHomeBloatPatch = patch(
    name = "Remove home screen bloat",
    description = "Hides community posts from the home screen and filters unused shortcuts from Quick Actions.",
) {
    compatibleWith(COMPATIBILITY_MYGATE)

    execute {
        // Hide Community Posts Section on Home Screen
        resourceXml("res/layout/fragment_home_screen.xml").use { xml ->
            val targetIds = setOf("@id/tvCommunity", "@id/community_list_layout")
            xml.elements().forEach { element ->
                if (element.attribute("android:id") in targetIds) {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                }
            }
        }

        // Filter Quick Actions in HomeScreenViewModel.b(ArrayList)
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/dashboard/ui/viewmodels/HomeScreenViewModel;",
            name = "b",
            returnType = "V",
            parameters = listOf("Ljava/util/ArrayList;"),
        ).method.addInstructions(
            0,
            """
                if-eqz p0, :cond_vm_filter_end
                invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :cond_vm_loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :cond_vm_filter_end
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lcom/mygate/user/modules/dashboard/entity/Widgets;
                if-eqz v1, :cond_vm_loop

                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/Widgets;->getTitle()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_vm_check_action
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_vm_check_action
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_vm_loop

                :cond_vm_check_action
                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/Widgets;->getAction()Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;
                move-result-object v1
                if-eqz v1, :cond_vm_loop

                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;->getAction_name()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_vm_check_action_id
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_vm_check_action_id
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_vm_loop

                :cond_vm_check_action_id
                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;->getAction_id()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_vm_loop
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_vm_loop
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_vm_loop

                :cond_vm_filter_end
            """,
        )

        // Filter Quick Actions in HomeScreenFragment.t0(HomeScreenFragment, ArrayList)
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/dashboard/ui/fragments/HomeScreenFragment;",
            name = "t0",
            returnType = "V",
            parameters = listOf(
                "Lcom/mygate/user/modules/dashboard/ui/fragments/HomeScreenFragment;",
                "Ljava/util/ArrayList;",
            ),
        ).method.addInstructions(
            0,
            """
                if-eqz p1, :cond_frag_filter_end
                invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :cond_frag_loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :cond_frag_filter_end
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lcom/mygate/user/modules/dashboard/entity/Widgets;
                if-eqz v1, :cond_frag_loop

                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/Widgets;->getTitle()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_frag_check_action
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_frag_check_action
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_frag_loop

                :cond_frag_check_action
                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/Widgets;->getAction()Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;
                move-result-object v1
                if-eqz v1, :cond_frag_loop

                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;->getAction_name()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_frag_check_action_id
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_frag_check_action_id
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_frag_loop

                :cond_frag_check_action_id
                invoke-virtual {v1}, Lcom/mygate/user/modules/dashboard/entity/LaunchPadAction;->getAction_id()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :cond_frag_loop
                const-string v3, "(?i).*(community|feed|smart\\s*device|marketplace|setting).*"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v2
                if-eqz v2, :cond_frag_loop
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :cond_frag_loop

                :cond_frag_filter_end
            """,
        )
    }
}
