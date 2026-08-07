.class public final synthetic Ll/g2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2s;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g2s;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {p0, p1}, Ll/j2s;->g(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
