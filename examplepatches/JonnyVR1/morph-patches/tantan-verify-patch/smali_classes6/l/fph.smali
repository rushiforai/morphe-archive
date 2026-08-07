.class public abstract Ll/fph;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"

# interfaces
.implements Ll/gi80$a;


# static fields
.field public static K:Ljava/lang/String; = "from_poi_diaog"


# instance fields
.field public A:I

.field public B:I

.field public C:Lcom/p1/mobile/putong/data/MessageLocation;

.field public D:Z

.field public E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

.field public F:Z

.field public G:Ll/uul;

.field public H:Ljava/lang/String;

.field public I:Ll/l4g0;

.field public J:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VLinear;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VLinear;

.field public m:Lv/VDraweeView;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VLinear;

.field public p:Lv/VDraweeView;

.field public q:Landroid/widget/TextView;

.field public r:Lv/VLinear;

.field public s:Lv/VDraweeView;

.field public t:Landroid/widget/TextView;

.field public u:Lv/VEditText;

.field public v:Lv/VText;

.field public w:Landroid/widget/TextView;

.field public x:Lcom/p1/mobile/android/app/Act;

.field public y:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

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
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/fph;->z:Z

    .line 6
    .line 7
    new-instance v0, Ll/fph$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fph$a;-><init>(Ll/fph;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/fph;->J:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/fph;->M(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic A(Ll/fph;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic D(Ll/fph;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fph;->y:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private K(Landroid/view/View;)V
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
    iget v1, p0, Ll/fph;->A:I

    .line 14
    .line 15
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Ll/fph;->A:I

    .line 20
    .line 21
    iget v2, p0, Ll/fph;->B:I

    .line 22
    .line 23
    if-ne v2, v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iput v0, p0, Ll/fph;->B:I

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
    new-instance p0, Ll/cph;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/cph;-><init>(Landroid/view/View;)V

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

.method private M(Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p1, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fph;->I()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private P()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/fph;->J()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Landroid/app/Dialog;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/fph;->I:Ll/l4g0;

    .line 16
    .line 17
    iget-boolean v1, p0, Ll/fph;->F:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "poi_lighten_guide"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v1, "poi_lighten_click"

    .line 25
    .line 26
    :goto_0
    const-string v2, "poi_pop_type"

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 33
    .line 34
    iget-boolean v3, v2, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget v2, v2, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 41
    .line 42
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v3, "showtime"

    .line 47
    .line 48
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object p0, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "user_segment"

    .line 57
    .line 58
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {v1, v2, p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private Q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fph;->N()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fph;->R()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/fph;->c0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/toh;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/toh;-><init>(Ll/fph;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic q(Landroid/view/View;)V
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

.method public static synthetic r(Ll/fph;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/fph;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fph;->T(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic t(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fph;->V(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic u(Ll/fph;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fph;->U(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fph;->W(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w(Ll/fph;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/fph;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fph;->b0()V

    return-void
.end method

.method public static synthetic y(Ll/fph;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/fph;Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->S(Ll/g90;)V

    return-void
.end method


# virtual methods
.method public E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gph;->b(Ll/fph;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

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
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

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
    iget-object v0, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-static {v0}, Ll/vh80;->f(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/aph;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/aph;-><init>(Ll/fph;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/bph;

    .line 33
    .line 34
    invoke-direct {p0}, Ll/bph;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/fph;->e0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public G(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fph;->D:Z

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
    new-instance p2, Ll/dph;

    .line 37
    .line 38
    invoke-direct {p2, p0, p5, p4}, Ll/dph;-><init>(Ll/fph;Ll/x20;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance p3, Ll/eph;

    .line 42
    .line 43
    invoke-direct {p3, p0, p5}, Ll/eph;-><init>(Ll/fph;Ll/x20;)V

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

.method public H(Ljava/lang/String;)V
    .locals 4

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
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 19
    .line 20
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 27
    .line 28
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "showtime"

    .line 33
    .line 34
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "user_segment"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 54
    .line 55
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 56
    .line 57
    iget-object p1, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 58
    .line 59
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 60
    .line 61
    iget-boolean p1, p0, Ll/fph;->F:Z

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    const-string p1, "poi_lighten_guide"

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const-string p1, "poi_lighten_click"

    .line 69
    .line 70
    :goto_1
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->from:Ljava/lang/String;

    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 73
    .line 74
    const-string v2, "poi"

    .line 75
    .line 76
    invoke-virtual {p1, v1, v2}, Ll/jka;->Y6(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v2, Ll/uoh;

    .line 81
    .line 82
    invoke-direct {v2, p0, v1, v0}, Ll/uoh;-><init>(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 83
    .line 84
    .line 85
    new-instance v3, Ll/voh;

    .line 86
    .line 87
    invoke-direct {v3, p0, v1, v0}, Ll/voh;-><init>(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public I()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/fph;->E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public abstract J()Ljava/lang/String;
.end method

.method public L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

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

.method public final N()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x42dc0000    # 110.0f

    .line 10
    .line 11
    const/high16 v2, 0x430c0000    # 140.0f

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/fph;->e:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik1JWFhaVkpSR1RDWTJXUDUyQlhYWk1VS1lXTlhMNjE0IiwidyI6NDIwLCJoIjozMzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMzA2MzE1ODIxMzM3MzUwNjY0fQ.png"

    .line 28
    .line 29
    invoke-virtual {v0, v3, v4, v2, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/fph;->d:Landroid/view/View;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/fph;->g:Lv/VText;

    .line 39
    .line 40
    const/high16 v1, 0x41c00000    # 24.0f

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/fph;->g:Lv/VText;

    .line 46
    .line 47
    const/high16 v1, -0x1000000

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/fph;->i:Lv/VLinear;

    .line 53
    .line 54
    sget v1, Ll/lbc0;->m3:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/fph;->l:Lv/VLinear;

    .line 60
    .line 61
    sget v1, Ll/lbc0;->m3:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/fph;->o:Lv/VLinear;

    .line 67
    .line 68
    sget v1, Ll/lbc0;->m3:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/fph;->r:Lv/VLinear;

    .line 74
    .line 75
    sget v1, Ll/lbc0;->m3:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/fph;->u:Lv/VEditText;

    .line 81
    .line 82
    iget-object v1, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    sget v2, Ll/k9c0;->c:I

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/fph;->u:Lv/VEditText;

    .line 98
    .line 99
    const/high16 v1, 0x41800000    # 16.0f

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/fph;->v:Lv/VText;

    .line 105
    .line 106
    sget v1, Ll/lbc0;->n3:I

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/fph;->w:Landroid/widget/TextView;

    .line 112
    .line 113
    sget v1, Ll/lbc0;->k:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 120
    .line 121
    iget-object v3, p0, Ll/fph;->e:Lv/VDraweeView;

    .line 122
    .line 123
    iget-object v4, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 124
    .line 125
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->icon:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v3, v4, v2, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 136
    .line 137
    .line 138
    :goto_0
    iget-object v0, p0, Ll/fph;->g:Lv/VText;

    .line 139
    .line 140
    iget-object v1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->title:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/fph;->g:Lv/VText;

    .line 148
    .line 149
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/fph;->v:Lv/VText;

    .line 155
    .line 156
    const/4 v1, 0x0

    .line 157
    const/4 v2, 0x1

    .line 158
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/ikh;->a()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-nez v1, :cond_1

    .line 170
    .line 171
    iget-object v1, p0, Ll/fph;->w:Landroid/widget/TextView;

    .line 172
    .line 173
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    :cond_1
    iget-object v0, p0, Ll/fph;->f:Landroid/widget/ImageView;

    .line 177
    .line 178
    new-instance v1, Ll/woh;

    .line 179
    .line 180
    invoke-direct {v1, p0}, Ll/woh;-><init>(Ll/fph;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/fph;->b:Landroid/view/View;

    .line 187
    .line 188
    new-instance v1, Ll/xoh;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/xoh;-><init>(Ll/fph;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Ll/fph;->c:Landroid/widget/RelativeLayout;

    .line 197
    .line 198
    new-instance v1, Ll/yoh;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/yoh;-><init>(Ll/fph;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Ll/fph;->v:Lv/VText;

    .line 207
    .line 208
    new-instance v1, Ll/zoh;

    .line 209
    .line 210
    invoke-direct {v1, p0}, Ll/zoh;-><init>(Ll/fph;)V

    .line 211
    .line 212
    .line 213
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Ll/fph;->F()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Ll/fph;->d0()V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public final O(Ll/g90;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/g90;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 32
    .line 33
    return-void
.end method

.method public abstract R()V
.end method

.method public final synthetic S(Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->O(Ll/g90;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fph;->e0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic T(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fph;->D:Z

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
    invoke-virtual {p0}, Ll/fph;->J()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p3, p0}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 45
    .line 46
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 57
    .line 58
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic U(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/fph;->D:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
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
    invoke-virtual {p0}, Ll/fph;->J()Ljava/lang/String;

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
    iget-boolean p1, p0, Ll/fph;->F:Z

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/ci80;->h()Ll/ci80;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ll/ci80;->r(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Ll/fph;->J()Ljava/lang/String;

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

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fph;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fph;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fph;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_poi_tag"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fph;->J()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fph;->i0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fph;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ll/fph;->K(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public abstract d0()V
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fph;->L()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gi80;->b()Ll/gi80;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Ll/gi80;->d(Ll/gi80$a;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fph;->G:Ll/uul;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/fph;->G:Ll/uul;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/uul;->c()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/fph;->I:Ll/l4g0;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-direct {p0}, Ll/fph;->P()V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ll/fph;->I:Ll/l4g0;

    .line 35
    .line 36
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final e0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fph;->v:Lv/VText;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public f0(Ll/uul;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fph;->G:Ll/uul;

    .line 2
    .line 3
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fph;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    iput-object p1, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    return-void
.end method

.method public final i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Ll/fph;->K:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/fph;->x:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget v0, Ll/a8c0;->i:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public o(Ll/g90;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Ll/fph;->O(Ll/g90;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fph;->e0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fph;->d0()V

    .line 11
    .line 12
    .line 13
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
    iput-object v0, p0, Ll/fph;->y:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fph;->y:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object v1, p0, Ll/fph;->J:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

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
    iget-object v0, p0, Ll/fph;->G:Ll/uul;

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
    iget-object v0, p0, Ll/fph;->G:Ll/uul;

    .line 59
    .line 60
    invoke-interface {v0}, Ll/uul;->b()V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-direct {p0}, Ll/fph;->Q()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/fph;->I:Ll/l4g0;

    .line 67
    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    invoke-direct {p0}, Ll/fph;->P()V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p0, p0, Ll/fph;->I:Ll/l4g0;

    .line 74
    .line 75
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
