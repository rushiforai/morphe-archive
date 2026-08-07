.class public Ll/cb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public A:Landroid/widget/ImageView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/widget/ImageView;

.field public E:Landroid/widget/ImageView;

.field public F:Landroid/widget/TextView;

.field public G:Landroid/widget/LinearLayout;

.field public H:Landroid/widget/LinearLayout;

.field public I:Landroid/widget/LinearLayout;

.field public J:Landroid/widget/TextView;

.field public K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

.field public L:I

.field public M:Ljava/lang/String;

.field public N:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public O:Ljava/lang/String;

.field public P:Ljava/lang/String;

.field public Q:Ljava/lang/String;

.field public R:Ljava/lang/String;

.field public S:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public T:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Action;",
            ">;"
        }
    .end annotation
.end field

.field public V:Ljava/lang/String;

.field public W:Ljava/lang/String;

.field public X:Z

.field public Y:Ll/x0m;

.field public Z:J

.field public a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

.field public a0:Ljava/lang/Boolean;

.field public b:Lv/VProgressBar;

.field public b0:Z

.field public c:Landroid/widget/ImageButton;

.field public c0:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/view/View;

.field public p:Landroid/view/View;

.field public q:Landroid/view/View;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/LinearLayout;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/ImageView;

.field public w:Landroid/widget/ImageView;

.field public x:Landroid/widget/TextView;

.field public y:Landroid/widget/LinearLayout;

.field public z:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/cb0;->L:I

    .line 6
    .line 7
    const-string v1, "#000000"

    .line 8
    .line 9
    iput-object v1, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/cb0;->X:Z

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Ll/cb0;->Z:J

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    iput-object v1, p0, Ll/cb0;->a0:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/cb0;->b0:Z

    .line 22
    .line 23
    new-instance v0, Ll/ha0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/ha0;-><init>(Ll/cb0;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/cb0;->c0:Ll/y20;

    .line 29
    .line 30
    iput-object p1, p0, Ll/cb0;->Y:Ll/x0m;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic A(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->d0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Ll/cb0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->Y(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C(Ll/cb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic D(Ll/cb0;)Lv/VProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cb0;->b:Lv/VProgressBar;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/cb0;)Landroid/widget/ImageButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cb0;->c:Landroid/widget/ImageButton;

    return-object p0
.end method

.method public static bridge synthetic F(Ll/cb0;)Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    return-object p0
.end method

.method public static synthetic h(Ll/cb0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->X(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i(Ll/cb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb0;->N()V

    return-void
.end method

.method public static synthetic j(Ll/cb0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->R(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method

.method public static synthetic k(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->c0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cb0;->P(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic m(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cb0;->Q(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic n(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->a0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Ll/cb0;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->e0(Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->S(Lcom/p1/mobile/putong/data/Action;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic r(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->b0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sget p2, Ll/qa00;->a:I

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic t(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic u(Ll/cb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sget p4, Ll/qa00;->a:I

    .line 12
    .line 13
    invoke-virtual {p1, p4, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p4, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3, p4, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic w(Ll/cb0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->U(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x(Ll/cb0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->T(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic y(Ll/cb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb0;->O()V

    return-void
.end method

.method public static synthetic z(Ll/cb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->W(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public G(Landroid/view/View;I)V
    .locals 4

    .line 1
    if-nez p2, :cond_4

    .line 2
    .line 3
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "omsCard"

    .line 8
    .line 9
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string v1, "omsCardLiterature"

    .line 14
    .line 15
    const-wide/16 v2, 0x3e8

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Ll/cb0;->Y:Ll/x0m;

    .line 20
    .line 21
    invoke-interface {p2}, Ll/x0m;->I()V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/ab0;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/ab0;-><init>(Ll/cb0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    iget-object p2, p0, Ll/cb0;->Y:Ll/x0m;

    .line 44
    .line 45
    invoke-interface {p2}, Ll/x0m;->O3()V

    .line 46
    .line 47
    .line 48
    new-instance p2, Ll/bb0;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Ll/bb0;-><init>(Ll/cb0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p1, p2, v2, v2}, Ll/rj50;->Z(Ljava/lang/String;IZ)Z

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 81
    .line 82
    invoke-static {p1}, Ll/fb0;->k(Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    const-string p2, "p_suggest_users_home_view"

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    const-string p1, "card_name"

    .line 98
    .line 99
    iget-object p0, p0, Ll/cb0;->M:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    filled-new-array {p0}, [Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "e_oms_card"

    .line 110
    .line 111
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_4

    .line 124
    .line 125
    const-string p1, "artwork_title"

    .line 126
    .line 127
    iget-object v0, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v0, p0, Ll/cb0;->W:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/cb0;->t0(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    const-string v0, "artwork_type"

    .line 140
    .line 141
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    const-string p1, "e_artwork_card"

    .line 150
    .line 151
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cb0;->c0:Ll/y20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "card_name"

    .line 9
    .line 10
    iget-object p0, p0, Ll/cb0;->M:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "e_oms_card"

    .line 21
    .line 22
    const-string v1, "p_suggest_users_home_view"

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final I()V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/qa00;->i:I

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    const v2, 0xffffff

    .line 18
    .line 19
    .line 20
    filled-new-array {v2, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v3, Landroid/animation/ArgbEvaluator;

    .line 29
    .line 30
    invoke-direct {v3}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 34
    .line 35
    .line 36
    const-wide/16 v3, 0x1f4

    .line 37
    .line 38
    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    new-instance v5, Ll/la0;

    .line 42
    .line 43
    invoke-direct {v5, v1, v0}, Ll/la0;-><init>(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 47
    .line 48
    .line 49
    const v5, 0x4dffffff    # 5.3687088E8f

    .line 50
    .line 51
    .line 52
    filled-new-array {v5, v2}, [I

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v5, Landroid/animation/ArgbEvaluator;

    .line 61
    .line 62
    invoke-direct {v5}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v5}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    new-instance v5, Ll/ma0;

    .line 72
    .line 73
    invoke-direct {v5, v2, v0}, Ll/ma0;-><init>(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 77
    .line 78
    .line 79
    const v5, -0x7f000001

    .line 80
    .line 81
    .line 82
    const/high16 v6, -0x1b000000

    .line 83
    .line 84
    filled-new-array {v5, v6}, [I

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    new-instance v6, Landroid/animation/ArgbEvaluator;

    .line 93
    .line 94
    invoke-direct {v6}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v5, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    .line 103
    new-instance v3, Ll/na0;

    .line 104
    .line 105
    invoke-direct {v3, p0, v5, v0}, Ll/na0;-><init>(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v5, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->start()V

    .line 118
    .line 119
    .line 120
    new-instance v0, Ll/cb0$c;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/cb0$c;-><init>(Ll/cb0;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v5, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final J()V
    .locals 11

    .line 1
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v6, 0x0

    .line 7
    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    sget v0, Ll/qa00;->j:I

    .line 11
    .line 12
    int-to-float v1, v0

    .line 13
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    .line 17
    .line 18
    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 22
    .line 23
    .line 24
    int-to-float v1, v0

    .line 25
    invoke-virtual {v5, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    .line 29
    .line 30
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v6}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 34
    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 38
    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    const v1, 0xffffff

    .line 42
    .line 43
    .line 44
    filled-new-array {v1, v0}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 53
    .line 54
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 58
    .line 59
    .line 60
    const-wide/16 v8, 0x320

    .line 61
    .line 62
    invoke-virtual {v7, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/ia0;

    .line 66
    .line 67
    invoke-direct {v0, v7, v4, v5, v3}, Ll/ia0;-><init>(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 71
    .line 72
    .line 73
    const v0, 0x4dffffff    # 5.3687088E8f

    .line 74
    .line 75
    .line 76
    filled-new-array {v0, v1}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object v10

    .line 84
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 85
    .line 86
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v10, v0}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v10, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/ja0;

    .line 96
    .line 97
    invoke-direct {v0, v10, v4, v5, v3}, Ll/ja0;-><init>(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v10, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 101
    .line 102
    .line 103
    const v0, -0x7f000001

    .line 104
    .line 105
    .line 106
    const/high16 v1, -0x1b000000

    .line 107
    .line 108
    filled-new-array {v0, v1}, [I

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 117
    .line 118
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v0}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 125
    .line 126
    .line 127
    new-instance v0, Ll/ka0;

    .line 128
    .line 129
    move-object v1, p0

    .line 130
    invoke-direct/range {v0 .. v5}, Ll/ka0;-><init>(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v10}, Landroid/animation/ValueAnimator;->start()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 143
    .line 144
    .line 145
    new-instance p0, Ll/cb0$d;

    .line 146
    .line 147
    invoke-direct {p0, v1}, Ll/cb0$d;-><init>(Ll/cb0;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, v1, Ll/cb0;->U:Ljava/util/List;

    .line 154
    .line 155
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    const/4 v0, 0x3

    .line 160
    if-eqz p0, :cond_0

    .line 161
    .line 162
    iget-object p0, v1, Ll/cb0;->U:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-ne p0, v0, :cond_0

    .line 169
    .line 170
    iget-object p0, v1, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 171
    .line 172
    invoke-virtual {p0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_0
    iget-object p0, v1, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 177
    .line 178
    const/16 v2, 0x8

    .line 179
    .line 180
    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    :goto_0
    iget-object p0, v1, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 184
    .line 185
    invoke-virtual {p0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 186
    .line 187
    .line 188
    iget-object p0, v1, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 189
    .line 190
    invoke-virtual {p0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 191
    .line 192
    .line 193
    new-instance p0, Landroid/view/animation/AlphaAnimation;

    .line 194
    .line 195
    const/4 v2, 0x0

    .line 196
    const/high16 v3, 0x3f800000    # 1.0f

    .line 197
    .line 198
    invoke-direct {p0, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 202
    .line 203
    .line 204
    iget-object v4, v1, Ll/cb0;->U:Ljava/util/List;

    .line 205
    .line 206
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-eqz v4, :cond_1

    .line 211
    .line 212
    iget-object v4, v1, Ll/cb0;->U:Ljava/util/List;

    .line 213
    .line 214
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-ne v4, v0, :cond_1

    .line 219
    .line 220
    iget-object v4, v1, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 221
    .line 222
    invoke-virtual {v4, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 223
    .line 224
    .line 225
    :cond_1
    iget-object v4, v1, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 226
    .line 227
    invoke-virtual {v4, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 228
    .line 229
    .line 230
    iget-object v4, v1, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 231
    .line 232
    invoke-virtual {v4, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 233
    .line 234
    .line 235
    new-instance p0, Landroid/view/animation/AlphaAnimation;

    .line 236
    .line 237
    invoke-direct {p0, v3, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 241
    .line 242
    .line 243
    iget-object v2, v1, Ll/cb0;->U:Ljava/util/List;

    .line 244
    .line 245
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    if-eqz v2, :cond_2

    .line 250
    .line 251
    iget-object v2, v1, Ll/cb0;->U:Ljava/util/List;

    .line 252
    .line 253
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-ne v2, v0, :cond_2

    .line 258
    .line 259
    iget-object v0, v1, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 260
    .line 261
    invoke-virtual {v0, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 262
    .line 263
    .line 264
    :cond_2
    iget-object v0, v1, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 265
    .line 266
    invoke-virtual {v0, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, v1, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 270
    .line 271
    invoke-virtual {v0, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 272
    .line 273
    .line 274
    return-void
.end method

.method public final K(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/cdc0;->O:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iput-object v0, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    sget v0, Ll/cdc0;->G:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 18
    .line 19
    iput-object v0, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 20
    .line 21
    sget v0, Ll/cdc0;->b:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/LinearLayout;

    .line 28
    .line 29
    iput-object v0, p0, Ll/cb0;->H:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    sget v0, Ll/cdc0;->j:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VDraweeView;

    .line 38
    .line 39
    iput-object v0, p0, Ll/cb0;->g:Lv/VDraweeView;

    .line 40
    .line 41
    sget v0, Ll/cdc0;->W:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 48
    .line 49
    iput-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 50
    .line 51
    sget v0, Ll/cdc0;->c:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 58
    .line 59
    iput-object v0, p0, Ll/cb0;->e:Landroid/widget/RelativeLayout;

    .line 60
    .line 61
    sget v0, Ll/cdc0;->f:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VDraweeView;

    .line 68
    .line 69
    iput-object v0, p0, Ll/cb0;->h:Lv/VDraweeView;

    .line 70
    .line 71
    sget v0, Ll/cdc0;->g:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VDraweeView;

    .line 78
    .line 79
    iput-object v0, p0, Ll/cb0;->i:Lv/VDraweeView;

    .line 80
    .line 81
    sget v0, Ll/cdc0;->k:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/widget/TextView;

    .line 88
    .line 89
    iput-object v0, p0, Ll/cb0;->m:Landroid/widget/TextView;

    .line 90
    .line 91
    sget v0, Ll/cdc0;->e:I

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Landroid/widget/TextView;

    .line 98
    .line 99
    iput-object v0, p0, Ll/cb0;->n:Landroid/widget/TextView;

    .line 100
    .line 101
    sget v0, Ll/cdc0;->a:I

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Landroid/widget/TextView;

    .line 108
    .line 109
    iput-object v0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 110
    .line 111
    sget v0, Ll/cdc0;->R:I

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Landroid/widget/TextView;

    .line 118
    .line 119
    iput-object v0, p0, Ll/cb0;->j:Landroid/widget/TextView;

    .line 120
    .line 121
    sget v0, Ll/cdc0;->S:I

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Landroid/widget/TextView;

    .line 128
    .line 129
    iput-object v0, p0, Ll/cb0;->k:Landroid/widget/TextView;

    .line 130
    .line 131
    sget v0, Ll/cdc0;->T:I

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Landroid/widget/TextView;

    .line 138
    .line 139
    iput-object v0, p0, Ll/cb0;->l:Landroid/widget/TextView;

    .line 140
    .line 141
    sget v0, Ll/cdc0;->Z:I

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Ll/cb0;->o:Landroid/view/View;

    .line 148
    .line 149
    sget v0, Ll/cdc0;->Y:I

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iput-object v0, p0, Ll/cb0;->p:Landroid/view/View;

    .line 156
    .line 157
    sget v0, Ll/cdc0;->A:I

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Ll/cb0;->q:Landroid/view/View;

    .line 164
    .line 165
    sget v0, Ll/cdc0;->B:I

    .line 166
    .line 167
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Landroid/widget/LinearLayout;

    .line 172
    .line 173
    iput-object v0, p0, Ll/cb0;->G:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->g:Landroid/widget/ImageButton;

    .line 178
    .line 179
    iput-object v0, p0, Ll/cb0;->c:Landroid/widget/ImageButton;

    .line 180
    .line 181
    sget v0, Ll/cdc0;->i:I

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Lv/VProgressBar;

    .line 188
    .line 189
    iput-object v0, p0, Ll/cb0;->b:Lv/VProgressBar;

    .line 190
    .line 191
    sget v0, Ll/cdc0;->d:I

    .line 192
    .line 193
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    check-cast v0, Landroid/widget/TextView;

    .line 198
    .line 199
    iput-object v0, p0, Ll/cb0;->s:Landroid/widget/TextView;

    .line 200
    .line 201
    sget v0, Ll/cdc0;->u:I

    .line 202
    .line 203
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Landroid/widget/LinearLayout;

    .line 208
    .line 209
    iput-object v0, p0, Ll/cb0;->t:Landroid/widget/LinearLayout;

    .line 210
    .line 211
    sget v0, Ll/cdc0;->l:I

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Landroid/widget/LinearLayout;

    .line 218
    .line 219
    iput-object v0, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 220
    .line 221
    sget v0, Ll/cdc0;->r:I

    .line 222
    .line 223
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    check-cast v0, Landroid/widget/ImageView;

    .line 228
    .line 229
    iput-object v0, p0, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 230
    .line 231
    sget v0, Ll/cdc0;->o:I

    .line 232
    .line 233
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    check-cast v0, Landroid/widget/ImageView;

    .line 238
    .line 239
    iput-object v0, p0, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 240
    .line 241
    sget v0, Ll/cdc0;->x:I

    .line 242
    .line 243
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, Landroid/widget/TextView;

    .line 248
    .line 249
    iput-object v0, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 250
    .line 251
    sget v0, Ll/cdc0;->m:I

    .line 252
    .line 253
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    check-cast v0, Landroid/widget/LinearLayout;

    .line 258
    .line 259
    iput-object v0, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 260
    .line 261
    sget v0, Ll/cdc0;->s:I

    .line 262
    .line 263
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    check-cast v0, Landroid/widget/ImageView;

    .line 268
    .line 269
    iput-object v0, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 270
    .line 271
    sget v0, Ll/cdc0;->p:I

    .line 272
    .line 273
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    check-cast v0, Landroid/widget/ImageView;

    .line 278
    .line 279
    iput-object v0, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 280
    .line 281
    sget v0, Ll/cdc0;->y:I

    .line 282
    .line 283
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    check-cast v0, Landroid/widget/TextView;

    .line 288
    .line 289
    iput-object v0, p0, Ll/cb0;->B:Landroid/widget/TextView;

    .line 290
    .line 291
    sget v0, Ll/cdc0;->n:I

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    check-cast v0, Landroid/widget/LinearLayout;

    .line 298
    .line 299
    iput-object v0, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 300
    .line 301
    sget v0, Ll/cdc0;->t:I

    .line 302
    .line 303
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    check-cast v0, Landroid/widget/ImageView;

    .line 308
    .line 309
    iput-object v0, p0, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 310
    .line 311
    sget v0, Ll/cdc0;->q:I

    .line 312
    .line 313
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    check-cast v0, Landroid/widget/ImageView;

    .line 318
    .line 319
    iput-object v0, p0, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 320
    .line 321
    sget v0, Ll/cdc0;->z:I

    .line 322
    .line 323
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    check-cast v0, Landroid/widget/TextView;

    .line 328
    .line 329
    iput-object v0, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 330
    .line 331
    sget v0, Ll/cdc0;->Q:I

    .line 332
    .line 333
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    check-cast v0, Landroid/widget/LinearLayout;

    .line 338
    .line 339
    iput-object v0, p0, Ll/cb0;->I:Landroid/widget/LinearLayout;

    .line 340
    .line 341
    sget v0, Ll/cdc0;->U:I

    .line 342
    .line 343
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    check-cast p1, Landroid/widget/TextView;

    .line 348
    .line 349
    iput-object p1, p0, Ll/cb0;->J:Landroid/widget/TextView;

    .line 350
    .line 351
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/data/OMSAdCardInfo;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 36
    .line 37
    instance-of v0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 42
    .line 43
    iput-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v0, p0, Ll/cb0;->M:Ljava/lang/String;

    .line 48
    .line 49
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->showCartoon:Z

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ll/cb0;->a0:Ljava/lang/Boolean;

    .line 56
    .line 57
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 60
    .line 61
    const-string v0, "omsCard"

    .line 62
    .line 63
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    iget-object p1, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 74
    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCard;->pictures:Ljava/util/List;

    .line 76
    .line 77
    iput-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCard;->color:Ljava/lang/String;

    .line 80
    .line 81
    iput-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCard;->title:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCard;->description:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v0, p0, Ll/cb0;->R:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCard;->icons:Ljava/util/List;

    .line 92
    .line 93
    iput-object v0, p0, Ll/cb0;->S:Ljava/util/List;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsCard;->topLeftTags:Ljava/util/List;

    .line 96
    .line 97
    iput-object p1, p0, Ll/cb0;->T:Ljava/util/List;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 101
    .line 102
    const-string v0, "omsCardLiterature"

    .line 103
    .line 104
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_1

    .line 109
    .line 110
    iget-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCardLiterature:Lcom/p1/mobile/putong/data/OmsCardLiterature;

    .line 115
    .line 116
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 117
    .line 118
    iput-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 119
    .line 120
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 125
    .line 126
    iput-object v0, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v0, p0, Ll/cb0;->Q:Ljava/lang/String;

    .line 131
    .line 132
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v0, p0, Ll/cb0;->R:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 137
    .line 138
    iput-object v0, p0, Ll/cb0;->S:Ljava/util/List;

    .line 139
    .line 140
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 141
    .line 142
    iput-object v0, p0, Ll/cb0;->T:Ljava/util/List;

    .line 143
    .line 144
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 145
    .line 146
    iput-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 147
    .line 148
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 149
    .line 150
    iput-object v0, p0, Ll/cb0;->V:Ljava/lang/String;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 153
    .line 154
    iput-object p1, p0, Ll/cb0;->W:Ljava/lang/String;

    .line 155
    .line 156
    :cond_1
    :goto_0
    :try_start_0
    iget-object p1, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :catch_0
    move-exception p1

    .line 163
    const-string v0, "#000000"

    .line 164
    .line 165
    iput-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 166
    .line 167
    new-instance v0, Ljava/lang/RuntimeException;

    .line 168
    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v2, "\u914d\u7f6e\u5e73\u53f0\u989c\u8272\u683c\u5f0f\u914d\u7f6e\u9519\u8bef"

    .line 172
    .line 173
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    :goto_1
    iget-object p0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 194
    .line 195
    return-object p0

    .line 196
    :cond_2
    const/4 p0, 0x0

    .line 197
    return-object p0
.end method

.method public final M(Lcom/p1/mobile/putong/data/Video;)F
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 11
    .line 12
    int-to-float p0, p0

    .line 13
    mul-float/2addr p0, v0

    .line 14
    int-to-float p1, p1

    .line 15
    div-float/2addr p0, p1

    .line 16
    return p0
.end method

.method public final synthetic N()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cb0;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/cb0;->X:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cb0;->I()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic O()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cb0;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/cb0;->X:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cb0;->J()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic P(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p3, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic Q(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p5, p0, Ll/cb0;->U:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p5

    .line 17
    if-eqz p5, :cond_0

    .line 18
    .line 19
    iget-object p5, p0, Ll/cb0;->U:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    const/4 v0, 0x3

    .line 26
    if-ne p5, v0, :cond_0

    .line 27
    .line 28
    iget-object p5, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {p5, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/cb0;->B:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p2, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    invoke-virtual {p2, p4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/Action;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Lrx/c;
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cb0;->V:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/p;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "patch"

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 27
    .line 28
    iget-object p0, p0, Ll/cb0;->V:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->id:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0, p2, v1, p1}, Lcom/p1/mobile/putong/core/api/p;->n3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final synthetic T(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x0m;->v0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/cb0;->c0:Ll/y20;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 24
    .line 25
    const-string p1, "e_artwork_card"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const-string p0, "\u5df2\u6dfb\u52a0"

    .line 31
    .line 32
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic U(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x0m;->v0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/cb0;->L:I

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    add-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cb0;->p0(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cb0;->N:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget p1, p0, Ll/cb0;->L:I

    .line 10
    .line 11
    iget-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    if-ge p1, v0, :cond_0

    .line 20
    .line 21
    iget p1, p0, Ll/cb0;->L:I

    .line 22
    .line 23
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/cb0;->p0(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic X(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x0m;->v0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/cb0;->c0:Ll/y20;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "\u5df2\u6dfb\u52a0"

    .line 20
    .line 21
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 29
    .line 30
    const-string p1, "e_artwork_card"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic Y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x0m;->v0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb0;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->h0(Lcom/p1/mobile/putong/data/Action;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->h0(Lcom/p1/mobile/putong/data/Action;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->h0(Lcom/p1/mobile/putong/data/Action;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/nec0;->a:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb0;->h0(Lcom/p1/mobile/putong/data/Action;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/cb0;->L(I)Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/cb0;->K(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/cb0;->v0(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    const-string p1, "omsCard"

    .line 20
    .line 21
    iget-object p2, p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/x0m;->O3()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/cb0;->M(Lcom/p1/mobile/putong/data/Video;)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->k(Ljava/lang/String;F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->f:Lv/VDraweeView;

    .line 27
    .line 28
    const/4 p2, 0x4

    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/cb0;->c:Landroid/widget/ImageButton;

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final f0(I)V
    .locals 11

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "#"

    .line 4
    .line 5
    const-string v2, "#00"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    new-instance v1, Ljava/lang/RuntimeException;

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "\u914d\u7f6e\u5e73\u53f0\u989c\u8272\u683c\u5f0f\u914d\u7f6e\u9519\u8bef"

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    :goto_0
    iget-object v1, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 56
    .line 57
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 58
    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 62
    .line 63
    .line 64
    sget v4, Ll/qa00;->o:I

    .line 65
    .line 66
    int-to-float v4, v4

    .line 67
    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 71
    .line 72
    .line 73
    sget v4, Ll/qa00;->g:I

    .line 74
    .line 75
    const-string v5, "#00000000"

    .line 76
    .line 77
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 85
    .line 86
    invoke-virtual {v4, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 87
    .line 88
    .line 89
    iget-object v4, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 90
    .line 91
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 95
    .line 96
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 97
    .line 98
    .line 99
    filled-new-array {v0, v1, v1}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 107
    .line 108
    .line 109
    sget v0, Ll/qa00;->j:I

    .line 110
    .line 111
    int-to-float v1, v0

    .line 112
    int-to-float v4, v0

    .line 113
    int-to-float v5, v0

    .line 114
    int-to-float v0, v0

    .line 115
    const/16 v6, 0x8

    .line 116
    .line 117
    new-array v7, v6, [F

    .line 118
    .line 119
    const/4 v8, 0x0

    .line 120
    aput v8, v7, v3

    .line 121
    .line 122
    const/4 v9, 0x1

    .line 123
    aput v8, v7, v9

    .line 124
    .line 125
    const/4 v9, 0x2

    .line 126
    aput v8, v7, v9

    .line 127
    .line 128
    const/4 v10, 0x3

    .line 129
    aput v8, v7, v10

    .line 130
    .line 131
    const/4 v8, 0x4

    .line 132
    aput v1, v7, v8

    .line 133
    .line 134
    const/4 v1, 0x5

    .line 135
    aput v4, v7, v1

    .line 136
    .line 137
    const/4 v1, 0x6

    .line 138
    aput v5, v7, v1

    .line 139
    .line 140
    const/4 v1, 0x7

    .line 141
    aput v0, v7, v1

    .line 142
    .line 143
    invoke-virtual {v2, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/cb0;->H:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 155
    .line 156
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 160
    .line 161
    .line 162
    sget v1, Ll/qa00;->i:I

    .line 163
    .line 164
    int-to-float v1, v1

    .line 165
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 166
    .line 167
    .line 168
    iget-boolean v1, p0, Ll/cb0;->X:Z

    .line 169
    .line 170
    if-nez v1, :cond_2

    .line 171
    .line 172
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 173
    .line 174
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    sget v2, Ll/e9c0;->l:I

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 185
    .line 186
    .line 187
    sget v1, Ll/qa00;->a:I

    .line 188
    .line 189
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 190
    .line 191
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    sget v4, Ll/e9c0;->g:I

    .line 196
    .line 197
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 202
    .line 203
    .line 204
    if-ne p1, v9, :cond_0

    .line 205
    .line 206
    iget-object p1, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 217
    .line 218
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 219
    .line 220
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    sget v1, Ll/e9c0;->i:I

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 234
    .line 235
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 236
    .line 237
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    sget v1, Ll/e9c0;->i:I

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 251
    .line 252
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 256
    .line 257
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 258
    .line 259
    .line 260
    goto :goto_1

    .line 261
    :cond_0
    if-ne p1, v10, :cond_1

    .line 262
    .line 263
    iget-object p1, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 264
    .line 265
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 269
    .line 270
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 274
    .line 275
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 276
    .line 277
    .line 278
    iget-object p1, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 279
    .line 280
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 281
    .line 282
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    sget v1, Ll/e9c0;->i:I

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Ll/cb0;->B:Landroid/widget/TextView;

    .line 296
    .line 297
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 298
    .line 299
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    sget v1, Ll/e9c0;->i:I

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 313
    .line 314
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 315
    .line 316
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    sget v1, Ll/e9c0;->i:I

    .line 321
    .line 322
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 330
    .line 331
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 332
    .line 333
    .line 334
    iget-object p1, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 335
    .line 336
    invoke-virtual {p1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 337
    .line 338
    .line 339
    :cond_1
    :goto_1
    iget-object p1, p0, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 340
    .line 341
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 345
    .line 346
    invoke-virtual {p1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 350
    .line 351
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 352
    .line 353
    .line 354
    iget-object p0, p0, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 355
    .line 356
    invoke-virtual {p0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 357
    .line 358
    .line 359
    goto/16 :goto_3

    .line 360
    .line 361
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 362
    .line 363
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    sget v2, Ll/e9c0;->m:I

    .line 368
    .line 369
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 374
    .line 375
    .line 376
    sget v1, Ll/qa00;->a:I

    .line 377
    .line 378
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 379
    .line 380
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    sget v4, Ll/e9c0;->l:I

    .line 385
    .line 386
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 387
    .line 388
    .line 389
    move-result v2

    .line 390
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 391
    .line 392
    .line 393
    if-ne p1, v9, :cond_3

    .line 394
    .line 395
    iget-object p1, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 396
    .line 397
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 398
    .line 399
    .line 400
    iget-object p1, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 401
    .line 402
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 403
    .line 404
    .line 405
    iget-object p1, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 406
    .line 407
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 408
    .line 409
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    sget v1, Ll/e9c0;->k:I

    .line 414
    .line 415
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 416
    .line 417
    .line 418
    move-result v0

    .line 419
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 420
    .line 421
    .line 422
    iget-object p1, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 423
    .line 424
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 425
    .line 426
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    sget v1, Ll/e9c0;->k:I

    .line 431
    .line 432
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 437
    .line 438
    .line 439
    iget-object p1, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 440
    .line 441
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 442
    .line 443
    .line 444
    iget-object p1, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 445
    .line 446
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 447
    .line 448
    .line 449
    goto :goto_2

    .line 450
    :cond_3
    if-ne p1, v10, :cond_4

    .line 451
    .line 452
    iget-object p1, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 453
    .line 454
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 455
    .line 456
    .line 457
    iget-object p1, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 458
    .line 459
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 460
    .line 461
    .line 462
    iget-object p1, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 463
    .line 464
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 465
    .line 466
    .line 467
    iget-object p1, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 468
    .line 469
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 470
    .line 471
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    sget v1, Ll/e9c0;->k:I

    .line 476
    .line 477
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 478
    .line 479
    .line 480
    move-result v0

    .line 481
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 482
    .line 483
    .line 484
    iget-object p1, p0, Ll/cb0;->B:Landroid/widget/TextView;

    .line 485
    .line 486
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 487
    .line 488
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    sget v1, Ll/e9c0;->k:I

    .line 493
    .line 494
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 499
    .line 500
    .line 501
    iget-object p1, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 502
    .line 503
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 504
    .line 505
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    sget v1, Ll/e9c0;->k:I

    .line 510
    .line 511
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 512
    .line 513
    .line 514
    move-result v0

    .line 515
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 516
    .line 517
    .line 518
    iget-object p1, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 519
    .line 520
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 521
    .line 522
    .line 523
    iget-object p1, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 524
    .line 525
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 526
    .line 527
    .line 528
    :cond_4
    :goto_2
    iget-object p1, p0, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 529
    .line 530
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 531
    .line 532
    .line 533
    iget-object p1, p0, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 534
    .line 535
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 536
    .line 537
    .line 538
    iget-object p1, p0, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 539
    .line 540
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 541
    .line 542
    .line 543
    iget-object p0, p0, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 544
    .line 545
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 546
    .line 547
    .line 548
    :goto_3
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 6

    .line 1
    sget-object p2, Ll/cb0$e;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    aget p2, p2, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const-string v1, "omsCard"

    .line 11
    .line 12
    if-eq p2, v0, :cond_3

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p2, v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    if-eq p2, v0, :cond_0

    .line 19
    .line 20
    const-string p2, ""

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/cb0;->s0()V

    .line 24
    .line 25
    .line 26
    const-string p2, "right"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    :cond_2
    const-string p2, "left"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    const-string p2, "\u4e0d\u6d88\u8017\u8d85\u7ea7\u559c\u6b22"

    .line 48
    .line 49
    invoke-static {p2}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/cb0;->s0()V

    .line 53
    .line 54
    .line 55
    const-string p2, "up"

    .line 56
    .line 57
    :goto_0
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v2, "swipe_type"

    .line 64
    .line 65
    const-string v3, "p_suggest_users_home_view"

    .line 66
    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    const-string v0, "card_name"

    .line 80
    .line 81
    iget-object v4, p0, Ll/cb0;->M:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    filled-new-array {v0, p2}, [Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const-string v0, "e_oms_card"

    .line 96
    .line 97
    invoke-static {v0, v3, p2}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 102
    .line 103
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 112
    .line 113
    const-string v4, "omsCardLiterature"

    .line 114
    .line 115
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 122
    .line 123
    invoke-interface {v0}, Ll/x0m;->I()V

    .line 124
    .line 125
    .line 126
    const-string v0, "artwork_title"

    .line 127
    .line 128
    iget-object v4, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v4, "artwork_type"

    .line 135
    .line 136
    iget-object v5, p0, Ll/cb0;->W:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    filled-new-array {v0, v4, p2}, [Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    const-string v0, "e_artwork_card"

    .line 151
    .line 152
    invoke-static {v0, v3, p2}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 153
    .line 154
    .line 155
    :cond_5
    :goto_1
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 156
    .line 157
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-eqz p2, :cond_6

    .line 162
    .line 163
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 164
    .line 165
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_6

    .line 172
    .line 173
    iget-object p2, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 174
    .line 175
    invoke-static {p1, p2}, Ll/db0;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V

    .line 176
    .line 177
    .line 178
    :cond_6
    const/4 p1, 0x0

    .line 179
    iput-object p1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 180
    .line 181
    const/4 p1, 0x0

    .line 182
    iput p1, p0, Ll/cb0;->L:I

    .line 183
    .line 184
    iput-boolean p1, p0, Ll/cb0;->X:Z

    .line 185
    .line 186
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 187
    .line 188
    return-object p0
.end method

.method public final g0()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    :try_start_0
    iget-object v1, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "#"

    .line 10
    .line 11
    const-string v3, "#00"

    .line 12
    .line 13
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception v1

    .line 23
    new-instance v2, Ljava/lang/RuntimeException;

    .line 24
    .line 25
    new-instance v3, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v4, "\u914d\u7f6e\u5e73\u53f0\u989c\u8272\u683c\u5f0f\u914d\u7f6e\u9519\u8bef"

    .line 28
    .line 29
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/cb0;->O:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    :goto_0
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 56
    .line 57
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 58
    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 62
    .line 63
    .line 64
    sget v4, Ll/qa00;->o:I

    .line 65
    .line 66
    int-to-float v5, v4

    .line 67
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 68
    .line 69
    .line 70
    sget v5, Ll/qa00;->g:I

    .line 71
    .line 72
    invoke-virtual {v2, v5, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object v5, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    sget v6, Ll/qa00;->f:I

    .line 81
    .line 82
    invoke-virtual {v5, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    iget-object v5, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 86
    .line 87
    invoke-virtual {v5, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 91
    .line 92
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 93
    .line 94
    .line 95
    filled-new-array {v1, v0, v0}, [I

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 103
    .line 104
    .line 105
    int-to-float v0, v4

    .line 106
    int-to-float v1, v4

    .line 107
    int-to-float v5, v4

    .line 108
    int-to-float v4, v4

    .line 109
    const/16 v6, 0x8

    .line 110
    .line 111
    new-array v6, v6, [F

    .line 112
    .line 113
    const/4 v7, 0x0

    .line 114
    aput v7, v6, v3

    .line 115
    .line 116
    const/4 v8, 0x1

    .line 117
    aput v7, v6, v8

    .line 118
    .line 119
    const/4 v8, 0x2

    .line 120
    aput v7, v6, v8

    .line 121
    .line 122
    const/4 v8, 0x3

    .line 123
    aput v7, v6, v8

    .line 124
    .line 125
    const/4 v7, 0x4

    .line 126
    aput v0, v6, v7

    .line 127
    .line 128
    const/4 v0, 0x5

    .line 129
    aput v1, v6, v0

    .line 130
    .line 131
    const/4 v0, 0x6

    .line 132
    aput v5, v6, v0

    .line 133
    .line 134
    const/4 v0, 0x7

    .line 135
    aput v4, v6, v0

    .line 136
    .line 137
    invoke-virtual {v2, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/cb0;->H:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 146
    .line 147
    .line 148
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 149
    .line 150
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 154
    .line 155
    .line 156
    sget v1, Ll/qa00;->i:I

    .line 157
    .line 158
    int-to-float v1, v1

    .line 159
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 169
    .line 170
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eqz v2, :cond_0

    .line 175
    .line 176
    sget v2, Ll/qa00;->A:I

    .line 177
    .line 178
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 179
    .line 180
    sget v2, Ll/qa00;->m:I

    .line 181
    .line 182
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 183
    .line 184
    sget v2, Ll/qa00;->j:I

    .line 185
    .line 186
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 187
    .line 188
    iget-object v2, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 189
    .line 190
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 191
    .line 192
    .line 193
    :cond_0
    iget-object v1, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 194
    .line 195
    const/high16 v2, 0x41800000    # 16.0f

    .line 196
    .line 197
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 198
    .line 199
    .line 200
    iget-boolean v1, p0, Ll/cb0;->X:Z

    .line 201
    .line 202
    if-nez v1, :cond_1

    .line 203
    .line 204
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 205
    .line 206
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    sget v2, Ll/e9c0;->l:I

    .line 211
    .line 212
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 217
    .line 218
    .line 219
    sget v1, Ll/qa00;->a:I

    .line 220
    .line 221
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 222
    .line 223
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    sget v3, Ll/e9c0;->h:I

    .line 228
    .line 229
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 234
    .line 235
    .line 236
    iget-object v1, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 237
    .line 238
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 239
    .line 240
    .line 241
    iget-object p0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 242
    .line 243
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 244
    .line 245
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    sget v1, Ll/e9c0;->j:I

    .line 250
    .line 251
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 256
    .line 257
    .line 258
    goto :goto_1

    .line 259
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 260
    .line 261
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    sget v2, Ll/e9c0;->m:I

    .line 266
    .line 267
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 272
    .line 273
    .line 274
    sget v1, Ll/qa00;->a:I

    .line 275
    .line 276
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 277
    .line 278
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    sget v3, Ll/e9c0;->l:I

    .line 283
    .line 284
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 289
    .line 290
    .line 291
    iget-object v1, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 292
    .line 293
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 294
    .line 295
    .line 296
    iget-object p0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 297
    .line 298
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 299
    .line 300
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    sget v1, Ll/e9c0;->a:I

    .line 305
    .line 306
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 311
    .line 312
    .line 313
    :goto_1
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/data/Action;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->U7()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-static {}, Ll/pf7;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v3, p0, Ll/cb0;->V:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->kh(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v0, v1}, Ll/x0m;->z1(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/oa0;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/oa0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/pa0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/pa0;-><init>(Ll/cb0;)V

    .line 68
    .line 69
    .line 70
    new-instance v2, Ll/qa0;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Ll/qa0;-><init>(Ll/cb0;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p0, p1}, Ll/cb0;->j0(Lcom/p1/mobile/putong/data/Action;)V

    .line 84
    .line 85
    .line 86
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/cb0;->u0(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string v0, "artwork_card_button_name"

    .line 93
    .line 94
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string v0, "artwork_title"

    .line 99
    .line 100
    iget-object v1, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v1, p0, Ll/cb0;->W:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, v1}, Ll/cb0;->t0(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string v1, "artwork_type"

    .line 113
    .line 114
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "e_artwork_card"

    .line 123
    .line 124
    const-string v0, "p_suggest_users_home_view"

    .line 125
    .line 126
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    :goto_1
    return-void
.end method

.method public final i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cb0;->o:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/xa0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xa0;-><init>(Ll/cb0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cb0;->p:Landroid/view/View;

    .line 12
    .line 13
    new-instance v1, Ll/ya0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ya0;-><init>(Ll/cb0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/data/Action;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->U7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/card/R$string;->b:I

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ll/x0m;->U1(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 24
    .line 25
    iget-object v2, p0, Ll/cb0;->V:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, p1}, Lcom/p1/mobile/putong/core/api/p;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {v0, p1}, Ll/x0m;->z1(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/sa0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/sa0;-><init>(Ll/cb0;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/ta0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/ta0;-><init>(Ll/cb0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final k0(Ljava/util/List;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lv/VDraweeView;",
            "Lv/VDraweeView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v1, 0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-ne p0, v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, p2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p3, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final l0(Lcom/p1/mobile/putong/data/Action;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "to_watch"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget p0, Ll/fbc0;->f:I

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/fbc0;->c:I

    .line 17
    .line 18
    invoke-virtual {p3, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "watching"

    .line 25
    .line 26
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    sget p0, Ll/fbc0;->e:I

    .line 33
    .line 34
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    sget p0, Ll/fbc0;->b:I

    .line 38
    .line 39
    invoke-virtual {p3, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Action;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string p1, "watched"

    .line 46
    .line 47
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    sget p0, Ll/fbc0;->d:I

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    sget p0, Ll/fbc0;->a:I

    .line 59
    .line 60
    invoke-virtual {p3, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final m0(Ljava/util/List;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/widget/TextView;",
            "Landroid/widget/TextView;",
            "Landroid/widget/TextView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-ne p0, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const/4 v3, 0x2

    .line 47
    if-ne p0, v3, :cond_2

    .line 48
    .line 49
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ljava/lang/CharSequence;

    .line 63
    .line 64
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ljava/lang/CharSequence;

    .line 72
    .line 73
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    const/4 v0, 0x3

    .line 78
    if-ne p0, v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    check-cast p0, Ljava/lang/CharSequence;

    .line 94
    .line 95
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Ljava/lang/CharSequence;

    .line 103
    .line 104
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ljava/lang/CharSequence;

    .line 112
    .line 113
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method

.method public final n0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "omsCard"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 30
    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/cb0;->m:Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v2, p0, Ll/cb0;->P:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/cb0;->R:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v2, p0, Ll/cb0;->n:Landroid/widget/TextView;

    .line 58
    .line 59
    const/4 v3, 0x1

    .line 60
    const/4 v4, 0x0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ll/cb0;->R:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/cb0;->n:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/cb0;->n:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    :goto_1
    iget-object v0, p0, Ll/cb0;->S:Ljava/util/List;

    .line 83
    .line 84
    iget-object v1, p0, Ll/cb0;->h:Lv/VDraweeView;

    .line 85
    .line 86
    iget-object v2, p0, Ll/cb0;->i:Lv/VDraweeView;

    .line 87
    .line 88
    invoke-virtual {p0, v0, v1, v2}, Ll/cb0;->k0(Ljava/util/List;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/cb0;->T:Ljava/util/List;

    .line 92
    .line 93
    iget-object v1, p0, Ll/cb0;->j:Landroid/widget/TextView;

    .line 94
    .line 95
    iget-object v2, p0, Ll/cb0;->k:Landroid/widget/TextView;

    .line 96
    .line 97
    iget-object v5, p0, Ll/cb0;->l:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-virtual {p0, v0, v1, v2, v5}, Ll/cb0;->m0(Ljava/util/List;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 103
    .line 104
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    const/16 v1, 0x8

    .line 109
    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iget-object v2, p0, Ll/cb0;->G:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    if-le v0, v3, :cond_3

    .line 121
    .line 122
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 126
    .line 127
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 131
    .line 132
    iget-object v1, p0, Ll/cb0;->N:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_3
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    :goto_2
    iget v0, p0, Ll/cb0;->L:I

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Ll/cb0;->p0(I)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_4
    iget-object v0, p0, Ll/cb0;->G:Landroid/widget/LinearLayout;

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 162
    .line 163
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final o0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "omsCard"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/cb0;->s:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/cb0;->t:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/cb0;->g0()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 35
    .line 36
    new-instance v1, Ll/ga0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ga0;-><init>(Ll/cb0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/cb0;->I:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 60
    .line 61
    const-string v3, "omsCardLiterature"

    .line 62
    .line 63
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    iget-object v0, p0, Ll/cb0;->r:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_4

    .line 89
    .line 90
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    const/4 v1, 0x2

    .line 97
    if-lt v0, v1, :cond_4

    .line 98
    .line 99
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    const/4 v3, 0x3

    .line 106
    if-gt v0, v3, :cond_4

    .line 107
    .line 108
    iget-object v0, p0, Ll/cb0;->t:Landroid/widget/LinearLayout;

    .line 109
    .line 110
    const/4 v4, 0x1

    .line 111
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/p1/mobile/putong/data/Action;

    .line 121
    .line 122
    iget-object v5, p0, Ll/cb0;->x:Landroid/widget/TextView;

    .line 123
    .line 124
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v5, p0, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 130
    .line 131
    iget-object v6, p0, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 132
    .line 133
    invoke-virtual {p0, v0, v5, v6}, Ll/cb0;->l0(Lcom/p1/mobile/putong/data/Action;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    .line 134
    .line 135
    .line 136
    iget-object v5, p0, Ll/cb0;->u:Landroid/widget/LinearLayout;

    .line 137
    .line 138
    new-instance v6, Ll/ra0;

    .line 139
    .line 140
    invoke-direct {v6, p0, v0}, Ll/ra0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v5, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/cb0;->v:Landroid/widget/ImageView;

    .line 147
    .line 148
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/cb0;->w:Landroid/widget/ImageView;

    .line 152
    .line 153
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/cb0;->Q:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    iget-object v5, p0, Ll/cb0;->s:Landroid/widget/TextView;

    .line 163
    .line 164
    if-nez v0, :cond_1

    .line 165
    .line 166
    iget-object v0, p0, Ll/cb0;->Q:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/cb0;->s:Landroid/widget/TextView;

    .line 172
    .line 173
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_1
    const-string v0, ""

    .line 178
    .line 179
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Ll/cb0;->s:Landroid/widget/TextView;

    .line 183
    .line 184
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    :goto_0
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-ne v0, v1, :cond_2

    .line 194
    .line 195
    iget-object v0, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 196
    .line 197
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Lcom/p1/mobile/putong/data/Action;

    .line 207
    .line 208
    iget-object v1, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 209
    .line 210
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 216
    .line 217
    iget-object v2, p0, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 218
    .line 219
    invoke-virtual {p0, v0, v1, v2}, Ll/cb0;->l0(Lcom/p1/mobile/putong/data/Action;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    .line 220
    .line 221
    .line 222
    iget-object v1, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 223
    .line 224
    new-instance v2, Ll/ua0;

    .line 225
    .line 226
    invoke-direct {v2, p0, v0}, Ll/ua0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 233
    .line 234
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-virtual {p0, v0}, Ll/cb0;->f0(I)V

    .line 239
    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_2
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 243
    .line 244
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-ne v0, v3, :cond_3

    .line 249
    .line 250
    iget-object v0, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 251
    .line 252
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 256
    .line 257
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Lcom/p1/mobile/putong/data/Action;

    .line 262
    .line 263
    iget-object v2, p0, Ll/cb0;->U:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    check-cast v1, Lcom/p1/mobile/putong/data/Action;

    .line 270
    .line 271
    iget-object v2, p0, Ll/cb0;->B:Landroid/widget/TextView;

    .line 272
    .line 273
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    .line 277
    .line 278
    iget-object v2, p0, Ll/cb0;->z:Landroid/widget/ImageView;

    .line 279
    .line 280
    iget-object v3, p0, Ll/cb0;->A:Landroid/widget/ImageView;

    .line 281
    .line 282
    invoke-virtual {p0, v0, v2, v3}, Ll/cb0;->l0(Lcom/p1/mobile/putong/data/Action;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    .line 283
    .line 284
    .line 285
    iget-object v2, p0, Ll/cb0;->y:Landroid/widget/LinearLayout;

    .line 286
    .line 287
    new-instance v3, Ll/va0;

    .line 288
    .line 289
    invoke-direct {v3, p0, v0}, Ll/va0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V

    .line 290
    .line 291
    .line 292
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Ll/cb0;->F:Landroid/widget/TextView;

    .line 296
    .line 297
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Action;->value:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Ll/cb0;->D:Landroid/widget/ImageView;

    .line 303
    .line 304
    iget-object v2, p0, Ll/cb0;->E:Landroid/widget/ImageView;

    .line 305
    .line 306
    invoke-virtual {p0, v1, v0, v2}, Ll/cb0;->l0(Lcom/p1/mobile/putong/data/Action;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Ll/cb0;->C:Landroid/widget/LinearLayout;

    .line 310
    .line 311
    new-instance v2, Ll/wa0;

    .line 312
    .line 313
    invoke-direct {v2, p0, v1}, Ll/wa0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V

    .line 314
    .line 315
    .line 316
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 317
    .line 318
    .line 319
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/cb0;->U:Ljava/util/List;

    .line 320
    .line 321
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    invoke-virtual {p0, v0}, Ll/cb0;->f0(I)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :cond_4
    iget-object p0, p0, Ll/cb0;->t:Landroid/widget/LinearLayout;

    .line 330
    .line 331
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 332
    .line 333
    .line 334
    :cond_5
    return-void
.end method

.method public final p0(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/cb0;->L:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/cb0;->N:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    iget-object v1, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/cb0;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    instance-of p1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/cb0;->r0(Lcom/p1/mobile/putong/data/Media;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0, v0}, Ll/cb0;->q0(Lcom/p1/mobile/putong/data/Media;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cb0;->b:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->f:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->i(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cb0;->g:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object v1, p0, Ll/cb0;->g:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ub(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v2, Ll/cb0$a;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/cb0$a;-><init>(Ll/cb0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1, p1, v2}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final r0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cb0;->b:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cb0;->c:Landroid/widget/ImageButton;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cb0;->c:Landroid/widget/ImageButton;

    .line 13
    .line 14
    new-instance v2, Ll/za0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/za0;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Media;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->f:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/cb0;->g:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Al(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v2, p0, Ll/cb0;->a:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->f:Lv/VDraweeView;

    .line 57
    .line 58
    new-instance v3, Ll/cb0$b;

    .line 59
    .line 60
    invoke-direct {v3, p0, p1}, Ll/cb0$b;-><init>(Ll/cb0;Lcom/p1/mobile/putong/data/Media;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v2, v0, v3}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final s0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "omsCard"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->omsCard:Lcom/p1/mobile/putong/data/OmsCard;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Action;->deeplink:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/pf7;->g()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "guideNewUserCompleteMaterial"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Action;->deeplink:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, "&from=app_suggest_card"

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 79
    .line 80
    invoke-interface {p0}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ug(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsCard;->action:Lcom/p1/mobile/putong/data/Action;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Action;->deeplink:Ljava/lang/String;

    .line 97
    .line 98
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wa()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Ll/cb0;->K:Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 118
    .line 119
    const-string v2, "blindbox"

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_2

    .line 126
    .line 127
    const-string v0, "&from=youth_vip"

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iget-object p0, p0, Ll/cb0;->Y:Ll/x0m;

    .line 141
    .line 142
    invoke-interface {p0}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ug(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 155
    .line 156
    .line 157
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 162
    .line 163
    const-string v0, "e_oms_card"

    .line 164
    .line 165
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    :cond_3
    :goto_1
    return-void
.end method

.method public final t0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "teleplay"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "tv_show"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p1
.end method

.method public final u0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "to_watch"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "wish"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p1
.end method

.method public final v0(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cb0;->G(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cb0;->i0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cb0;->o0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/cb0;->n0()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/cb0;->d:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
