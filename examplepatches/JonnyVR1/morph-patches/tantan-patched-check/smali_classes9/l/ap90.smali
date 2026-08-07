.class public Ll/ap90;
.super Ll/no90;
.source "SourceFile"


# instance fields
.field public E0:Lv/VLinear;

.field public F0:Lv/VText;

.field public G0:Lv/VLinear;

.field public H0:Lv/VDraweeView;

.field public I0:Lv/VText;

.field public J0:Lv/VLinear;

.field public K0:Z

.field public L0:Z

.field public M0:Z

.field public N0:Ll/eo90;

.field public O0:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public P0:Z

.field public X:Lv/VText;

.field public Y:Landroid/widget/LinearLayout;

.field public Z:Lv/VLinear;

.field public k0:Lv/VDraweeView;

.field public p0:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/no90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ap90;->K0:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/ap90;->L0:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/ap90;->M0:Z

    .line 10
    .line 11
    new-instance p1, Ll/eo90;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/eo90;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 17
    .line 18
    return-void
.end method

.method private C0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->vm(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v1, v2}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/xo90;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/xo90;-><init>(Ll/ap90;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/yo90;

    .line 52
    .line 53
    invoke-direct {v3, p0}, Ll/yo90;-><init>(Ll/ap90;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 64
    .line 65
    new-instance v2, Ll/zo90;

    .line 66
    .line 67
    invoke-direct {v2, p0, v0}, Ll/zo90;-><init>(Ll/ap90;Lcom/p1/mobile/putong/data/User;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private synthetic G0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ap90;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ap90;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "profile"

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p1, p0}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic m0(Ll/ap90;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ap90;->E0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/ap90;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ap90;->F0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Ll/ap90;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ap90;->J0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/ap90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ap90;->I0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Ll/ap90;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ap90;->K0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic s0(Ll/ap90;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ap90;->H0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic t0(Ll/ap90;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ap90;->d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u0(Ll/ap90;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ap90;->G0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic v0(Ll/ap90;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ap90;->D0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method


# virtual methods
.method public final A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string v0, "dismissed"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 16
    .line 17
    const-string v0, "deleted"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string p1, "blocked"

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final B0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/ap90;->G0:Lv/VLinear;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ap90;->J0:Lv/VLinear;

    .line 29
    .line 30
    iget-object v2, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 31
    .line 32
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ep90;->I()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ap90;->J0:Lv/VLinear;

    .line 11
    .line 12
    iget-object v2, p0, Ll/ap90;->G0:Lv/VLinear;

    .line 13
    .line 14
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ep90;->I()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v1

    .line 28
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "state_id"

    .line 41
    .line 42
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 51
    .line 52
    const-string v4, "owner_id"

    .line 53
    .line 54
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "e_other_state"

    .line 63
    .line 64
    invoke-static {v3, v1, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 68
    .line 69
    iget-object v1, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/ap90;->J0:Lv/VLinear;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ep90;->I()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    xor-int/2addr v2, v0

    .line 81
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 85
    .line 86
    iget-object v2, p0, Ll/ap90;->k0:Lv/VDraweeView;

    .line 87
    .line 88
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 89
    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 91
    .line 92
    sget v4, Ll/qa00;->q:I

    .line 93
    .line 94
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/ap90;->p0:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/ap90;->p0:Lv/VText;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iput-boolean v0, p0, Ll/ap90;->P0:Z

    .line 116
    .line 117
    return-void
.end method

.method public final synthetic E0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/ap90;->J0:Lv/VLinear;

    .line 8
    .line 9
    iget-object v1, p0, Ll/ap90;->G0:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ep90;->I()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "state_id"

    .line 21
    .line 22
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 31
    .line 32
    const-string v4, "owner_id"

    .line 33
    .line 34
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "e_other_state"

    .line 43
    .line 44
    invoke-static {v3, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BubbleInfo;->checkStateTimeIsValid()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    const-string v0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 56
    .line 57
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-interface {v3}, Ll/s7m;->userId()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iget-object v4, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 94
    .line 95
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v0}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v1, v2, v3, v4, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 112
    .line 113
    move-object/from16 v2, p1

    .line 114
    .line 115
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ll/ap90;->A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_3

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    move-object v3, v1

    .line 140
    check-cast v3, Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    iget-object v1, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 143
    .line 144
    iget-object v4, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 147
    .line 148
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-interface {v0}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    const/4 v6, 0x1

    .line 159
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Sg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    invoke-virtual {v0}, Ll/no90;->O()Ll/t3m;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    move-object v9, v1

    .line 176
    check-cast v9, Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    iget-object v0, v0, Ll/ap90;->O0:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 179
    .line 180
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 181
    .line 182
    iget-object v10, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v11, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 185
    .line 186
    const/4 v14, 0x0

    .line 187
    const-string v15, ""

    .line 188
    .line 189
    const-string v12, "p_suggest_user_profile_info_view"

    .line 190
    .line 191
    const/4 v13, 0x0

    .line 192
    invoke-interface/range {v8 .. v15}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Yn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic K0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/s7a;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const-string v0, "p_suggest_user_profile_info_view"

    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/spl0;->N()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p2, "e_send_message"

    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const-string p2, "e_sayhi_first"

    .line 23
    .line 24
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :goto_1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p2}, Ll/t3m;->O1()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/16 p1, 0x99

    .line 42
    .line 43
    invoke-interface {p0, p1}, Ll/t3m;->j3(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-static {}, Ll/spl0;->N()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const-string v0, "confession"

    .line 52
    .line 53
    const-string v1, "p_suggest_user_profile_info_view,e_sayhi_first,click"

    .line 54
    .line 55
    if-eqz p2, :cond_3

    .line 56
    .line 57
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-direct {p2, p1, v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 84
    .line 85
    sget-object p1, Ll/km80;->INSTANCE:Ll/km80;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    invoke-virtual {p1, p0, p2}, Ll/km80;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-static {}, Ll/s7a;->s()Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-eqz p2, :cond_4

    .line 106
    .line 107
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v2}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-direct {p2, p1, v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_4
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-interface {v0}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    const-string p1, "p_profile,greet"

    .line 165
    .line 166
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public final L0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBlackDiamondVIP()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->hideBlackDiamondTag()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 15
    .line 16
    iget-object p1, p1, Ll/eo90;->v:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->i0(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 22
    .line 23
    iget-object p1, p1, Ll/eo90;->v:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 30
    .line 31
    iget-object p0, p0, Ll/eo90;->v:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->k0()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 38
    .line 39
    iget-object p0, p0, Ll/eo90;->v:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 40
    .line 41
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final M0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 12
    .line 13
    iget-object v0, v0, Ll/eo90;->C:Lv/VIcon;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/no90;->M:Lv/VLinear;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 35
    .line 36
    .line 37
    sget v4, Ll/adc0;->L4:I

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Ll/no90;->M:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/no90;->F:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 53
    .line 54
    iget-object v0, v0, Ll/eo90;->z:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 68
    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 80
    .line 81
    :goto_0
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-interface {v2}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_1

    .line 96
    .line 97
    sget-object v3, Ll/uqb0;->b0:Ll/sre0;

    .line 98
    .line 99
    iget-object v3, v3, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v3, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_1

    .line 110
    .line 111
    if-nez v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    goto :goto_1

    .line 122
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v0}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 131
    .line 132
    iget-object v0, v0, Ll/eo90;->z:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Ll/ap90;->y0(Lcom/p1/mobile/putong/data/IntlGender;)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 142
    .line 143
    iget-object v0, v0, Ll/eo90;->A:Lv/VImage;

    .line 144
    .line 145
    invoke-virtual {p0, v1}, Ll/ap90;->z0(Lcom/p1/mobile/putong/data/IntlGender;)Landroid/graphics/drawable/Drawable;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 153
    .line 154
    iget-object v0, v0, Ll/eo90;->B:Lv/VText;

    .line 155
    .line 156
    new-instance v1, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-interface {p0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 170
    .line 171
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string p0, ""

    .line 175
    .line 176
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    :cond_3
    return-void
.end method

.method public final N0(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/spl0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/s7a;->s()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/spl0;->N()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_a

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 21
    .line 22
    iget-object v0, v0, Ll/eo90;->o:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_a

    .line 29
    .line 30
    if-eqz p1, :cond_a

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 43
    .line 44
    const-string v2, "matched"

    .line 45
    .line 46
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_a

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    goto/16 :goto_3

    .line 59
    .line 60
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/ap90;->A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_9

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    goto/16 :goto_2

    .line 89
    .line 90
    :cond_3
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 91
    .line 92
    iget-object v0, v0, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 93
    .line 94
    const/4 v2, 0x1

    .line 95
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 99
    .line 100
    iget-object v0, v0, Ll/eo90;->n:Lv/VText;

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 106
    .line 107
    iget-object v0, v0, Ll/eo90;->c:Landroid/widget/RelativeLayout;

    .line 108
    .line 109
    const/high16 v3, 0x42a00000    # 80.0f

    .line 110
    .line 111
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    invoke-static {v0, v4}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 119
    .line 120
    iget-object v0, v0, Ll/eo90;->D:Lv/VLinear;

    .line 121
    .line 122
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    iget-boolean v0, p0, Ll/ap90;->M0:Z

    .line 130
    .line 131
    if-nez v0, :cond_6

    .line 132
    .line 133
    iput-boolean v2, p0, Ll/ap90;->M0:Z

    .line 134
    .line 135
    invoke-static {}, Ll/s7a;->s()Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    const-string v3, "p_suggest_user_profile_info_view"

    .line 140
    .line 141
    if-nez v0, :cond_5

    .line 142
    .line 143
    invoke-static {}, Ll/spl0;->N()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_4

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_4
    const-string v0, "e_send_message"

    .line 151
    .line 152
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_5
    :goto_0
    const-string v0, "e_sayhi_first"

    .line 157
    .line 158
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_6
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 162
    .line 163
    .line 164
    move-result-wide v3

    .line 165
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 168
    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->x0:Ll/byd0;

    .line 170
    .line 171
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Ljava/lang/Long;

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 178
    .line 179
    .line 180
    move-result-wide v5

    .line 181
    invoke-static {v3, v4, v5, v6}, Ll/pzi0;->C(JJ)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-nez v0, :cond_7

    .line 186
    .line 187
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 188
    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->x0:Ll/byd0;

    .line 192
    .line 193
    invoke-static {}, Ll/pzi0;->o()J

    .line 194
    .line 195
    .line 196
    move-result-wide v3

    .line 197
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move v1, v2

    .line 205
    :cond_7
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 206
    .line 207
    iget-object v0, v0, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 208
    .line 209
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_8

    .line 214
    .line 215
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    const-string v3, "https://auto.tancdn.com/v1/raw/aca16610-5843-4b4e-84bc-7fab29787e5e14.pdf"

    .line 228
    .line 229
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 242
    .line 243
    iget-object v1, v1, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 246
    .line 247
    .line 248
    :cond_8
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 249
    .line 250
    iget-object v0, v0, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 251
    .line 252
    new-instance v1, Ll/qo90;

    .line 253
    .line 254
    invoke-direct {v1, p0, p1}, Ll/qo90;-><init>(Ll/ap90;Lcom/p1/mobile/putong/data/User;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :cond_9
    :goto_2
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 262
    .line 263
    iget-object p0, p0, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 264
    .line 265
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_a
    :goto_3
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 270
    .line 271
    iget-object p0, p0, Ll/eo90;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 272
    .line 273
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 10
    .line 11
    iget-object v0, v0, Ll/eo90;->w:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 18
    .line 19
    iget-object v0, v0, Ll/eo90;->o:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    if-eqz v0, :cond_4

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_4

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_4

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 95
    .line 96
    iget p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gj(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->openNewIcon:Z

    .line 116
    .line 117
    iget-object v2, p0, Ll/ap90;->N0:Ll/eo90;

    .line 118
    .line 119
    const/4 v3, 0x1

    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    iget-object v0, v2, Ll/eo90;->o:Lv/VDraweeView;

    .line 123
    .line 124
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 128
    .line 129
    iget-object v0, v0, Ll/eo90;->n:Lv/VText;

    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 137
    .line 138
    iget-object v1, v1, Ll/eo90;->o:Lv/VDraweeView;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 146
    .line 147
    iget-object p1, p1, Ll/eo90;->c:Landroid/widget/RelativeLayout;

    .line 148
    .line 149
    const/high16 v0, 0x42a00000    # 80.0f

    .line 150
    .line 151
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-static {p1, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 159
    .line 160
    iget-object p0, p0, Ll/eo90;->D:Lv/VLinear;

    .line 161
    .line 162
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_3
    iget-object v0, v2, Ll/eo90;->w:Lv/VDraweeView;

    .line 171
    .line 172
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 178
    .line 179
    iget-object v1, v1, Ll/eo90;->w:Lv/VDraweeView;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 182
    .line 183
    new-instance v2, Ll/ap90$a;

    .line 184
    .line 185
    invoke-direct {v2, p0}, Ll/ap90$a;-><init>(Ll/ap90;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v1, p1, v2}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 189
    .line 190
    .line 191
    :cond_4
    :goto_0
    return-void
.end method

.method public P0(Lcom/p1/mobile/putong/data/User;Lv/VText;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/no90;->a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ll/t3m;->from()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_tantanx_card"

    .line 14
    .line 15
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    const-string v1, "\u00b7"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    array-length v2, v1

    .line 34
    if-lez v2, :cond_0

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    aget-object v0, v1, v0

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_0
    invoke-static {}, Ll/xra;->o()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-static {}, Ll/y0a0;->b()Ll/y0a0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2, p1}, Ll/y0a0;->a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-static {}, Ll/y0a0;->b()Ll/y0a0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0, p1}, Ll/y0a0;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-static {}, Ll/y0a0;->b()Ll/y0a0;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1, p1}, Ll/y0a0;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "%s \u00b7 %s"

    .line 95
    .line 96
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :goto_0
    const/4 v1, 0x2

    .line 101
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const/4 v1, 0x1

    .line 106
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 107
    .line 108
    .line 109
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 110
    .line 111
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_6

    .line 116
    .line 117
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 120
    .line 121
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_6

    .line 126
    .line 127
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 130
    .line 131
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 132
    .line 133
    if-eqz v2, :cond_6

    .line 134
    .line 135
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 136
    .line 137
    if-eqz v2, :cond_6

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-nez v1, :cond_6

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-eqz p0, :cond_4

    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 158
    .line 159
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_4

    .line 164
    .line 165
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_4

    .line 172
    .line 173
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_3

    .line 178
    .line 179
    const-string p0, ""

    .line 180
    .line 181
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_3
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 194
    .line 195
    if-eqz p0, :cond_5

    .line 196
    .line 197
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 211
    .line 212
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string p1, "  "

    .line 218
    .line 219
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_7

    .line 238
    .line 239
    const/16 p1, 0x8

    .line 240
    .line 241
    invoke-virtual {p0, p2, p1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_7
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 2
    .line 3
    iget-object v0, p1, Ll/eo90;->E:Lv/VText;

    .line 4
    .line 5
    iget-object p1, p1, Ll/eo90;->D:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/16 v0, 0x8

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 27
    .line 28
    iget-object p1, p1, Ll/eo90;->E:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-direct {p0}, Ll/ap90;->C0()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->jb()Lrx/subjects/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {p1, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v1, Ll/ro90;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/ro90;-><init>(Ll/ap90;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->f9()Lrx/subjects/b;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-interface {p1, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v1, Ll/so90;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/so90;-><init>(Ll/ap90;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    :cond_1
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 103
    .line 104
    const/high16 v1, 0x42200000    # 40.0f

    .line 105
    .line 106
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const/4 v2, -0x2

    .line 111
    invoke-direct {p1, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 112
    .line 113
    .line 114
    sget v1, Ll/adc0;->H7:I

    .line 115
    .line 116
    invoke-virtual {p1, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 117
    .line 118
    .line 119
    const/16 v0, 0xb

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 122
    .line 123
    .line 124
    const/high16 v0, 0x41200000    # 10.0f

    .line 125
    .line 126
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    const/4 v1, 0x0

    .line 131
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/ap90;->X:Lv/VText;

    .line 135
    .line 136
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    new-instance v0, Ll/to90;

    .line 156
    .line 157
    invoke-direct {v0, p0}, Ll/to90;-><init>(Ll/ap90;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    new-instance v0, Ll/uo90;

    .line 165
    .line 166
    invoke-direct {v0}, Ll/uo90;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    new-instance v0, Ll/vo90;

    .line 174
    .line 175
    invoke-direct {v0, p0}, Ll/vo90;-><init>(Ll/ap90;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_2

    .line 194
    .line 195
    iget-object p1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 196
    .line 197
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 198
    .line 199
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    sget v1, Ll/dbc0;->Yu:I

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 213
    .line 214
    new-instance v0, Ll/wo90;

    .line 215
    .line 216
    invoke-direct {v0, p0}, Ll/wo90;-><init>(Ll/ap90;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    :cond_2
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public l0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 2
    .line 3
    iget-object p1, p1, Ll/eo90;->x:Lv/VText;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->v9:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v0, v1, p1, v2}, Ll/cum;->b(Landroid/content/Context;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/eo90;->a(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 22
    .line 23
    iget-object v1, v0, Ll/eo90;->a:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    iput-object v1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    iget-object v1, v0, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 28
    .line 29
    iput-object v1, p0, Ll/no90;->v:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    iget-object v1, v0, Ll/eo90;->D:Lv/VLinear;

    .line 32
    .line 33
    iput-object v1, p0, Ll/no90;->M:Lv/VLinear;

    .line 34
    .line 35
    iget-object v1, v0, Ll/eo90;->n:Lv/VText;

    .line 36
    .line 37
    iput-object v1, p0, Ll/ap90;->X:Lv/VText;

    .line 38
    .line 39
    iget-object v1, v0, Ll/eo90;->f:Lv/VText;

    .line 40
    .line 41
    iput-object v1, p0, Ll/no90;->x:Lv/VText;

    .line 42
    .line 43
    iget-object v1, v0, Ll/eo90;->i:Lv/VText;

    .line 44
    .line 45
    iput-object v1, p0, Ll/no90;->F:Lv/VText;

    .line 46
    .line 47
    iget-object v1, v0, Ll/eo90;->y:Lv/VText;

    .line 48
    .line 49
    iput-object v1, p0, Ll/no90;->G:Lv/VText;

    .line 50
    .line 51
    iget-object v1, v0, Ll/eo90;->F:Lv/VLinear;

    .line 52
    .line 53
    iput-object v1, p0, Ll/no90;->O:Lv/VLinear;

    .line 54
    .line 55
    iget-object v1, v0, Ll/eo90;->G:Lv/VImage;

    .line 56
    .line 57
    iput-object v1, p0, Ll/no90;->P:Lv/VImage;

    .line 58
    .line 59
    iget-object v1, v0, Ll/eo90;->H:Lv/VText;

    .line 60
    .line 61
    iput-object v1, p0, Ll/no90;->Q:Lv/VText;

    .line 62
    .line 63
    iget-object v1, v0, Ll/eo90;->g:Lv/VDraweeView;

    .line 64
    .line 65
    iput-object v1, p0, Ll/no90;->y:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v1, v0, Ll/eo90;->h:Lv/VImage;

    .line 68
    .line 69
    iput-object v1, p0, Ll/no90;->z:Lv/VImage;

    .line 70
    .line 71
    iget-object v1, v0, Ll/eo90;->q:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    iput-object v1, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    iget-object v1, v0, Ll/eo90;->M:Lv/VLinear;

    .line 76
    .line 77
    iput-object v1, p0, Ll/ap90;->Z:Lv/VLinear;

    .line 78
    .line 79
    iget-object v1, v0, Ll/eo90;->N:Lv/VDraweeView;

    .line 80
    .line 81
    iput-object v1, p0, Ll/ap90;->k0:Lv/VDraweeView;

    .line 82
    .line 83
    iget-object v1, v0, Ll/eo90;->O:Lv/VText;

    .line 84
    .line 85
    iput-object v1, p0, Ll/ap90;->p0:Lv/VText;

    .line 86
    .line 87
    iget-object v1, v0, Ll/eo90;->I:Lv/VLinear;

    .line 88
    .line 89
    iput-object v1, p0, Ll/ap90;->E0:Lv/VLinear;

    .line 90
    .line 91
    iget-object v1, v0, Ll/eo90;->K:Lv/VText;

    .line 92
    .line 93
    iput-object v1, p0, Ll/ap90;->F0:Lv/VText;

    .line 94
    .line 95
    iget-object v1, v0, Ll/eo90;->P:Lv/VLinear;

    .line 96
    .line 97
    iput-object v1, p0, Ll/ap90;->G0:Lv/VLinear;

    .line 98
    .line 99
    iget-object v1, v0, Ll/eo90;->Q:Lv/VDraweeView;

    .line 100
    .line 101
    iput-object v1, p0, Ll/ap90;->H0:Lv/VDraweeView;

    .line 102
    .line 103
    iget-object v1, v0, Ll/eo90;->R:Lv/VText;

    .line 104
    .line 105
    iput-object v1, p0, Ll/ap90;->I0:Lv/VText;

    .line 106
    .line 107
    iget-object v0, v0, Ll/eo90;->L:Lv/VLinear;

    .line 108
    .line 109
    iput-object v0, p0, Ll/ap90;->J0:Lv/VLinear;

    .line 110
    .line 111
    return-object p1
.end method

.method public t()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_11

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 14
    .line 15
    iget-object v1, v1, Ll/eo90;->r:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 22
    .line 23
    iget-object v1, v1, Ll/eo90;->f:Lv/VText;

    .line 24
    .line 25
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 31
    .line 32
    iget-object v1, v1, Ll/eo90;->f:Lv/VText;

    .line 33
    .line 34
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 40
    .line 41
    iget-object v1, v1, Ll/eo90;->i:Lv/VText;

    .line 42
    .line 43
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 53
    .line 54
    iget-object v1, v1, Ll/eo90;->i:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVipWithOutMe()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x1

    .line 61
    xor-int/2addr v3, v4

    .line 62
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 66
    .line 67
    iget-object v1, v1, Ll/eo90;->E:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0, v0, v1}, Ll/ap90;->P0(Lcom/p1/mobile/putong/data/User;Lv/VText;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p0, v1}, Ll/ap90;->g0(Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/ap90;->l0(Lcom/p1/mobile/putong/data/User;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 87
    .line 88
    iget-object v1, v1, Ll/eo90;->s:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 89
    .line 90
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 94
    .line 95
    iget-object v1, v1, Ll/eo90;->t:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 96
    .line 97
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ve(Lcom/p1/mobile/putong/data/User;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const-string v3, "vip"

    .line 111
    .line 112
    const/high16 v5, 0x40800000    # 4.0f

    .line 113
    .line 114
    if-eqz v1, :cond_1

    .line 115
    .line 116
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 117
    .line 118
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 119
    .line 120
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-static {v1, v5}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 128
    .line 129
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 130
    .line 131
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 135
    .line 136
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 137
    .line 138
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 139
    .line 140
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    sget v6, Ll/dbc0;->Sc:I

    .line 145
    .line 146
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v1, v5}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_1
    invoke-static {}, Ll/d79;->T()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_2

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_2

    .line 165
    .line 166
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 167
    .line 168
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 169
    .line 170
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-static {v1, v5}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 178
    .line 179
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 180
    .line 181
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 185
    .line 186
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 187
    .line 188
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 189
    .line 190
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    sget v6, Ll/dbc0;->Rc:I

    .line 195
    .line 196
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 201
    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    iget-object v6, p0, Ll/ap90;->N0:Ll/eo90;

    .line 209
    .line 210
    if-eqz v1, :cond_3

    .line 211
    .line 212
    iget-object v1, v6, Ll/eo90;->u:Lv/VImage;

    .line 213
    .line 214
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    invoke-static {v1, v5}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 219
    .line 220
    .line 221
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 222
    .line 223
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 224
    .line 225
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 237
    .line 238
    iget-object v5, v5, Ll/eo90;->u:Lv/VImage;

    .line 239
    .line 240
    invoke-static {v1, v5, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->d(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 244
    .line 245
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 246
    .line 247
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 248
    .line 249
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    sget v6, Ll/dbc0;->Tc:I

    .line 254
    .line 255
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 260
    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_3
    iget-object v1, v6, Ll/eo90;->u:Lv/VImage;

    .line 264
    .line 265
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 266
    .line 267
    .line 268
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_4

    .line 273
    .line 274
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    if-nez v1, :cond_5

    .line 279
    .line 280
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-eqz v1, :cond_6

    .line 285
    .line 286
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-eqz v1, :cond_6

    .line 291
    .line 292
    :cond_5
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 293
    .line 294
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 295
    .line 296
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 297
    .line 298
    .line 299
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 300
    .line 301
    iget-object v1, v1, Ll/eo90;->t:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 302
    .line 303
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    :cond_6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 311
    .line 312
    if-eqz v1, :cond_7

    .line 313
    .line 314
    iget-object v1, v5, Ll/eo90;->l:Landroid/widget/ImageView;

    .line 315
    .line 316
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 317
    .line 318
    .line 319
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 320
    .line 321
    iget-object v1, v1, Ll/eo90;->j:Landroid/widget/ImageView;

    .line 322
    .line 323
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 324
    .line 325
    .line 326
    goto :goto_1

    .line 327
    :cond_7
    iget-object v1, v5, Ll/eo90;->l:Landroid/widget/ImageView;

    .line 328
    .line 329
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 330
    .line 331
    .line 332
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 333
    .line 334
    iget-object v1, v1, Ll/eo90;->j:Landroid/widget/ImageView;

    .line 335
    .line 336
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 337
    .line 338
    .line 339
    :goto_1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-virtual {p0, v1}, Ll/ap90;->w0(Lcom/p1/mobile/putong/data/User;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    if-eqz v1, :cond_a

    .line 355
    .line 356
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-nez v1, :cond_8

    .line 361
    .line 362
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    if-eqz v1, :cond_9

    .line 367
    .line 368
    :cond_8
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 369
    .line 370
    iget-object v1, v1, Ll/eo90;->t:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 371
    .line 372
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 373
    .line 374
    .line 375
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 376
    .line 377
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 378
    .line 379
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 380
    .line 381
    .line 382
    :cond_9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 383
    .line 384
    .line 385
    move-result v1

    .line 386
    if-eqz v1, :cond_a

    .line 387
    .line 388
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 389
    .line 390
    iget-object v1, v1, Ll/eo90;->i:Lv/VText;

    .line 391
    .line 392
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 393
    .line 394
    .line 395
    :cond_a
    invoke-virtual {p0, v0}, Ll/ap90;->O0(Lcom/p1/mobile/putong/data/User;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {p0, v0}, Ll/ap90;->N0(Lcom/p1/mobile/putong/data/User;)V

    .line 399
    .line 400
    .line 401
    iget-object v1, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 402
    .line 403
    invoke-static {v1}, Ll/bnl0;->P0(Landroid/view/ViewGroup;)I

    .line 404
    .line 405
    .line 406
    move-result v5

    .line 407
    if-lez v5, :cond_b

    .line 408
    .line 409
    move v5, v4

    .line 410
    goto :goto_2

    .line 411
    :cond_b
    move v5, v2

    .line 412
    :goto_2
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {p0}, Ll/ap90;->M0()V

    .line 416
    .line 417
    .line 418
    invoke-virtual {p0, v0}, Ll/ap90;->L0(Lcom/p1/mobile/putong/data/User;)V

    .line 419
    .line 420
    .line 421
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    invoke-virtual {v1, v0}, Ll/xu90;->f(Lcom/p1/mobile/putong/data/User;)I

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    const/4 v5, -0x1

    .line 430
    if-eq v1, v5, :cond_c

    .line 431
    .line 432
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 433
    .line 434
    iget-object v5, v5, Ll/eo90;->j:Landroid/widget/ImageView;

    .line 435
    .line 436
    invoke-static {v5}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    if-nez v5, :cond_c

    .line 441
    .line 442
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 443
    .line 444
    iget-object v5, v5, Ll/eo90;->k:Landroid/widget/ImageView;

    .line 445
    .line 446
    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 447
    .line 448
    .line 449
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 450
    .line 451
    .line 452
    move-result-object v5

    .line 453
    iget-object v6, p0, Ll/ap90;->N0:Ll/eo90;

    .line 454
    .line 455
    iget-object v6, v6, Ll/eo90;->k:Landroid/widget/ImageView;

    .line 456
    .line 457
    invoke-virtual {v5, v1, v6, v2}, Ll/xu90;->j(ILandroid/widget/ImageView;Z)V

    .line 458
    .line 459
    .line 460
    goto :goto_3

    .line 461
    :cond_c
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 462
    .line 463
    iget-object v1, v1, Ll/eo90;->k:Landroid/widget/ImageView;

    .line 464
    .line 465
    const/16 v5, 0x8

    .line 466
    .line 467
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 468
    .line 469
    .line 470
    :goto_3
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 471
    .line 472
    .line 473
    move-result-object v1

    .line 474
    invoke-virtual {v1, v0}, Ll/xu90;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 475
    .line 476
    .line 477
    move-result v1

    .line 478
    if-eqz v1, :cond_e

    .line 479
    .line 480
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 481
    .line 482
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 483
    .line 484
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    if-nez v1, :cond_e

    .line 489
    .line 490
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 491
    .line 492
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 493
    .line 494
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 495
    .line 496
    .line 497
    invoke-static {}, Ll/d79;->T()Z

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    if-eqz v1, :cond_d

    .line 502
    .line 503
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    if-eqz v1, :cond_d

    .line 508
    .line 509
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 510
    .line 511
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 512
    .line 513
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 514
    .line 515
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 516
    .line 517
    .line 518
    move-result-object v3

    .line 519
    sget v5, Ll/dbc0;->Rc:I

    .line 520
    .line 521
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 522
    .line 523
    .line 524
    move-result-object v3

    .line 525
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 526
    .line 527
    .line 528
    goto :goto_4

    .line 529
    :cond_d
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 538
    .line 539
    iget-object v5, v5, Ll/eo90;->u:Lv/VImage;

    .line 540
    .line 541
    invoke-static {v1, v5, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->d(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 545
    .line 546
    iget-object v1, v1, Ll/eo90;->u:Lv/VImage;

    .line 547
    .line 548
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 549
    .line 550
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 551
    .line 552
    .line 553
    move-result-object v3

    .line 554
    sget v5, Ll/dbc0;->Or:I

    .line 555
    .line 556
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 557
    .line 558
    .line 559
    move-result-object v3

    .line 560
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 561
    .line 562
    .line 563
    :cond_e
    :goto_4
    invoke-virtual {p0}, Ll/ep90;->I()Z

    .line 564
    .line 565
    .line 566
    move-result v1

    .line 567
    if-eqz v1, :cond_19

    .line 568
    .line 569
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 570
    .line 571
    iget-object v1, v1, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 572
    .line 573
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    move v3, v2

    .line 578
    :goto_5
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 579
    .line 580
    if-ge v3, v1, :cond_11

    .line 581
    .line 582
    iget-object v5, v5, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 583
    .line 584
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 585
    .line 586
    .line 587
    move-result-object v5

    .line 588
    iget-object v6, p0, Ll/ap90;->N0:Ll/eo90;

    .line 589
    .line 590
    iget-object v7, v6, Ll/eo90;->c:Landroid/widget/RelativeLayout;

    .line 591
    .line 592
    if-eq v5, v7, :cond_10

    .line 593
    .line 594
    iget-object v6, v6, Ll/eo90;->D:Lv/VLinear;

    .line 595
    .line 596
    if-ne v5, v6, :cond_f

    .line 597
    .line 598
    goto :goto_6

    .line 599
    :cond_f
    move v6, v2

    .line 600
    goto :goto_7

    .line 601
    :cond_10
    :goto_6
    move v6, v4

    .line 602
    :goto_7
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 603
    .line 604
    .line 605
    add-int/lit8 v3, v3, 0x1

    .line 606
    .line 607
    goto :goto_5

    .line 608
    :cond_11
    iget-object v1, v5, Ll/eo90;->e:Landroid/widget/LinearLayout;

    .line 609
    .line 610
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 611
    .line 612
    .line 613
    move-result v1

    .line 614
    move v3, v2

    .line 615
    :goto_8
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 616
    .line 617
    if-ge v3, v1, :cond_14

    .line 618
    .line 619
    iget-object v5, v5, Ll/eo90;->e:Landroid/widget/LinearLayout;

    .line 620
    .line 621
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 622
    .line 623
    .line 624
    move-result-object v5

    .line 625
    iget-object v6, p0, Ll/ap90;->N0:Ll/eo90;

    .line 626
    .line 627
    iget-object v7, v6, Ll/eo90;->f:Lv/VText;

    .line 628
    .line 629
    if-eq v5, v7, :cond_13

    .line 630
    .line 631
    iget-object v6, v6, Ll/eo90;->i:Lv/VText;

    .line 632
    .line 633
    if-ne v5, v6, :cond_12

    .line 634
    .line 635
    goto :goto_9

    .line 636
    :cond_12
    move v6, v2

    .line 637
    goto :goto_a

    .line 638
    :cond_13
    :goto_9
    move v6, v4

    .line 639
    :goto_a
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 640
    .line 641
    .line 642
    add-int/lit8 v3, v3, 0x1

    .line 643
    .line 644
    goto :goto_8

    .line 645
    :cond_14
    iget-object v1, v5, Ll/eo90;->f:Lv/VText;

    .line 646
    .line 647
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 648
    .line 649
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 653
    .line 654
    .line 655
    move-result v1

    .line 656
    if-nez v1, :cond_16

    .line 657
    .line 658
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 659
    .line 660
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 661
    .line 662
    .line 663
    move-result v1

    .line 664
    if-lez v1, :cond_16

    .line 665
    .line 666
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeForTeamAccount()Z

    .line 667
    .line 668
    .line 669
    move-result v1

    .line 670
    if-eqz v1, :cond_15

    .line 671
    .line 672
    goto :goto_b

    .line 673
    :cond_15
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 674
    .line 675
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 676
    .line 677
    .line 678
    move-result v1

    .line 679
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 680
    .line 681
    .line 682
    move-result-object v1

    .line 683
    goto :goto_c

    .line 684
    :cond_16
    :goto_b
    const-string v1, ""

    .line 685
    .line 686
    :goto_c
    iget-object v3, p0, Ll/ap90;->N0:Ll/eo90;

    .line 687
    .line 688
    iget-object v3, v3, Ll/eo90;->i:Lv/VText;

    .line 689
    .line 690
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 691
    .line 692
    .line 693
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 694
    .line 695
    iget-object v1, v1, Ll/eo90;->D:Lv/VLinear;

    .line 696
    .line 697
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 698
    .line 699
    .line 700
    move-result v1

    .line 701
    move v3, v2

    .line 702
    :goto_d
    iget-object v5, p0, Ll/ap90;->N0:Ll/eo90;

    .line 703
    .line 704
    if-ge v3, v1, :cond_18

    .line 705
    .line 706
    iget-object v5, v5, Ll/eo90;->D:Lv/VLinear;

    .line 707
    .line 708
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 709
    .line 710
    .line 711
    move-result-object v5

    .line 712
    iget-object v6, p0, Ll/ap90;->N0:Ll/eo90;

    .line 713
    .line 714
    iget-object v6, v6, Ll/eo90;->E:Lv/VText;

    .line 715
    .line 716
    if-ne v5, v6, :cond_17

    .line 717
    .line 718
    move v6, v4

    .line 719
    goto :goto_e

    .line 720
    :cond_17
    move v6, v2

    .line 721
    :goto_e
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 722
    .line 723
    .line 724
    add-int/lit8 v3, v3, 0x1

    .line 725
    .line 726
    goto :goto_d

    .line 727
    :cond_18
    iget-object v1, v5, Ll/eo90;->E:Lv/VText;

    .line 728
    .line 729
    invoke-virtual {p0}, Ll/ep90;->G()Ljava/lang/String;

    .line 730
    .line 731
    .line 732
    move-result-object v3

    .line 733
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 734
    .line 735
    .line 736
    iget-object v1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 737
    .line 738
    const/high16 v3, 0x43fa0000    # 500.0f

    .line 739
    .line 740
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 741
    .line 742
    .line 743
    move-result v3

    .line 744
    invoke-static {v1, v3}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 745
    .line 746
    .line 747
    goto :goto_f

    .line 748
    :cond_19
    iget-object v1, p0, Ll/no90;->u:Landroid/widget/LinearLayout;

    .line 749
    .line 750
    invoke-static {v1, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 751
    .line 752
    .line 753
    :goto_f
    invoke-static {}, Ll/xra;->o()Z

    .line 754
    .line 755
    .line 756
    move-result v1

    .line 757
    if-nez v1, :cond_1a

    .line 758
    .line 759
    invoke-static {}, Ll/y0a0;->b()Ll/y0a0;

    .line 760
    .line 761
    .line 762
    move-result-object v1

    .line 763
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 764
    .line 765
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 766
    .line 767
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 768
    .line 769
    .line 770
    move-result-object v3

    .line 771
    invoke-virtual {v1, v3, v0}, Ll/y0a0;->a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 772
    .line 773
    .line 774
    move-result v1

    .line 775
    if-eqz v1, :cond_1a

    .line 776
    .line 777
    iget-object v1, p0, Ll/ap90;->E0:Lv/VLinear;

    .line 778
    .line 779
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 780
    .line 781
    .line 782
    iget-object v1, p0, Ll/ap90;->F0:Lv/VText;

    .line 783
    .line 784
    invoke-static {}, Ll/y0a0;->b()Ll/y0a0;

    .line 785
    .line 786
    .line 787
    move-result-object v3

    .line 788
    invoke-virtual {v3, v0}, Ll/y0a0;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 789
    .line 790
    .line 791
    move-result-object v3

    .line 792
    invoke-static {v1, v3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 793
    .line 794
    .line 795
    iget-boolean v1, p0, Ll/ap90;->K0:Z

    .line 796
    .line 797
    if-nez v1, :cond_1b

    .line 798
    .line 799
    iput-boolean v4, p0, Ll/ap90;->K0:Z

    .line 800
    .line 801
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 802
    .line 803
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 804
    .line 805
    const-string v3, "receivedlikes"

    .line 806
    .line 807
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 808
    .line 809
    .line 810
    move-result-object v1

    .line 811
    filled-new-array {v1}, [Ll/pf60;

    .line 812
    .line 813
    .line 814
    move-result-object v1

    .line 815
    const-string v3, "e_like_person"

    .line 816
    .line 817
    const-string v4, "p_suggest_user_profile_info_view"

    .line 818
    .line 819
    invoke-static {v3, v4, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 820
    .line 821
    .line 822
    goto :goto_10

    .line 823
    :cond_1a
    iget-object v1, p0, Ll/ap90;->E0:Lv/VLinear;

    .line 824
    .line 825
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 826
    .line 827
    .line 828
    :cond_1b
    :goto_10
    invoke-virtual {p0}, Ll/ap90;->B0()V

    .line 829
    .line 830
    .line 831
    invoke-static {}, Ll/nrb0;->b()Z

    .line 832
    .line 833
    .line 834
    move-result v1

    .line 835
    if-eqz v1, :cond_1e

    .line 836
    .line 837
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 838
    .line 839
    iget-object v1, v1, Ll/eo90;->j:Landroid/widget/ImageView;

    .line 840
    .line 841
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 842
    .line 843
    .line 844
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 845
    .line 846
    iget-object v1, v1, Ll/eo90;->k:Landroid/widget/ImageView;

    .line 847
    .line 848
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 849
    .line 850
    .line 851
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 852
    .line 853
    iget-object v1, v1, Ll/eo90;->l:Landroid/widget/ImageView;

    .line 854
    .line 855
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 856
    .line 857
    .line 858
    iget-object v1, p0, Ll/ap90;->N0:Ll/eo90;

    .line 859
    .line 860
    iget-object v1, v1, Ll/eo90;->x:Lv/VText;

    .line 861
    .line 862
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 863
    .line 864
    .line 865
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 866
    .line 867
    .line 868
    move-result-object v1

    .line 869
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 870
    .line 871
    .line 872
    move-result-object v1

    .line 873
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 874
    .line 875
    sget-object v3, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->PROFILE:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 876
    .line 877
    invoke-static {v1, v0, v3}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 878
    .line 879
    .line 880
    move-result-object v1

    .line 881
    if-nez v1, :cond_1c

    .line 882
    .line 883
    iget-object v0, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 884
    .line 885
    sget v1, Ll/adc0;->X0:I

    .line 886
    .line 887
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 888
    .line 889
    .line 890
    move-result-object v0

    .line 891
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 892
    .line 893
    .line 894
    move-result v1

    .line 895
    if-eqz v1, :cond_1e

    .line 896
    .line 897
    iget-object p0, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 898
    .line 899
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 900
    .line 901
    .line 902
    return-void

    .line 903
    :cond_1c
    new-instance v3, Ll/po90;

    .line 904
    .line 905
    invoke-direct {v3, p0, v0}, Ll/po90;-><init>(Ll/ap90;Lcom/p1/mobile/putong/data/User;)V

    .line 906
    .line 907
    .line 908
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 909
    .line 910
    .line 911
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 912
    .line 913
    .line 914
    move-result-object v0

    .line 915
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 916
    .line 917
    const/high16 v3, 0x40a00000    # 5.0f

    .line 918
    .line 919
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 920
    .line 921
    .line 922
    move-result v3

    .line 923
    invoke-virtual {v0, v2, v2, v3, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 924
    .line 925
    .line 926
    iget-object v0, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 927
    .line 928
    sget v3, Ll/adc0;->X0:I

    .line 929
    .line 930
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 931
    .line 932
    .line 933
    move-result-object v0

    .line 934
    if-eqz v0, :cond_1d

    .line 935
    .line 936
    goto :goto_11

    .line 937
    :cond_1d
    iget-object p0, p0, Ll/ap90;->Y:Landroid/widget/LinearLayout;

    .line 938
    .line 939
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 940
    .line 941
    .line 942
    :cond_1e
    :goto_11
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ap90;->x0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 5
    .line 6
    iget-object v0, v0, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    iget-boolean v1, p0, Ll/ap90;->P0:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/high16 v1, 0x40c00000    # 6.0f

    .line 13
    .line 14
    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/high16 v1, 0x41000000    # 8.0f

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 36
    .line 37
    iget-object v0, p0, Ll/eo90;->j:Landroid/widget/ImageView;

    .line 38
    .line 39
    iget-object p0, p0, Ll/eo90;->l:Landroid/widget/ImageView;

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    new-array v1, v1, [Landroid/view/View;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    aput-object v0, v1, v2

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    aput-object p0, v1, v0

    .line 49
    .line 50
    invoke-interface {p1, v1}, Ll/t3m;->G([Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 14
    .line 15
    iget-object p0, p0, Ll/eo90;->b:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    const/high16 v0, 0x41a00000    # 20.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/data/IntlGender;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v1, Ll/c9c0;->B:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "male"

    .line 18
    .line 19
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget p1, Ll/c9c0;->j:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_0
    const-string v1, "nonbinary"

    .line 43
    .line 44
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    sget p1, Ll/c9c0;->k:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_1
    return v0
.end method

.method public final z0(Lcom/p1/mobile/putong/data/IntlGender;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v1, Ll/dbc0;->lm:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "male"

    .line 18
    .line 19
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget p1, Ll/dbc0;->jm:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    const-string v1, "nonbinary"

    .line 43
    .line 44
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/no90;->O()Ll/t3m;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    sget p1, Ll/dbc0;->km:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_1
    return-object v0
.end method
