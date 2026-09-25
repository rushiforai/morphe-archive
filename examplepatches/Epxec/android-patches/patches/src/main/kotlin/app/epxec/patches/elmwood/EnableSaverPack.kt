package app.epxec.patches.elmwood

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Elmwood
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.elmwood.Fingerprints.ElmwoodPurchaseCheckFingerprint
import app.epxec.patches.elmwood.Fingerprints.ElmwoodPurchaseConversionFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Saver Pack",
    description = "Enables side trail and no ads",
    default = true
) {
    compatibleWith(COMPATIBILITY_Elmwood)

    dependsOn(changePackageInstallerPatch())

    execute {

        val iteratorCallIndex = ElmwoodPurchaseCheckFingerprint.instructionMatches[0].index


        ElmwoodPurchaseCheckFingerprint.method.addInstructions(
            iteratorCallIndex,
            """
                    const/4 v1, 0x0    # Purchase = null
                    const/4 v2, 0x0    # third String = null

                    invoke-static {v1, p0, v2}, Lqw;->d(
                        Lcom/android/billingclient/api/Purchase;
                        Ljava/lang/String;
                        Ljava/lang/String;
                    )Lr24;

                    move-result-object v1

                    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

            """
        )

        ElmwoodPurchaseConversionFingerprint.method.addInstructions(
            0,
            """
                    new-instance v0, Lr24;

                    # 1: auto-renewing
                    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

                    # 2: plan ID
                    const/4 v2, 0x0

                    # 3: original JSON
                    const-string v3, "<original purchase JSON>"

                    # 4: developer payload
                    const-string v4, ""

                    # 5: purchase ID
                    const-string v5, "GPA.1234-5678-9012-34567"

                    # 15: product ID; also used to construct argument 6
                    const-string v15, "saver_pack"

                    # 6: product IDs
                    invoke-static {v15}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
                    move-result-object v6

                    # 7: acknowledged
                    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

                    # 8: auto-renewing boolean
                    const/4 v8, 0x0

                    # 9–11: suspension, account ID, profile ID
                    const/4 v9, 0x0
                    const/4 v10, 0x0
                    const/4 v11, 0x0

                    # 12: package name
                    const-string v12, "<app package name>"

                    # 13: pending purchase update
                    const/4 v13, 0x0

                    # 14: Android platform
                    sget-object v14, Lwb2;->a:Lwb2;

                    # 16: Purchased state
                    sget-object v16, Lw24;->c:Lw24;

                    # 17: token
                    const-string v17, "<Google-issued token>"

                    # 18: quantity
                    const/16 v18, 0x1

                    # 19: signature
                    const-string v19, "<Google-issued signature>"

                    # 20: Google store
                    sget-object v20, Lyb2;->e:Lyb2;

                    # 21: double timestamp, occupying v21 AND v22
                    const-wide v21, 0x427a0d0b64000000L

                    # 22: order ID
                    const-string v23, "GPA.1234-5678-9012-34567"

                    invoke-direct/range {v0 .. v23}, Lr24;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;ZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgr3;Lwb2;Ljava/lang/String;Lw24;Ljava/lang/String;ILjava/lang/String;Lyb2;DLjava/lang/String;)V

                    return-object v0

            """
        )

    }

}
