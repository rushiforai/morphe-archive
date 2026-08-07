.class public final synthetic Ll/icj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icj0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icj0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
