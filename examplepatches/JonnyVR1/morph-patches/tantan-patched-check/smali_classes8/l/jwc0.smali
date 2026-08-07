.class public final synthetic Ll/jwc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jwc0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/jwc0;->b:Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    iput p3, p0, Ll/jwc0;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jwc0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/jwc0;->b:Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    iget p0, p0, Ll/jwc0;->c:I

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/kwc0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;ILcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
