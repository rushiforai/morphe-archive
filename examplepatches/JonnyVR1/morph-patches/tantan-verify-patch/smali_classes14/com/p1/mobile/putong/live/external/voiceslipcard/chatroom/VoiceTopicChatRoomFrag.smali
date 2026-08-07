.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/iam;

.field public z:Ll/mus;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->S4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->destroy()V

    return-void
.end method

.method public static synthetic O4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static P4(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->Q4()Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "frag_from"

    .line 11
    .line 12
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "default_select_tab"

    .line 16
    .line 17
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static Q4()Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l6t;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final R4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/a5p0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/a5p0;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic S4(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/j6t;->v(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->T4(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final T4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tpn0;

    .line 5
    .line 6
    new-instance v1, Ll/nus;

    .line 7
    .line 8
    new-instance v2, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    invoke-direct {v2}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, p0, v1}, Ll/tpn0;-><init>(Ll/ner;Ll/nus;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 20
    .line 21
    new-instance v0, Ll/zpn0;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/zpn0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->A:Ll/iam;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/mus;->I2()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->R4()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/y4p0;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/y4p0;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/z4p0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/z4p0;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxp;->INSTANCE:Ll/uxp;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/uxp;->a(Ll/mus;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/l6t;->T()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->A:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->z:Ll/mus;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->L2(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_audio_explore_recommend"

    .line 2
    .line 3
    return-object p0
.end method
