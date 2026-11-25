package patches.flitsmeister

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest

internal data class FlitsmeisterWarningContract(val registers:Int,val count:Int,val flags:Int,val hash:String)

/** FM 14.17 original base SHA-256 17f622c8072c9fd8bd121b872a3733a9a22aaff041d57560f6f3dd59a33ce1b7.
 * Guard fingerprints include registers, operands, payloads and catches; they are independent
 * of the research JSON serialization digest. Validate every root before any mutation. */
internal val flitsmeisterWarningContracts=mapOf(
    "Lcz2;->a(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(12, 192, 17, "5fe468376671af611064f2300170850be1b1aea4911269bf1c7233b30a0f6dfb"),
    "Lcz2;->b(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(13, 188, 17, "6df87855c62012ff6d6cd7e20b0d2fba00fd9cf322e364e56a668c91f96f8cff"),
    "Lcz2;->e(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V" to FlitsmeisterWarningContract(10, 127, 17, "4c623f4e22137e8198cdbbc1bd6d978b268380104fa1624c00c307b5d7f8c6c4"),
    "Lfc0;->J(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Z)V" to FlitsmeisterWarningContract(25, 1483, 17, "b17c5272bd9ea498ffed9929b57e6fc70ad1c21001a02bfafead2747fe9900b3"),
    "Lfc0;->O(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V" to FlitsmeisterWarningContract(6, 71, 17, "49e2008c7e95951721cd2fba175b85436f7e75e288cc27819f5879c631cbd8ae"),
    "Lfc0;->x(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V" to FlitsmeisterWarningContract(27, 610, 17, "a665ab97fee9ca9a25668b2f15ee45ad9ff03c97de2624d7a933fe94384787ac"),
    "Lnh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V" to FlitsmeisterWarningContract(15, 248, 17, "8115750c3ca7b59748b8bc04309bab513f8d7e48bbc4236f1a3cfbbc00be3475"),
    "Ls6i;->b(Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;Lnl/flitsmeister/fmcore/models/data/reports/EarlyWarningReport;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;Ljava/lang/String;ZLz39;)V" to FlitsmeisterWarningContract(18, 40, 17, "a36976cff46f4baffdbf4b8c7b7b9c9cd8370afe67861bd4e7016e1efc2836f5"),
    "Ls6i;->l(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;ZZLjava/lang/String;Lz39;)V" to FlitsmeisterWarningContract(16, 136, 17, "e14029101b2f12c2f28f5f9275bb01fc2f8a609fb41c08a88dd0adc537ad434f"),
    "Lvz2\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to FlitsmeisterWarningContract(10, 53, 17, "acbf9f7a4b841e7be04e49a9c6ff892625064530810c064991e9cb74a2ef179a"),
    "Lvz2;->J(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(31, 279, 17, "d7960887ed7d652aa4c167cb124017a7e42aeb22e59df48c92f4e50abecab3b5"),
    "Lvz2;->K(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(7, 59, 17, "100cd1c70a85dc95ed66c662b85e4f08972c39a905f6ebcb3a258fdc877ffa85"),
    "Lvz2;->L(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z" to FlitsmeisterWarningContract(20, 102, 17, "f8633381c7fd28580808ae7c09712664975745da21aa4e8de3c03d9496a5d6e9"),
    "Lxl\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to FlitsmeisterWarningContract(14, 119, 17, "0e8ba18b72379205f9db4356cd56a5ce73651dbe536b5555ba893c572569f483"),
    "Lxl;->k(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/data/earlywarnings/EarlyWarning;Z)V" to FlitsmeisterWarningContract(11, 69, 17, "a8762e3b155243133569a92d6d6fb189a8d72e48e0d23cca17d29476d6155cb7"),
)

internal const val FLITSMEISTER_EARLY_NOTIFICATION_ROOT="Lnh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V"
/** Exactly FeatureUiPatch's guarded const/16 v0,1 insertion at original index13. */
internal const val FLITSMEISTER_EARLY_FEATURE_UI_HASH="b5b3a0e2bc2782dfae687b5e5d196c691b31c2b1b285f752489688292820cadc"

internal fun validateFlitsmeisterWarningMethods(methods:Map<String,Method>) {
    check(methods.keys==flitsmeisterWarningContracts.keys){"Missing or unexpected Flitsmeister warning roots"}
    flitsmeisterWarningContracts.forEach{(signature,contract)->
        val method=methods.getValue(signature);val body=method.implementation
        val count=body?.instructions?.count();val hash=if(body==null)"" else flitsmeisterWarningFingerprint(method)
        val original=count==contract.count&&hash==contract.hash
        val selectedFeatureUi=signature==FLITSMEISTER_EARLY_NOTIFICATION_ROOT&&count==contract.count+1&&hash==FLITSMEISTER_EARLY_FEATURE_UI_HASH
        check(method.toString()==signature&&method.accessFlags==contract.flags&&body?.registerCount==contract.registers&&(original||selectedFeatureUi)){
            "Changed or already patched Flitsmeister warning root $signature"
        }
    }
}

/** Hash every original instruction operand, switch/array payload and catch range. */
internal fun flitsmeisterWarningFingerprint(method:Method):String {
    val body=method.implementation?:error("Missing Flitsmeister warning body $method")
    val text=buildString{
        append(body.registerCount)
        body.instructions.forEach{i->
            append('|').append(i.opcode).append(':').append((i as? ReferenceInstruction)?.reference?.toString().orEmpty())
            if(i is RegisterRangeInstruction)append('r').append(i.startRegister).append(',').append(i.registerCount)
            if(i is OneRegisterInstruction)append('a').append(i.registerA)
            if(i is TwoRegisterInstruction)append('b').append(i.registerB)
            if(i is ThreeRegisterInstruction)append('c').append(i.registerC)
            if(i is FiveRegisterInstruction)append('f').append(i.registerCount).append(',').append(i.registerC).append(',').append(i.registerD).append(',').append(i.registerE).append(',').append(i.registerF).append(',').append(i.registerG)
            if(i is WideLiteralInstruction)append('l').append(i.wideLiteral)
            if(i is OffsetInstruction)append('o').append(i.codeOffset)
            if(i is SwitchPayload)i.switchElements.forEach{append('s').append(it.key).append(',').append(it.offset)}
            if(i is ArrayPayload){append('w').append(i.elementWidth);i.arrayElements.forEach{append('v').append(it.toLong())}}
        }
        body.tryBlocks.forEach{block->
            append("|try:").append(block.startCodeAddress).append(',').append(block.codeUnitCount)
            block.exceptionHandlers.forEach{append('|').append(it.exceptionType).append('@').append(it.handlerCodeAddress)}
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8)).joinToString(""){"%02x".format(it.toInt() and 255)}
}
