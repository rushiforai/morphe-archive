.class public final synthetic Ll/qnf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;

.field public final synthetic b:Ll/rnf0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;Ll/rnf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qnf0;->a:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;

    iput-object p2, p0, Ll/qnf0;->b:Ll/rnf0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qnf0;->a:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;

    iget-object p0, p0, Ll/qnf0;->b:Ll/rnf0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;

    invoke-static {v0, p0, p1}, Ll/rnf0;->c(Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;Ll/rnf0;Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
