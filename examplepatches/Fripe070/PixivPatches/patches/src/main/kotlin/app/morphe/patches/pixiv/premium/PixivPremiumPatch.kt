package app.morphe.patches.pixiv.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivPremiumPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Premium Features",
    description = "Unlocks popularity sort sorting (popular_desc) in search, removes mute limits, and emulates client-side Pixiv Premium membership status.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Pixiv",
            packageName = "jp.pxv.android",
            targets = listOf(AppTarget("6.196.0"))
        )
    )

    extendWith("extensions/pixiv.mpe")

    execute {
        // 1. Hook OAuthUser.l0()Z -> always return true
        val oauthUserClass = mutableClassDefBy("Ljp/pxv/android/domain/auth/entity/OAuthUser;")
        val l0Method = oauthUserClass.methods.first { it.name == "l0" && it.returnType == "Z" }
        l0Method.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )

        // 2. Hook ProfileApiModel.f()Z -> always return true
        val profileApiClass = mutableClassDefBy("Ljp/pxv/android/data/userstate/remote/dto/ProfileApiModel;")
        val fMethod = profileApiClass.methods.first { it.name == "f" && it.returnType == "Z" }
        fMethod.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )

        // 3. Hook domain entity ca8.<init> -> force isPremium (p6) to true
        val domainProfileClass = mutableClassDefByOrNull("Lca8;")
        domainProfileClass?.let { cls ->
            val ctor = cls.methods.firstOrNull { it.name == "<init>" }
            ctor?.addInstructions(
                1,
                "const/4 p6, 0x1"
            )
        }

        // 4. Hook MuteSettingResponse:
        //    a()I -> return 9999 (unlimited mute limit count)
        //    c()Ljava/util/List; -> return merged muted tags (server + local)
        //    d()Ljava/util/List; -> return merged muted users (server + local)
        val muteSettingClass = mutableClassDefByOrNull("Ljp/pxv/android/data/mute/remote/dto/MuteSettingResponse;")
        muteSettingClass?.let { cls ->
            val aMethod = cls.methods.firstOrNull { it.name == "a" && it.returnType == "I" }
            aMethod?.addInstructions(
                1,
                """
                const/16 v0, 0x270f
                return v0
                """.trimIndent()
            )
            val cMethod = cls.methods.firstOrNull { it.name == "c" && it.returnType == "Ljava/util/List;" }
            cMethod?.addInstructions(
                0,
                """
                invoke-static {p0}, Lapp/morphe/extension/pixiv/premium/MuteHelper;->getMergedMutedTags(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
            val dMethod = cls.methods.firstOrNull { it.name == "d" && it.returnType == "Ljava/util/List;" }
            dMethod?.addInstructions(
                0,
                """
                invoke-static {p0}, Lapp/morphe/extension/pixiv/premium/MuteHelper;->getMergedMutedUsers(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
        }

        // Hook ob6.<init> to capture mute additions and removals into local storage
        val ob6Class = mutableClassDefByOrNull("Lob6;")
        ob6Class?.let { cls ->
            val ctor = cls.methods.firstOrNull { it.name == "<init>" }
            ctor?.addInstructions(
                1,
                """
                invoke-static {p1, p2, p3, p4}, Lapp/morphe/extension/pixiv/premium/MuteHelper;->onMuteSettingUpdated(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
                """.trimIndent()
            )
        }

        // Hook sa6.<init> to initialize in-memory mute maps from local storage immediately on startup
        val sa6Class = mutableClassDefByOrNull("Lsa6;")
        sa6Class?.let { cls ->
            val ctor = cls.methods.firstOrNull { it.name == "<init>" }
            ctor?.let { method ->
                val returnIdx = method.implementation?.instructions?.indexOfLast {
                    it.opcode.name.startsWith("return")
                } ?: -1
                if (returnIdx >= 0) {
                    method.addInstructions(
                        returnIdx,
                        """
                        invoke-static {p0}, Lapp/morphe/extension/pixiv/premium/MuteHelper;->initSa6(Ljava/lang/Object;)V
                        """.trimIndent()
                    )
                }
            }
        }

        // Hook MuteSettingActivity.onCreate to inject the Import/Export UI
        val muteActivityClass = mutableClassDefByOrNull("Ljp/pxv/android/feature/mute/setting/MuteSettingActivity;")
        muteActivityClass?.let { cls ->
            val onCreateMethod = cls.methods.firstOrNull { it.name == "onCreate" }
            onCreateMethod?.addInstructions(
                1,
                """
                invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/premium/MuteHelper;->setupMuteSettingsActivity(Landroid/app/Activity;)V
                """.trimIndent()
            )
        }

        // 5. Hook MuteLimitForTextApiModel -> return 9999 for both free and premium mute limits
        val muteTextLimitClass = mutableClassDefByOrNull("Ljp/pxv/android/data/mute/remote/dto/MuteLimitForTextApiModel;")
        muteTextLimitClass?.let { cls ->
            val aMethod = cls.methods.firstOrNull { it.name == "a" && it.returnType == "I" }
            aMethod?.addInstructions(
                1,
                """
                const/16 v0, 0x270f
                return v0
                """.trimIndent()
            )
            val bMethod = cls.methods.firstOrNull { it.name == "b" && it.returnType == "I" }
            bMethod?.addInstructions(
                1,
                """
                const/16 v0, 0x270f
                return v0
                """.trimIndent()
            )
        }

        // 6. Hook IllustBrowsingHistoryResponse.a()Ljava/util/List; -> return local history if server history is empty
        val historyResponseClass = mutableClassDefByOrNull("Ljp/pxv/android/data/browsinghistory/remote/dto/IllustBrowsingHistoryResponse;")
        historyResponseClass?.let { cls ->
            val aMethod = cls.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/util/List;" }
            aMethod?.addInstructions(
                1,
                """
                invoke-static {p0}, Lapp/morphe/extension/pixiv/premium/HistoryHelper;->getHistoryList(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
        }

        // 7. Hook eva.x()J -> return 0L (days elapsed since install = 0, so trial never expires)
        val evaClass = mutableClassDefByOrNull("Leva;")
        evaClass?.let { cls ->
            val xMethod = cls.methods.firstOrNull { it.name == "x" && it.returnType == "J" }
            xMethod?.addInstructions(
                0,
                """
                const-wide/16 v0, 0x0
                return-wide v0
                """.trimIndent()
            )
        }

        // 8. Hook he9.a(I)Landroidx/fragment/app/Fragment; -> return te9 (illust) or ne9 (novel) popular preview for all popular sorts
        //    and strip misleading dropdown arrow from Popular tab title
        val searchAdapterClass = mutableClassDefByOrNull("Lhe9;")
        searchAdapterClass?.let { cls ->
            val aMethod = cls.methods.firstOrNull { it.name == "a" && it.returnType == "Landroidx/fragment/app/Fragment;" }
            aMethod?.addInstructions(
                0,
                """
                iget-object v0, p0, Lhe9;->l:Ljava/util/List;
                invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lxe9;
                invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I
                move-result v0
                const/4 v1, 0x2
                if-ge v0, v1, :cond_popular
                goto :cond_normal
                :cond_popular
                iget-object v1, p0, Lhe9;->k:Lgd9;
                sget-object v2, Lxe9;->d:Lxe9;
                invoke-virtual {v1, v2}, Lgd9;->a(Lxe9;)Lgd9;
                move-result-object v1
                iget-object v2, p0, Lhe9;->k:Lgd9;
                iget-object v2, v2, Lgd9;->b:Ljp/pxv/android/domain/commonentity/ContentType;
                invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I
                move-result v2
                const/4 v3, 0x2
                if-ne v2, v3, :cond_illust
                new-instance v0, Lne9;
                invoke-direct {v0}, Lne9;-><init>()V
                new-instance v2, Landroid/os/Bundle;
                invoke-direct {v2}, Landroid/os/Bundle;-><init>()V
                const-string v3, "SEARCH_PARAMETER"
                invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V
                invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V
                return-object v0
                :cond_illust
                new-instance v0, Lte9;
                invoke-direct {v0}, Lte9;-><init>()V
                new-instance v2, Landroid/os/Bundle;
                invoke-direct {v2}, Landroid/os/Bundle;-><init>()V
                const-string v3, "SEARCH_PARAMETER"
                invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V
                invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V
                return-object v0
                :cond_normal
                """.trimIndent()
            )

            val getPageTitleMethod = cls.methods.firstOrNull { it.name == "getPageTitle" && it.returnType == "Ljava/lang/CharSequence;" }
            getPageTitleMethod?.addInstructions(
                0,
                """
                iget-object v0, p0, Lhe9;->l:Ljava/util/List;
                invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lxe9;
                invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I
                move-result v0
                iget-object v1, p0, Lhe9;->h:Landroid/content/Context;
                if-nez v0, :cond_check_old
                const v0, 0x7f1302e5
                invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
                :cond_check_old
                const/4 v2, 0x1
                if-ne v0, v2, :cond_check_pop
                const v0, 0x7f1302e6
                invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
                :cond_check_pop
                const v0, 0x7f1302e7
                invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object v0
                return-object v0
                """.trimIndent()
            )
        }

        // 9. Suppress trial countdown (pe9) and premium upsell banner (je9) in popular search
        val pe9Class = mutableClassDefByOrNull("Lpe9;")
        pe9Class?.let { cls ->
            val dMethod = cls.methods.firstOrNull { it.name == "d" && it.returnType == "Z" }
            dMethod?.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent()
            )
        }
        val je9Class = mutableClassDefByOrNull("Lje9;")
        je9Class?.let { cls ->
            val dMethod = cls.methods.firstOrNull { it.name == "d" && it.returnType == "Z" }
            dMethod?.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent()
            )
        }

        // 10. Suppress non-functional gender dropdown dialog on Popular tab (wd9.b)
        val tabReselectedClass = mutableClassDefByOrNull("Lwd9;")
        tabReselectedClass?.let { cls ->
            val bMethod = cls.methods.firstOrNull { it.name == "b" && it.returnType == "V" }
            bMethod?.addInstructions(
                0,
                """
                return-void
                """.trimIndent()
            )
        }
    }
}
