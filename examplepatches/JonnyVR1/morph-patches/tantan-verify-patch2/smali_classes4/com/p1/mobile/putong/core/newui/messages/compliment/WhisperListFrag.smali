.class public Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lv/VList;

.field public B:Landroid/view/View;

.field public C:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public D:Lcom/sunshine/engine/particle/SceneView;

.field public E:Landroid/view/View;

.field public F:Ll/leq0;

.field public G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:J

.field public L:Ll/ayp;

.field public z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic E4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->L:Ll/ayp;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ayp;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->L:Ll/ayp;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ayp;->b()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->q5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic N4()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "p_whisper_tab,e_boost_button,click"

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->l5()V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->E4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Q4()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Ke()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->p5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->o5()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->r5(Ll/vg60;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->s5(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic Y4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->m5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->n5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->x5()V

    return-void
.end method

.method public static bridge synthetic d5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->I:Z

    return p0
.end method

.method public static bridge synthetic e5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->J:Z

    return p0
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->I:Z

    return-void
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->j5()V

    return-void
.end method

.method public static i5()Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic p5(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_whisper_unlock_btn_click"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->v5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ayp;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ayp;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->L:Ll/ayp;

    .line 10
    .line 11
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/meq0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/meq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/ueq0;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/ueq0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/leq0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0}, Ll/leq0;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->F:Ll/leq0;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->k5()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->C:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    new-instance v0, Ll/veq0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/veq0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setFromCallback(Ll/pcj;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->D:Lcom/sunshine/engine/particle/SceneView;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->C:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setSceneView(Lcom/sunshine/engine/particle/SceneView;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->E:Landroid/view/View;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    new-instance v0, Ll/weq0;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/weq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->y5()V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/joa;->y3()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/xeq0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/xeq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Ll/yeq0;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/yeq0;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->rh()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance v0, Ll/zeq0;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/zeq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 103
    .line 104
    .line 105
    new-instance v1, Ll/afq0;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/afq0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    const/4 p1, 0x0

    .line 118
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->w5(Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 122
    .line 123
    new-instance v0, Ll/bfq0;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/bfq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 132
    .line 133
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->bd:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->Mf:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 17
    .line 18
    sget p2, Ll/adc0;->If:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lv/VList;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 27
    .line 28
    sget p2, Ll/adc0;->D3:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->B:Landroid/view/View;

    .line 35
    .line 36
    sget p2, Ll/adc0;->Ef:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    check-cast p2, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 43
    .line 44
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->C:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 45
    .line 46
    sget p2, Ll/adc0;->Ff:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/sunshine/engine/particle/SceneView;

    .line 53
    .line 54
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->D:Lcom/sunshine/engine/particle/SceneView;

    .line 55
    .line 56
    sget p2, Ll/adc0;->z0:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->E:Landroid/view/View;

    .line 63
    .line 64
    sget p2, Ll/adc0;->u6:I

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    check-cast p2, Landroid/widget/FrameLayout;

    .line 71
    .line 72
    if-eqz p2, :cond_0

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->L:Ll/ayp;

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/ayp;->a(Landroid/widget/FrameLayout;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-object p1
.end method

.method public final j5()V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->J:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 5
    .line 6
    new-instance v1, Ll/req0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/req0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    new-instance v7, Ll/seq0;

    .line 32
    .line 33
    invoke-direct {v7, p0, v3}, Ll/seq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 34
    .line 35
    .line 36
    const-string v4, "p_messages_view,e_whisper_lock_cell_click,click"

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final k5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/d79;->F()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 36
    .line 37
    invoke-virtual {v2, v0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->setAct(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView;->t()V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;->setHeadView(Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/oeq0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/oeq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->setChangeHeightListrener(Ll/y20;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 64
    .line 65
    new-instance v1, Ll/peq0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/peq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;->setCanPullChecker(Lkotlin/jvm/functions/Function0;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic l5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    new-instance p2, Ll/teq0;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/teq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    int-to-float p1, p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic o5()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-lt v0, p0, :cond_1

    .line 43
    .line 44
    :cond_0
    const/4 v1, 0x1

    .line 45
    :cond_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_messages_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q5(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->y5()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->F:Ll/leq0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic r5(Ll/vg60;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 35
    .line 36
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 37
    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 41
    .line 42
    if-lez v1, :cond_1

    .line 43
    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->F:Ll/leq0;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/leq0;->k(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z5()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->y5()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic s5(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->F:Ll/leq0;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ll/leq0;->e(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 15
    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    iget-boolean p3, p3, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->isFake:Z

    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    const/4 p3, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 p3, 0x0

    .line 25
    :goto_0
    if-eqz p2, :cond_2

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 28
    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->source:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const/4 p2, 0x0

    .line 35
    :goto_1
    const-string p4, "is_fake"

    .line 36
    .line 37
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {p4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    if-eqz p2, :cond_3

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_3
    const-string p2, ""

    .line 49
    .line 50
    :goto_2
    const-string p4, "source"

    .line 51
    .line 52
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    filled-new-array {p3, p2}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const-string p3, "e_whisper_lock_cell_click"

    .line 61
    .line 62
    const-string p4, "p_messages_view"

    .line 63
    .line 64
    invoke-static {p3, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/br5;->l()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->v5()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->t5(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final t5(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public u5()V
    .locals 1

    .line 1
    new-instance v0, Ll/qeq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qeq0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->L:Ll/ayp;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ayp;->c()V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->w5(Z)V

    .line 25
    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->H:Z

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->z5()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final v5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "p_messages_view,e_whisper_lock_cell_click,click"

    .line 17
    .line 18
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final w5(Z)V
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->K:J

    .line 8
    .line 9
    sub-long v2, v0, v2

    .line 10
    .line 11
    const-wide/16 v4, 0x1388

    .line 12
    .line 13
    cmp-long p1, v2, v4

    .line 14
    .line 15
    if-gez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->K:J

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance p1, Ll/cfq0;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/cfq0;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/neq0;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/neq0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final x5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->J:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final y5()V
    .locals 5

    .line 1
    invoke-static {}, Ll/br5;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->C:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v4, v3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v4, v2

    .line 23
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->E:Landroid/view/View;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_2
    move v2, v3

    .line 40
    :goto_2
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final z5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->B:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->A:Lv/VList;

    .line 13
    .line 14
    xor-int/lit8 v2, v0, 0x1

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->H:Z

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const-string v0, "e_whisper_blank_text_show"

    .line 26
    .line 27
    const-string v1, "p_messages_view"

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->H:Z

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    if-nez v0, :cond_1

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->H:Z

    .line 40
    .line 41
    :cond_1
    return-void
.end method
