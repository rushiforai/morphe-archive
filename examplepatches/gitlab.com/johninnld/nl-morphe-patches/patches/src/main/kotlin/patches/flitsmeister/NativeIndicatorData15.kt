package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val TASK="Lnl/flitsmeister/earlywarning/network/EarlyWarningNotificationDownloaderTask;"
private const val PARSER="Lnl/flitsmeister/earlywarning/util/EarlyWarningNotificationUtils;"
private const val WARNINGS="Lnl/johninnl/flitsmeister/NativeWarnings;"

/** Original15 SDK29/32 DEX contracts; authored with the existing operand/catch fingerprint. */
private val dataContracts15=mapOf(
    "$TASK->setPostData(Landroid/location/Location;Ljava/lang/String;)$TASK" to FlitsmeisterWarningContract(8,51,1,"70624ffaee4c772c1f854099b4096aa80453f0b71526f655e74843953813ad6f"),
    "$TASK->setPostLocation(Landroid/location/Location;)$TASK" to FlitsmeisterWarningContract(2,5,1,"fde9f1f71ba7f31fc13bcc33734ded7bdb9b9a0df52e3f27f20d5cbfcc026f51"),
    "$TASK->onPostExecute(Lorg/json/JSONObject;)V" to FlitsmeisterWarningContract(3,7,1,"5e8d62f21b2a04e2a57691824edbb336867a366b76759008fe26738bfb67219a"),
    "$PARSER->parseJSONObject(Lorg/json/JSONObject;)Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;" to FlitsmeisterWarningContract(19,138,17,"9344ccf2dfeb2c34e1a14b114e60226ecce8cd4ee04461191bbc341b2ddcd9b5"),
    "Lerb;->a(Landroid/location/Location;)V" to FlitsmeisterWarningContract(12,136,17,"4a2a10a8e990bcaab56c0075a04fc56d1ca9579c33aeae17b863375414ef75b6"),
    "Lzl;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to FlitsmeisterWarningContract(3,23,17,"2836f81223bab74d6693cb3cff616a74d1a8b497f941d5c3c3fb31858db71d95"),
    "Lxl;->e(Landroid/content/Context;Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;)V" to FlitsmeisterWarningContract(3,8,17,"b33faa70a6289edae4b5eb122249387f2c6ff9f80e600a216db6f730118cae55"),
    "Lb65;->y(Landroid/location/Location;Ljava/util/HashSet;)V" to FlitsmeisterWarningContract(11,148,17,"a5292ed38ab66aa00ee928d4f15bbfb57aaa16330b7a9b7c2c2b6c870448f129"),
)

context(context: BytecodePatchContext)
internal fun resolveFlitsmeisterIndicatorData15():Map<String,MutableMethod> = dataContracts15.mapValues{(descriptor,guard)->
    val signature=descriptor.substringAfter("->")
    val parameters=Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map{it.value}.toList()
    exact(descriptor.substringBefore("->"),signature.substringBefore('('),signature.substringAfter(')'),*parameters.toTypedArray()).method.also{method->
        check(method.accessFlags==guard.flags&&method.implementation?.registerCount==guard.registers&&method.instructions.size==guard.count&&flitsmeisterWarningFingerprint(method)==guard.hash){"Changed FM15 indicator data root $descriptor"}
    }
}

internal fun bindFlitsmeisterIndicatorData15(methods:Map<String,MutableMethod>){
    fun method(prefix:String)=methods.entries.single{it.key.startsWith(prefix)}.value
    val requests=listOf(method("$TASK->setPostData("),method("$TASK->setPostLocation("))
    val response=method("$TASK->onPostExecute(")
    val parser=method("$PARSER->parseJSONObject(")
    val maximum=method("Lerb;->a(")
    val started=method("Lzl;->invokeSuspend(")
    val averageCleared=method("Lxl;->e(")
    val country=method("Lb65;->y(")
    val sound="Lfci;->i(ZLjava/lang/String;Ls39;)V"
    fun anchor(m:MutableMethod,reference:String)=m.instructions.withIndex().single{(it.value as? ReferenceInstruction)?.reference?.toString()==reference}.index
    val maximumAt=anchor(maximum,sound)
    val startedAt=anchor(started,sound)
    val clearAt=anchor(maximum,"Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
    check(clearAt!=maximumAt)
    fun originalCall(m:MutableMethod,at:Int):String {
        val invoke=m.instructions[at] as FiveRegisterInstruction;check(m.instructions[at].opcode==Opcode.INVOKE_VIRTUAL)
        val registers=listOf(invoke.registerC,invoke.registerD,invoke.registerE,invoke.registerF,invoke.registerG).take(invoke.registerCount)
        return "invoke-virtual {${registers.joinToString(", "){"v$it"}}}, $sound"
    }
    val maximumCall=originalCall(maximum,maximumAt)
    val startedCall=originalCall(started,startedAt)
    val clearRegister=(maximum.instructions[clearAt] as OneRegisterInstruction).registerA
    val returns=response.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}
    val parsed=parser.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}.map{it.index to (it.value as OneRegisterInstruction).registerA}
    val countryReturns=country.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}
    check(returns.isNotEmpty()&&parsed.isNotEmpty()&&countryReturns.isNotEmpty())
    // Capture facts only. The original parser result, callbacks and exception policy remain intact.
    requests.forEach{it.addInstruction(0,"invoke-static/range {p0 .. p1}, $WARNINGS->earlyRequest(Ljava/lang/Object;Landroid/location/Location;)V")}
    returns.reversed().forEach{at->response.replaceInstruction(at,"invoke-static {}, $WARNINGS->earlyResponseFinished()V");response.addInstruction(at+1,"return-void")}
    response.addInstruction(0,"invoke-static/range {p0 .. p1}, $WARNINGS->earlyResponse(Ljava/lang/Object;Ljava/lang/Object;)V")
    parsed.reversed().forEach{(at,register)->
        parser.replaceInstruction(at,"invoke-static/range {v$register .. v$register}, $WARNINGS->earlyParsed(Ljava/lang/Object;)V")
        parser.addInstruction(at+1,"return-object v$register")
    }
    parser.addInstruction(0,"invoke-static/range {p1 .. p1}, $WARNINGS->earlyParsing(Ljava/lang/Object;)V")
    // These callers are native decisions, unlike SignalScreens.playSound's settings previews.
    // DEX block order is not control-flow order. Insert from the highest original
    // index so the native clear branch and sound call both retain their anchors.
    listOf(
        // R8 reuses p1 for fci by this call. The original controller remains p0
        // and owns the current native fix in its guarded Location field c.
        Triple(maximumAt,"invoke-static/range {p0 .. p0}, $WARNINGS->maximumSpeedFromController(Ljava/lang/Object;)V",maximumCall),
        Triple(clearAt,"invoke-static {}, $WARNINGS->maximumSpeedCleared()V","sget-object v$clearRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
    ).sortedByDescending{it.first}.forEach{(at,hook,original)->maximum.replaceInstruction(at,hook);maximum.addInstruction(at+1,original)}
    started.replaceInstruction(startedAt,"invoke-static {}, $WARNINGS->averageSpeedWarning()V")
    started.addInstruction(startedAt+1,startedCall)
    averageCleared.addInstruction(0,"invoke-static {}, $WARNINGS->averageSpeedCleared()V")
    countryReturns.reversed().forEach{at->country.replaceInstruction(at,"invoke-static/range {p0 .. p0}, $WARNINGS->countryEnd(Ljava/lang/Object;)V");country.addInstruction(at+1,"return-void")}
    country.addInstruction(0,"invoke-static/range {p0 .. p1}, $WARNINGS->countryBegin(Ljava/lang/Object;Landroid/location/Location;)V")
}
