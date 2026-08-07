.class public final synthetic Ll/xfr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/cgr;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;


# direct methods
.method public synthetic constructor <init>(Ll/cgr;Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xfr;->a:Ll/cgr;

    iput-object p2, p0, Ll/xfr;->b:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xfr;->a:Ll/cgr;

    iget-object p0, p0, Ll/xfr;->b:Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;

    invoke-static {v0, p0, p1}, Ll/cgr;->b(Ll/cgr;Lcom/p1/mobile/putong/core/data/LikeMindedRequestParams;Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
