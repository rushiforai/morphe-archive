.class public final synthetic Ll/s79;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b89;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/b89;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s79;->a:Ll/b89;

    iput-object p2, p0, Ll/s79;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s79;->a:Ll/b89;

    iget-object p0, p0, Ll/s79;->b:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;

    invoke-static {v0, p0, p1}, Ll/b89;->e3(Ll/b89;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;)V

    return-void
.end method
