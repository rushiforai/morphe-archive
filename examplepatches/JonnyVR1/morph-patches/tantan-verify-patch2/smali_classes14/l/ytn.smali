.class public final synthetic Ll/ytn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ytn;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ytn;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {p0, p1}, Ll/oun;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Lcom/p1/mobile/putong/data/Followship;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
