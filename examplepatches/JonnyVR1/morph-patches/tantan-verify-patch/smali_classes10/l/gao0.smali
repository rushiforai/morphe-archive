.class public Ll/gao0;
.super Ll/dh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;


# direct methods
.method public constructor <init>(Ll/yh2;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;->changeMicEmojiState()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lrx/c;

    .line 23
    .line 24
    invoke-virtual {p3, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p3, Ll/fao0;

    .line 29
    .line 30
    invoke-direct {p3, p0, p2}, Ll/fao0;-><init>(Ll/gao0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic J(Ll/gao0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/wao0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gao0;->K(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/wao0;)V

    return-void
.end method


# virtual methods
.method public final synthetic K(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/wao0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gao0;->d:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->mid:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v2, p2, Ll/wao0;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/wao0;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/gao0;->d:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/wao0;->d()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p2}, Ll/wao0;->e()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p2, p2, Ll/wao0;->e:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v1, v2, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->n(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v0, 0x0

    .line 47
    .line 48
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->localCreateTime:J

    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gao0;->d:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 5
    .line 6
    iget-object v0, p0, Ll/dh2;->b:Ll/yql;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 9
    .line 10
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->l(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->q8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gao0;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
