.class public Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;->Z1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static Y1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x4000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private synthetic Z1(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "default_select_tab"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "from_feed"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;->P4(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTopicChatRoomFrag;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget v0, Ll/ldc0;->R0:I

    .line 30
    .line 31
    const-string v1, "VOICE_ENTRY_ACT_FRAG_TAG"

    .line 32
    .line 33
    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/ldc0;->R0:I

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setId(I)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/pan0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/pan0;-><init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method
