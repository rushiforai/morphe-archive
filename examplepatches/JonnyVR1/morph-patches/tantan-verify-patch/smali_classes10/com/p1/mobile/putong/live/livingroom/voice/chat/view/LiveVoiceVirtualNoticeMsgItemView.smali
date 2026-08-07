.class public final Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/yql;",
        "chatView",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
        "liveMessage",
        "",
        "c",
        "(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static b(Ll/yql;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/yql;->j()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final c(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 2
    .param p1    # Ll/yql;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->virtualAvatarNoticeMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceVirtualAvatarInitNoticeMessage;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->d:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceVirtualAvatarInitNoticeMessage;->getTitle()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->e:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->virtualAvatarNoticeMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceVirtualAvatarInitNoticeMessage;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceVirtualAvatarInitNoticeMessage;->getContent()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->c:Lv/VDraweeView;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "context_livingAct"

    .line 46
    .line 47
    invoke-static {v1, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->c:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    new-instance p2, Ll/idv;

    .line 56
    .line 57
    invoke-direct {p2, p1}, Ll/idv;-><init>(Ll/yql;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p0, p2}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
