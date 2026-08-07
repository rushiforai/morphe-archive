.class public final synthetic Ll/q9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/r9p;


# direct methods
.method public synthetic constructor <init>(Ll/r9p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q9p;->a:Ll/r9p;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q9p;->a:Ll/r9p;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    invoke-static {p0, p1}, Ll/r9p$a;->b(Ll/r9p;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
