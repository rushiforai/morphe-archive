package patches.trouw

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAPPER = "${APP}article/data/converters/ArticleBodyBlockDtoMapper;"
private const val DTO = "${APP}article/data/datasource/remote/dto/BlockDto"

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installArticleFilter() {
    val anchor = exact(MAPPER,"invoke","Ljava/util/List;","Ljava/util/List;")
    val cls = anchor.classDef
    check(cls.methods.none { it.name.startsWith("morphe") }) { "Trouw article filter already present" }
    cls.methods.add(helper(MAPPER,"morpheArticleBlocks","Ljava/util/List;",listOf("Ljava/util/List;"),5,"""
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :loop
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        instance-of v3, v2, $DTO${'$'}AdvertisementBlockDto;
        if-nez v3, :loop
        invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        goto :loop
        :done
        return-object v0
    """))
    anchor.method.addInstructions(0,"invoke-static {p1}, $MAPPER->morpheArticleBlocks(Ljava/util/List;)Ljava/util/List;\nmove-result-object p1")
    cls.methods.add(helper(MAPPER,"morpheOverviewComponents","Ljava/util/List;",listOf("Ljava/util/List;"),4,"""
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :loop
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        instance-of v3, v2, ${APP}overview/data/dto/OverviewPageComponentDto${'$'}Advertisement;
        if-nez v3, :loop
        invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        goto :loop
        :done
        return-object v0
    """))
    change("${APP}overview/data/dto/OverviewPageDto;","getPageComponents()Ljava/util/List;","""
        iget-object v0, p0, ${APP}overview/data/dto/OverviewPageDto;->pageComponents:Ljava/util/List;
        invoke-static {v0}, $MAPPER->morpheOverviewComponents(Ljava/util/List;)Ljava/util/List;
        move-result-object v0
        return-object v0
    """)
}

/** Reject the whole sponsored story before the app maps a successful repository
 * result into article UI. Never remove a disclosure and retain its paid body. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installAdvertorialGuard() {
    val article = "${APP}article/domain/model/Article;"
    val style = "${APP}article/domain/model/ArticleStyle\$Advertorial;"
    val header = "${APP}article/domain/model/AdvertorialHeader;"
    val result = "Lnl/persgroep/domain/base/ResultOf;"
    exact(article,"getStyle","${APP}article/domain/model/ArticleStyle;").method
    exact(article,"getBody","Ljava/util/List;").method
    exact(style,"<init>").method
    exact(header,"getBlockId","Ljava/lang/String;").method
    exact("Lnl/persgroep/domain/base/GeneralDomainError\$Other;","<init>").method
    exact("Lnl/persgroep/domain/base/ResultOfKt;","error","Lnl/persgroep/domain/base/ResultOf\$Error;","Ljava/lang/Object;").method
    val cls = exact(MAPPER,"invoke","Ljava/util/List;","Ljava/util/List;").classDef
    check(cls.methods.none { it.name == "morpheFilterAdvertorialResult" })
    cls.methods.add(helper(MAPPER,"morpheArticleIsAdvertorial","Z",listOf(article),3,"""
        invoke-virtual {p0}, $article->getStyle()${APP}article/domain/model/ArticleStyle;
        move-result-object v0
        instance-of v0, v0, $style
        if-nez v0, :sponsored
        invoke-virtual {p0}, $article->getBody()Ljava/util/List;
        move-result-object v0
        invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v0
        :loop
        invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
        move-result v1
        if-eqz v1, :editorial
        invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v1
        instance-of v2, v1, $header
        if-nez v2, :sponsored
        goto :loop
        :editorial
        const/4 v0, 0x0
        return v0
        :sponsored
        const/4 v0, 0x1
        return v0
    """))
    cls.methods.add(helper(MAPPER,"morpheFilterAdvertorialResult",result,listOf(result),2,"""
        instance-of v0, p0, Lnl/persgroep/domain/base/ResultOf${'$'}Success;
        if-eqz v0, :unchanged
        move-object v0, p0
        check-cast v0, Lnl/persgroep/domain/base/ResultOf${'$'}Success;
        invoke-virtual {v0}, Lnl/persgroep/domain/base/ResultOf${'$'}Success;->getValue()Ljava/lang/Object;
        move-result-object v0
        instance-of v1, v0, $article
        if-eqz v1, :unchanged
        check-cast v0, $article
        invoke-static {v0}, $MAPPER->morpheArticleIsAdvertorial($article)Z
        move-result v0
        if-eqz v0, :unchanged
        sget-object v0, Lnl/persgroep/domain/base/GeneralDomainError${'$'}Other;->INSTANCE:Lnl/persgroep/domain/base/GeneralDomainError${'$'}Other;
        invoke-static {v0}, Lnl/persgroep/domain/base/ResultOfKt;->error(Ljava/lang/Object;)Lnl/persgroep/domain/base/ResultOf${'$'}Error;
        move-result-object v0
        return-object v0
        :unchanged
        return-object p0
    """))
    // Both synchronous and resumed results merge at these two casts. The public
    // getArticle method tail-suspends, so guarding only its return misses resumes.
    val ordinary = exact("${APP}article/data/repository/ArticleRepositoryImpl\$getArticle\$2;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;").method
    val code = ordinary.instructions.toList()
    val casts = code.withIndex().filter { (i, instruction) ->
        instruction.opcode == Opcode.CHECK_CAST &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == result &&
            code.getOrNull(i+1)?.opcode == Opcode.RETURN_OBJECT
    }
    check(casts.size == 2) { "Trouw ordinary/classic completed-result branches changed" }
    casts.asReversed().forEach { (i,instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        check((code[i+1] as OneRegisterInstruction).registerA == register)
        ordinary.addInstructions(i+1,"invoke-static {v$register}, $MAPPER->morpheFilterAdvertorialResult($result)$result\nmove-result-object v$register")
    }
    // Moment deep links have their own endpoint/mapping. Its sole final map is
    // after the suspended/resumed merge, before returning a completed ResultOf.
    val moment = exact("${APP}article/data/repository/ArticleRepositoryImpl\$getArticleMoment\$2;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;").method
    val momentCode = moment.instructions.toList()
    val maps = momentCode.withIndex().filter { (_,instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lnl/persgroep/domain/base/ResultOfKt;" && ref.name == "map" && ref.returnType == result
    }
    check(maps.size == 1) { "Trouw moment completed mapping changed" }
    val index = maps.single().index
    check(momentCode[index+1].opcode == Opcode.MOVE_RESULT_OBJECT && momentCode[index+2].opcode == Opcode.RETURN_OBJECT)
    val register = (momentCode[index+1] as OneRegisterInstruction).registerA
    check((momentCode[index+2] as OneRegisterInstruction).registerA == register)
    moment.addInstructions(index+2,"invoke-static {v$register}, $MAPPER->morpheFilterAdvertorialResult($result)$result\nmove-result-object v$register")
}
