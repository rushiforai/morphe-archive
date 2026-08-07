.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings<",
        "Ll/t8p0;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/leo0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/u8p0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/u8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/u8p0;

    invoke-direct {p1, p0}, Ll/u8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/u8p0;

    invoke-direct {p1, p0}, Ll/u8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e:Ll/y20;

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->j()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;Ll/leo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->f(Ll/leo0;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;Ll/leo0;Ll/leo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->i(Ll/leo0;Ll/leo0;)V

    return-void
.end method

.method private synthetic j()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/t8p0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/t8p0;->M3()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->p()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->p()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic f(Ll/leo0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/t8p0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/t8p0;->N3()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic i(Ll/leo0;Ll/leo0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Ll/i6t;

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/meo0;->d(Ll/i6t;Ll/leo0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->a:Ll/k3m;

    .line 11
    .line 12
    check-cast p0, Ll/t8p0;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/t8p0;->K3(Ll/leo0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public k(Ll/leo0;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ll/v8p0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/v8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;Ll/leo0;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/w8p0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/w8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->a:Ll/k3m;

    .line 19
    .line 20
    check-cast v2, Ll/i6t;

    .line 21
    .line 22
    invoke-static {v2, p1}, Ll/meo0;->e(Ll/i6t;Ll/leo0;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 30
    .line 31
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e:Ll/y20;

    .line 40
    .line 41
    invoke-virtual {v3, p1, v0, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->s(Ll/leo0;Ll/y20;Ll/x20;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 45
    .line 46
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 51
    .line 52
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_2

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;->e:Ll/y20;

    .line 61
    .line 62
    invoke-virtual {v3, p1, v0, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->s(Ll/leo0;Ll/y20;Ll/x20;Ll/y20;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 66
    .line 67
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method
