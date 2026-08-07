.class public final synthetic Ll/msi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/rsi;


# direct methods
.method public synthetic constructor <init>(Ll/rsi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/msi;->a:Ll/rsi;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msi;->a:Ll/rsi;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    invoke-static {p0, p1}, Ll/rsi;->b(Ll/rsi;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
