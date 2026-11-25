package patches.flitsmeister

import com.android.tools.smali.dexlib2.iface.Method

/** FM15.0/1289 SDK29 original base09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea;
 * SDK32 base7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0 has identical DEX.
 * These are whole original operand/catch fingerprints, not InspectBindings JSON digests. */
internal val flitsmeisterWarningContracts15=mapOf(
    "Lfc0;->J(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Z)V" to FlitsmeisterWarningContract(25, 1505, 17, "c565f442ea643a93d7fec48ae896886a6671381bfba13bd97921b71490d23f8e"),
    "Lfc0;->P(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V" to FlitsmeisterWarningContract(6, 71, 17, "7636b521b82077f3c861e95e54ef47d1e538f1b16b3e1227e67df1a7adf6f660"),
    "Lfc0;->x(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V" to FlitsmeisterWarningContract(27, 615, 17, "a62c1f68199bd2f998ca61d76cbf345fe8aee72af5bc26678929ee0a660e40f2"),
    "Lfci;->b(Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;Lnl/flitsmeister/fmcore/models/data/reports/EarlyWarningReport;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;Ljava/lang/String;ZLs39;)V" to FlitsmeisterWarningContract(18, 40, 17, "eb7cf19ce3126d2ab61af278c45775a365d597f4191d689fd84e4a97fa4f1671"),
    "Lfci;->l(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;ZZLjava/lang/String;Ls39;)V" to FlitsmeisterWarningContract(16, 136, 17, "1d66b35f1c13fdae3339717ee95d8d45c2133a7c6f8ee1e34be55a7753817021"),
    "Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V" to FlitsmeisterWarningContract(15, 248, 17, "2c802ad1df6b67173121f32fe873bb2e7d3d43965e4efd50aa6e82dea5214ece"),
    "Lpz2\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to FlitsmeisterWarningContract(10, 53, 17, "0d856efda837fcf136dfcea49aae0239468fcf31e5323c6662d6b94c2d7494ef"),
    "Lpz2;->J(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(31, 279, 17, "ad5c842dfcdaa8a9c5cc304fd0289eaf8a88126b9ab00d4bb1c00b47de52be66"),
    "Lpz2;->K(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(7, 59, 17, "8967649cb199b0f2ea90fca5f91985ca9892f06ef6a555c99d20208c43bb21d7"),
    "Lpz2;->L(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(20, 102, 17, "8ec5696e8bea9caebd285f7d931a79e61795450df300e8f890d12e3d1d0ff0ac"),
    "Lxl\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to FlitsmeisterWarningContract(14, 119, 17, "f13e0628bf72ea5bea8a4febcf91675c33663fd591c88922691e094a4a104233"),
    "Lxl;->i(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/data/earlywarnings/EarlyWarning;Z)V" to FlitsmeisterWarningContract(11, 69, 17, "f44c739291b1967298ae82e9b28394d3af9a340a9cff8fa0a315d734e367cff2"),
    "Lyy2;->a(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(12, 192, 17, "71885b720af90c5a9f668fe5df8aba5f6a7856c27ae2c520444a923ec18812a0"),
    "Lyy2;->b(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(13, 187, 17, "d48f5854eb9d1d90881e018838e52df8cfdfcea143cf884affa2bedda5e8e5ab"),
    "Lyy2;->e(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(10, 127, 17, "1456a80cd5ea7353b0c6046aa76948ae752c159018665b059d968e764826a278"),

)

internal const val FLITSMEISTER15_EARLY_NOTIFICATION_ROOT="Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V"
/** Exactly FeatureUi15's guarded const/16 v0,1 insertion at original index13. */
internal const val FLITSMEISTER15_EARLY_FEATURE_UI_HASH="983926e18e26b9579ba63245e48638dd02d555699c39f78f5164b9139576f3f3"

internal fun validateFlitsmeisterWarningMethods15(methods:Map<String,Method>) {
    check(methods.keys==flitsmeisterWarningContracts15.keys){"Missing or unexpected FM15 warning roots"}
    flitsmeisterWarningContracts15.forEach{(signature,contract)->
        val method=methods.getValue(signature);val body=method.implementation
        val count=body?.instructions?.count();val hash=if(body==null)"" else flitsmeisterWarningFingerprint(method)
        val original=count==contract.count&&hash==contract.hash
        val selectedFeatureUi=signature==FLITSMEISTER15_EARLY_NOTIFICATION_ROOT&&count==contract.count+1&&hash==FLITSMEISTER15_EARLY_FEATURE_UI_HASH
        check(method.toString()==signature&&method.accessFlags==contract.flags&&body?.registerCount==contract.registers&&(original||selectedFeatureUi)){
            "Changed or already patched FM15 warning root $signature"
        }
    }
}
