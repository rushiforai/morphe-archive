.class public final synthetic Ll/ev6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreAITranslate;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreAITranslate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ev6;->a:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ev6;->a:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    check-cast p1, Lcom/p1/mobile/putong/data/AiTranslateLanguageBean;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreAITranslate;->e3(Lcom/p1/mobile/putong/core/api/CoreAITranslate;Lcom/p1/mobile/putong/data/AiTranslateLanguageBean;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
