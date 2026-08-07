.class public final synthetic Ll/dwc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/gwc0;


# direct methods
.method public synthetic constructor <init>(Ll/gwc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dwc0;->a:Ll/gwc0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dwc0;->a:Ll/gwc0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    invoke-static {p0, p1}, Ll/gwc0;->k(Ll/gwc0;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
