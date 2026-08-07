.class public final synthetic Ll/ayj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/cyj;


# direct methods
.method public synthetic constructor <init>(Ll/cyj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ayj;->a:Ll/cyj;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayj;->a:Ll/cyj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/cyj;->b(Ll/cyj;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
