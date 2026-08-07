.class public Ll/ush;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"

# interfaces
.implements Ll/gi80$a;
.implements Ll/bqh$a;
.implements Ll/fqh$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ush$b;
    }
.end annotation


# instance fields
.field public A:I

.field public B:Ll/bqh;

.field public C:Ll/kcg0;

.field public D:Ll/fqh;

.field public E:Ljava/lang/String;

.field public F:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Lv/VEditText;

.field public i:Lv/VText;

.field public j:Lv/VRecyclerView;

.field public k:Landroid/widget/TextView;

.field public l:Z

.field public m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public n:Lcom/p1/mobile/android/app/Act;

.field public o:I

.field public p:Ll/l4g0;

.field public q:Ljava/lang/String;

.field public r:Ll/uul;

.field public s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

.field public t:Ljava/lang/String;

.field public u:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/data/MessageLocation;

.field public x:Lcom/p1/mobile/putong/data/Emotion;

.field public y:Z

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ush$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ush$a;-><init>(Ll/ush;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ush;->F:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/ush;->Y(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Ll/ush;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ush;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/ush;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ush;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Ll/ush;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ush;->g0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static bridge synthetic E(Ll/ush;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ush;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private O(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 7
    .line 8
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 15
    .line 16
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "showtime"

    .line 21
    .line 22
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "user_segment"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 42
    .line 43
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 44
    .line 45
    iget-object p1, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 46
    .line 47
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ush;->S()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->from:Ljava/lang/String;

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 56
    .line 57
    const-string v2, "poi"

    .line 58
    .line 59
    invoke-virtual {p1, v1, v2}, Ll/jka;->Y6(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v2, Ll/jsh;

    .line 64
    .line 65
    invoke-direct {v2, p0, v1, v0}, Ll/jsh;-><init>(Ll/ush;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 66
    .line 67
    .line 68
    new-instance v3, Ll/ksh;

    .line 69
    .line 70
    invoke-direct {v3, p0, v1, v0}, Ll/ksh;-><init>(Ll/ush;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private P(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u672a\u83b7\u53d6\u5185\u5bb9\uff0c\u53d1\u5e03\u5931\u8d25"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/ush;->l:Z

    .line 15
    .line 16
    iget-object v0, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "source_page"

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ush;->S()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    filled-new-array {v1}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "e_set_my_state_post"

    .line 43
    .line 44
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 48
    .line 49
    invoke-direct {p0, v0, p1}, Ll/ush;->t0(Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-direct {p0, p1}, Ll/ush;->O(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private W(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Ll/ush;->z:I

    .line 14
    .line 15
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Ll/ush;->z:I

    .line 20
    .line 21
    iget v2, p0, Ll/ush;->A:I

    .line 22
    .line 23
    if-ne v2, v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iput v0, p0, Ll/ush;->A:I

    .line 27
    .line 28
    add-int/lit16 v1, v1, -0xc8

    .line 29
    .line 30
    if-ge v0, v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/rsh;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/rsh;-><init>(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private Y(Landroid/content/Context;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ush;->n:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/ush;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ush;->h:Lv/VEditText;

    .line 2
    .line 3
    const-string v1, "\u8bf7\u8f93\u5165\u60a8\u6b64\u523b\u7684\u60f3\u6cd5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/ikh;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Ll/ush;->k:Landroid/widget/TextView;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "\u5b8c\u6210"

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, p0, Ll/ush;->e:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ush;->V()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/ush;->e:Lv/VText;

    .line 39
    .line 40
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ush;->f:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ush;->R()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ush;->d:Landroid/widget/ImageView;

    .line 55
    .line 56
    new-instance v1, Ll/hsh;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/hsh;-><init>(Ll/ush;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/ush;->b:Landroid/view/View;

    .line 65
    .line 66
    new-instance v1, Ll/lsh;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/lsh;-><init>(Ll/ush;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/ush;->c:Landroid/widget/RelativeLayout;

    .line 75
    .line 76
    new-instance v1, Ll/msh;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/msh;-><init>(Ll/ush;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/ush;->k:Landroid/widget/TextView;

    .line 85
    .line 86
    new-instance v1, Ll/nsh;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/nsh;-><init>(Ll/ush;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private c0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ush;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ush;->b0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ush;->a0()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/ush;->q0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ush;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ush;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ush;->X()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/ush;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ush;->e0(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method private q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/qsh;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/qsh;-><init>(Ll/ush;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic r(Ll/ush;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ush;->h0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s(Ll/ush;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ush;->n0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic t(Ll/ush;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ush;->f0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method private t0(Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x3c

    .line 17
    .line 18
    if-le v1, v2, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    :cond_0
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p2, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 28
    .line 29
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    new-instance p2, Lcom/p1/mobile/putong/data/TextTheme;

    .line 34
    .line 35
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 39
    .line 40
    iput-object v1, p2, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 43
    .line 44
    iput-object p1, p2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 45
    .line 46
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, v0, p0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic u(Ll/ush;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ush;->i0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic v(Ll/ush;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ush;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->K:I

    .line 2
    .line 3
    neg-int v0, v0

    .line 4
    int-to-float v0, v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic x(Ll/ush;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ush;->p0()V

    return-void
.end method

.method public static synthetic y(Ll/ush;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ush;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z(Ll/ush;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ush;->k0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vsh;->b(Ll/ush;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ush;->v:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public H(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ush;->u:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public I(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public J(Ll/uul;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush;->r:Ll/uul;

    .line 2
    .line 3
    return-void
.end method

.method public K(Ljava/lang/String;Ll/l4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush;->q:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ush;->p:Ll/l4g0;

    .line 4
    .line 5
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public M(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ush;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public N(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ush;->y:Z

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/DetectRequest;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DetectRequest;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/data/DetectText;

    .line 12
    .line 13
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/DetectText;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p2, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p2, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/jka;->P6(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/tsh;

    .line 37
    .line 38
    invoke-direct {p2, p0, p5, p4}, Ll/tsh;-><init>(Ll/ush;Ll/x20;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance p3, Ll/ish;

    .line 42
    .line 43
    invoke-direct {p3, p0, p5}, Ll/ish;-><init>(Ll/ush;Ll/x20;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v0, v1}, Ll/vh80;->g(Lcom/p1/mobile/putong/data/MessageLocation;I)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/osh;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/osh;-><init>(Ll/ush;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ll/psh;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/psh;-><init>(Ll/ush;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/ush;->C:Ll/kcg0;

    .line 27
    .line 28
    return-void
.end method

.method public final R()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    const-string v1, "\u70b9\u4eae\u8db3\u8ff9\uff0c\u67e5\u770b\u6765\u8fc7\u8fd9\u91cc\u7684\u4eba"

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object p0, Ll/owi;->o:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    return-object v1

    .line 23
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_2
    iget-object p0, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->desc:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0
.end method

.method public final S()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ush;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "poi_lighten_guide"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "poi_lighten_click"

    .line 11
    .line 12
    return-object p0
.end method

.method public T()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ush;->q:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public final U()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/owi;->g:Ll/wyd0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    const-string v2, ""

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->emotionId:Ljava/lang/String;

    .line 22
    .line 23
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x0

    .line 28
    if-nez v3, :cond_3

    .line 29
    .line 30
    :try_start_0
    const-class v3, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 31
    .line 32
    invoke-static {v1, v3}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_3

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-eqz v5, :cond_1

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    check-cast v5, Lcom/p1/mobile/putong/data/Emotion;

    .line 69
    .line 70
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v2, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_2

    .line 77
    .line 78
    move-object v4, v5

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catch_0
    move-exception v1

    .line 85
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    const/4 v2, 0x0

    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    invoke-interface {v0, v2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_6

    .line 103
    .line 104
    iget-object v1, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 105
    .line 106
    if-nez v1, :cond_5

    .line 107
    .line 108
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Lcom/p1/mobile/putong/data/Emotion;

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Ll/ush;->e(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    iget-object v1, p0, Ll/ush;->D:Ll/fqh;

    .line 118
    .line 119
    iget-object p0, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 120
    .line 121
    invoke-virtual {v1, v0, p0}, Ll/fqh;->K(Ljava/util/List;Lcom/p1/mobile/putong/data/Emotion;)V

    .line 122
    .line 123
    .line 124
    :cond_6
    return-void
.end method

.method public final V()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    const-string v1, "\u544a\u8bc9\u9644\u8fd1\u7684\u4eba\u4f60\u6765\u4e86"

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object p0, Ll/owi;->n:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    return-object v1

    .line 23
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_2
    iget-object p0, p0, Ll/ush;->s:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0
.end method

.method public X()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v1, "input_method"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isActive()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v1, 0x2

    .line 42
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final a0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

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
    iget-object v0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ksg;->n(Lcom/p1/mobile/putong/data/DoublePair;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x7d0

    .line 18
    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 23
    .line 24
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/ush;->j:Lv/VRecyclerView;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/bqh;

    .line 43
    .line 44
    iget-object v1, p0, Ll/ush;->n:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, p0, Ll/ush;->t:Ljava/lang/String;

    .line 51
    .line 52
    invoke-direct {v0, v1, v2, v3}, Ll/bqh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/ush;->B:Ll/bqh;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/bqh;->O(Ll/bqh$a;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/ush;->j:Lv/VRecyclerView;

    .line 61
    .line 62
    iget-object v1, p0, Ll/ush;->B:Ll/bqh;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ush;->Q()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final b0()V
    .locals 4

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/ush;->g:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/fqh;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ush;->n:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/ush;->t:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {v0, v1, v2, v3}, Ll/fqh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/ush;->D:Ll/fqh;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/fqh;->L(Ll/fqh$b;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ush;->g:Lv/VRecyclerView;

    .line 38
    .line 39
    iget-object v1, p0, Ll/ush;->D:Ll/fqh;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ush;->U()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final d0()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/ush;->o:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public dismiss()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ush;->X()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ush;->v:Ll/y20;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ush;->v:Ll/y20;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/gi80;->b()Ll/gi80;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, Ll/gi80;->d(Ll/gi80$a;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ush;->r:Ll/uul;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/ush;->r:Ll/uul;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/uul;->c()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/ush;->p:Ll/l4g0;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Ll/ush;->p:Ll/l4g0;

    .line 51
    .line 52
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Ll/ush;->C:Ll/kcg0;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Ll/ush;->C:Ll/kcg0;

    .line 64
    .line 65
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Ll/ush;->C:Ll/kcg0;

    .line 72
    .line 73
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 74
    .line 75
    .line 76
    :cond_3
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ush;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/ush;->y:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic f0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ush;->y:Z

    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Detect;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Ll/ush;->q:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p3, p0}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 55
    .line 56
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 6

    .line 1
    const-string p3, "\u53d1\u5e03\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p3}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/16 v3, 0xc9

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    move-object v1, p1

    .line 18
    move-object v5, p2

    .line 19
    invoke-virtual/range {v0 .. v5}, Ll/er60;->n(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/util/Map;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ush;->d0()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/ci80;->h()Ll/ci80;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ll/ci80;->r(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    const-string v0, "\u53d1\u5e03\u5931\u8d25"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/ush;->T()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const/4 v5, 0x0

    .line 15
    move-object v2, p1

    .line 16
    move-object v6, p2

    .line 17
    move-object v4, p3

    .line 18
    invoke-virtual/range {v1 .. v6}, Ll/er60;->o(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/util/Map;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic i0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/ush;->s0(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/ush;->s0(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ush;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ush;->P(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ush;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o(Ll/g90;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ush;->B:Ll/bqh;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/bqh;->J(Ll/g90;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ush;->j:Lv/VRecyclerView;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/ush;->h:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ush;->h:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    move-object v1, p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/ush;->E:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const-string p0, "\u8bf7\u8f93\u5165\u60a8\u6b64\u523b\u7684\u60f3\u6cd5"

    .line 46
    .line 47
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object p1, p0, Ll/ush;->E:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ll/ush;->P(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ush;->dismiss()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string p1, "moment"

    .line 61
    .line 62
    invoke-static {p1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    new-instance v5, Ll/ssh;

    .line 67
    .line 68
    invoke-direct {v5, p0, v1}, Ll/ssh;-><init>(Ll/ush;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const-string v3, "moment"

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    move-object v0, p0

    .line 75
    invoke-virtual/range {v0 .. v5}, Ll/ush;->N(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ush;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ll/ush;->W(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ush;->x:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget-object v1, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_1
    :try_start_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    move-object v0, v2

    .line 18
    :cond_2
    :try_start_1
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_3
    move-object v2, v1

    .line 24
    :goto_0
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    goto :goto_1

    .line 33
    :catch_0
    move-exception v0

    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    :goto_2
    return-void

    .line 45
    :cond_4
    iput-object v0, p0, Ll/ush;->E:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ush;->h:Lv/VEditText;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final s0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/cqh;->b()Ll/cqh;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Ll/cqh;

    .line 22
    .line 23
    iget-object v2, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    invoke-direct {v1, v2, v3}, Ll/cqh;-><init>(Lcom/p1/mobile/putong/data/MessageLocation;I)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 53
    .line 54
    iget-object v2, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 55
    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/ush;->l(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    new-instance v2, Ll/cqh;

    .line 62
    .line 63
    const/4 v3, 0x3

    .line 64
    invoke-direct {v2, v1, v3}, Ll/cqh;-><init>(Lcom/p1/mobile/putong/data/MessageLocation;I)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-static {}, Ll/cqh;->a()Ll/cqh;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/ush;->B:Ll/bqh;

    .line 79
    .line 80
    iget-object p0, p0, Ll/ush;->w:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 81
    .line 82
    invoke-virtual {p1, v0, p0}, Ll/bqh;->N(Ljava/util/List;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/ush;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/ush;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object v1, p0, Ll/ush;->F:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/gi80;->b()Ll/gi80;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, p0}, Ll/gi80;->a(Ll/gi80$a;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/ush;->r:Ll/uul;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object v0, p0, Ll/ush;->r:Ll/uul;

    .line 59
    .line 60
    invoke-interface {v0}, Ll/uul;->b()V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-direct {p0}, Ll/ush;->c0()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/ush;->u:Ll/y20;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/ush;->u:Ll/y20;

    .line 75
    .line 76
    const-string v1, ""

    .line 77
    .line 78
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object v0, p0, Ll/ush;->p:Ll/l4g0;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    iget-object p0, p0, Ll/ush;->p:Ll/l4g0;

    .line 90
    .line 91
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    return-void
.end method
