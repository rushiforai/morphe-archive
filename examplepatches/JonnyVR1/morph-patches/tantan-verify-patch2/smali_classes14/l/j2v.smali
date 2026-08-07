.class public final synthetic Ll/j2v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->m(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
