.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/gio0;",
        ">;",
        "Landroid/text/TextWatcher;"
    }
.end annotation


# static fields
.field public static D:I = 0x10


# instance fields
.field public A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

.field public B:Ll/g4s;

.field public C:Ljava/lang/String;

.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

.field public b:Lv/VRelative;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VEditText;

.field public h:Lv/VEditText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VScroll;

.field public m:Lorg/apmem/tools/layouts/FlowLayout;

.field public n:Lv/VLinear;

.field public o:Lv/VImage;

.field public p:Lv/VLinear;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/TextView;

.field public u:Ll/gio0;

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Landroid/animation/Animator;

.field public z:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y:Landroid/animation/Animator;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v:Z

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w:Z

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y:Landroid/animation/Animator;

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v:Z

    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w:Z

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    const/4 p1, 0x0

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y:Landroid/animation/Animator;

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    return-void
.end method

.method private C()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/qcr;

    .line 4
    .line 5
    new-instance v2, Ll/qio0;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/qio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 8
    .line 9
    .line 10
    const/16 v3, 0x20

    .line 11
    .line 12
    invoke-direct {v1, v3, v2}, Ll/qcr;-><init>(ILl/x20;)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    new-array v4, v2, [Landroid/text/InputFilter;

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    aput-object v1, v4, v5

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->h:Lv/VEditText;

    .line 25
    .line 26
    new-instance v1, Ll/qcr;

    .line 27
    .line 28
    new-instance v4, Ll/qio0;

    .line 29
    .line 30
    invoke-direct {v4, p0}, Ll/qio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {v1, v3, v4}, Ll/qcr;-><init>(ILl/x20;)V

    .line 34
    .line 35
    .line 36
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 37
    .line 38
    aput-object v1, v2, v5

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->h:Lv/VEditText;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gio0;->c4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private T()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yi:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->getTitle()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Di:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ci:I

    .line 46
    .line 47
    new-instance v2, Ll/rio0;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/rio0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 57
    .line 58
    new-instance v2, Ll/sio0;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/sio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/gio0;->r4()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->H(Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->O()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->Q()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->G(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->z()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->P()V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->I(Landroid/view/View;)V

    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->D:I

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final A(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->i:Lv/VText;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/16 p1, 0x8

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final B(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->ba:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final E(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->p:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;)Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->key:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->C:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->p:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->o:Lv/VImage;

    .line 42
    .line 43
    new-instance v0, Ll/iio0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/iio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->S(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H(Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->C:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->U(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->l:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->b:Lv/VRelative;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {}, Ll/bnl0;->w0()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sub-int/2addr v2, v1

    .line 20
    const/high16 v1, 0x43770000    # 247.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-int/2addr v2, v1

    .line 27
    const/high16 v1, 0x431b0000    # 155.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-ge v2, v3, :cond_1

    .line 34
    .line 35
    if-gez v2, :cond_0

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    :cond_0
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 46
    .line 47
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->l:Lv/VScroll;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic P()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gio0;->r4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public R()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final S(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->z:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->z:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-eq v0, p1, :cond_1

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->z:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    xor-int/2addr v0, v1

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    const/4 p2, 0x0

    .line 42
    :goto_1
    invoke-virtual {p0, p2}, Ll/gio0;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final U(Landroid/view/View;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->p:Lv/VLinear;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->p:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-ne v2, p1, :cond_0

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    move v3, v0

    .line 22
    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A(ZLjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public W(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final X()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 v0, 0x33

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Y(Ljava/util/List;ZLjava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;",
            ">;Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->E(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 19
    .line 20
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/wrv;->g()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->n:Lv/VLinear;

    .line 30
    .line 31
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    xor-int/lit8 p2, p2, 0x1

    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 41
    .line 42
    return-void
.end method

.method public final Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->getTitle()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->setTitle(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Ll/gio0;->v4(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public c0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/yec0;->S9:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoiceMicHelpDialogView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->A:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 23
    .line 24
    new-instance v2, Ll/kio0;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/kio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoiceMicHelpDialogView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ll/g4s;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 35
    .line 36
    invoke-direct {v1, v2, v0}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 51
    .line 52
    sget v1, Ll/jgc0;->a:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B:Ll/g4s;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->X()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getSelectedModel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->h:Lv/VEditText;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gio0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u(Ll/gio0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y:Landroid/animation/Animator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->y:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uio0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->F0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->s:Landroid/widget/TextView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->c:Landroid/widget/ImageView;

    .line 17
    .line 18
    new-instance v2, Ll/hio0;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/hio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->q:Lv/VText;

    .line 27
    .line 28
    new-instance v2, Ll/lio0;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/lio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->s:Landroid/widget/TextView;

    .line 37
    .line 38
    new-instance v2, Ll/mio0;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/mio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 47
    .line 48
    new-instance v2, Ll/nio0;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/nio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 57
    .line 58
    new-instance v2, Ll/oio0;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/oio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->i:Lv/VText;

    .line 67
    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    sget-object v3, Ll/zrv;->e:Landroid/app/Application;

    .line 74
    .line 75
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->zi:I

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v3, ":"

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->k:Lv/VText;

    .line 97
    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    sget-object v4, Ll/zrv;->e:Landroid/app/Application;

    .line 104
    .line 105
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bi:I

    .line 106
    .line 107
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 125
    .line 126
    const/high16 v2, 0x3f800000    # 1.0f

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->C()V

    .line 137
    .line 138
    .line 139
    new-instance v0, Ll/pio0;

    .line 140
    .line 141
    invoke-direct {v0, p0}, Ll/pio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 v0, 0x20

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->h:Lv/VEditText;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public u(Ll/gio0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->u:Ll/gio0;

    .line 2
    .line 3
    return-void
.end method

.method public final v(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->k:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x8

    .line 10
    .line 11
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->m:Lorg/apmem/tools/layouts/FlowLayout;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->m:Lorg/apmem/tools/layouts/FlowLayout;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->B(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    .line 47
    .line 48
    new-instance v2, Ll/tio0;

    .line 49
    .line 50
    invoke-direct {v2, p0, v1, v0}, Ll/tio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;->setData(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->m:Lorg/apmem/tools/layouts/FlowLayout;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->x:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->getTitle()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->q:Lv/VText;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->q:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;)Landroid/widget/TextView;
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x2

    .line 13
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    const/high16 v1, 0x41600000    # 14.0f

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/n9c0;->e1:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Ll/obc0;->Y6:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 61
    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    const/high16 v1, 0x41000000    # 8.0f

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 74
    .line 75
    .line 76
    const/high16 v1, 0x41b80000    # 23.0f

    .line 77
    .line 78
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->key:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->key:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_0

    .line 99
    .line 100
    const/16 p1, 0x9

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->key:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    const/4 p1, 0x3

    .line 114
    goto :goto_0

    .line 115
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->key:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_2

    .line 124
    .line 125
    const/4 p1, 0x5

    .line 126
    goto :goto_0

    .line 127
    :cond_2
    const/16 p1, 0xa

    .line 128
    .line 129
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zi:I

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    new-instance v2, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p1, ""

    .line 148
    .line 149
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    new-instance p1, Ll/jio0;

    .line 168
    .line 169
    invoke-direct {p1, p0, v0}, Ll/jio0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/widget/TextView;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 173
    .line 174
    .line 175
    return-object v0
.end method
