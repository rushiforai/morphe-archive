.class public final synthetic Ll/qdp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sdp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method public synthetic constructor <init>(Ll/sdp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qdp0;->a:Ll/sdp0;

    iput-object p2, p0, Ll/qdp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    iput-object p3, p0, Ll/qdp0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qdp0;->a:Ll/sdp0;

    iget-object v1, p0, Ll/qdp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    iget-object p0, p0, Ll/qdp0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-static {v0, v1, p0}, Ll/sdp0;->n4(Ll/sdp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method
