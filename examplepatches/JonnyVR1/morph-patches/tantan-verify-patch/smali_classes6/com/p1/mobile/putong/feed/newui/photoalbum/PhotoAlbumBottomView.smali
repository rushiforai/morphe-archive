.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;
.super Lv/VFrame;
.source "SourceFile"


# static fields
.field public static M0:Ljava/lang/String; = " "

.field public static final N0:I

.field public static final O0:I

.field public static final P0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public B:Lv/VDraweeView;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public E0:Ljava/lang/String;

.field public F:Lv/VText;

.field public F0:Z

.field public G:Lv/VImage;

.field public G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public H:Landroid/widget/LinearLayout;

.field public H0:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public I:Lcom/p1/mobile/putong/app/PutongFrag;

.field public I0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public J:Z

.field public J0:Z

.field public K:Lcom/p1/mobile/putong/feed/data/Moment;

.field public K0:Z

.field public L:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public L0:Ljava/lang/String;

.field public M:I

.field public N:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

.field public O:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public P:Ljava/lang/String;

.field public Q:I

.field public R:Z

.field public S:Z

.field public T:Ll/n570;

.field public U:I

.field public V:Ll/t4;

.field public W:Ll/x20;

.field public a:Landroid/widget/ImageView;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VRelative;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

.field public k0:Ljava/lang/String;

.field public l:Lv/VFrame;

.field public m:Lv/VImage;

.field public n:Lv/VDraweeView;

.field public o:Landroid/widget/TextView;

.field public p:Lv/VText;

.field public p0:I

.field public q:Landroid/view/View;

.field public r:Lv/VText;

.field public s:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public t:Lv/VDraweeView;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lcom/tantan/library/svga/SVGAnimationView;

.field public y:Landroid/view/View;

.field public z:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/high16 v0, 0x42500000    # 52.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N0:I

    .line 8
    .line 9
    const/high16 v0, 0x40c00000    # 6.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O0:I

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$b;

    .line 18
    .line 19
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    const-string v2, "viewHeight"

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P0:Landroid/util/Property;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 13
    .line 14
    const-string p1, ""

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S:Z

    .line 20
    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F0:Z

    .line 24
    .line 25
    new-instance p1, Ll/x770;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/x770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    const/4 p2, -0x1

    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 38
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S:Z

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F0:Z

    .line 42
    new-instance p1, Ll/x770;

    invoke-direct {p1, p0}, Ll/x770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    const/4 p2, -0x1

    .line 46
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 48
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    const/4 p1, 0x0

    .line 49
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S:Z

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F0:Z

    .line 52
    new-instance p1, Ll/x770;

    invoke-direct {p1, p0}, Ll/x770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p1(ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->y1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->l1(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->v1(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L(Lv/VEditText;Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

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
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m1(Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->W0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k1(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s1(Landroid/animation/AnimatorSet;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R0(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j1(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public static synthetic Y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lv/VEditText;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O0(Lv/VEditText;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Z0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->r1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->q1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic h1(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    :goto_0
    const-string v1, "moments_user_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_greet_guidance"

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 58
    .line 59
    const-string p1, "greeting_guide"

    .line 60
    .line 61
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    new-instance v7, Ll/a870;

    .line 66
    .line 67
    invoke-direct {v7, p0}, Ll/a870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x0

    .line 71
    const/4 v5, 0x0

    .line 72
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Y0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J:Z

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->X0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->w1(Landroid/animation/AnimatorSet;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lv/VEditText;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q0(Lv/VEditText;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u1(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    return-void
.end method

.method private y0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v1, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/j870;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/j870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/k870;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/k870;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S0(ZLjava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final A0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x2

    .line 9
    new-array v7, p2, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    const-string v1, "alpha"

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    const-wide/16 v4, 0x12c

    .line 19
    .line 20
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v0, Ll/h870;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Ll/h870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public A1(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-static {p1}, Ll/orb0;->r(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public B0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->F:Ljava/util/ArrayList;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public final B1(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;Z)V
    .locals 11

    .line 1
    iget-boolean v7, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 2
    .line 3
    move-object v3, p4

    .line 4
    invoke-virtual {p0, p4, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d2(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    if-eqz v7, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static/range {p4 .. p5}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ll/nkh;->f()Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-static {v0, v1, p1, v3}, Ll/x31;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 33
    .line 34
    iget v4, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    new-instance v0, Ll/v870;

    .line 47
    .line 48
    move-object v1, p0

    .line 49
    move-object v2, p1

    .line 50
    move-object v4, p3

    .line 51
    move/from16 v6, p5

    .line 52
    .line 53
    move-object v5, v3

    .line 54
    move-object v3, p2

    .line 55
    invoke-direct/range {v0 .. v7}, Ll/v870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->W:Ll/x20;

    .line 59
    .line 60
    invoke-interface {v0}, Ll/x20;->call()V

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 64
    .line 65
    const/4 v9, 0x0

    .line 66
    const/4 v10, 0x1

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K0:Z

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 82
    .line 83
    const-string v5, "like"

    .line 84
    .line 85
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 86
    .line 87
    move-object v4, p1

    .line 88
    move-object v3, p4

    .line 89
    invoke-virtual/range {v0 .. v6}, Ll/qvm;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 93
    .line 94
    invoke-virtual {v0, v9}, Landroid/view/View;->setEnabled(Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 98
    .line 99
    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Ll/cmg;->S()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_2

    .line 107
    .line 108
    const-string v0, "https://auto.tancdn.com/v1/raw/66db6975-8b2a-4fc6-be4b-454a6b5024c512.pdf"

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    const-string v0, "feed_like_newui.svga"

    .line 112
    .line 113
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0, v10}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0, v10}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;

    .line 134
    .line 135
    invoke-direct {v1, p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/widget/ImageView;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 148
    .line 149
    if-nez v8, :cond_3

    .line 150
    .line 151
    const-string v1, "1"

    .line 152
    .line 153
    invoke-virtual {v0, v1, v10}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_3
    add-int/2addr v8, v10

    .line 158
    invoke-static {v8}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1, v10}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 167
    .line 168
    if-ne v8, v10, :cond_5

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 175
    .line 176
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1, v9}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_5
    sub-int/2addr v8, v10

    .line 185
    invoke-static {v8}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v0, v1, v9}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 190
    .line 191
    .line 192
    :goto_1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 193
    .line 194
    xor-int/2addr v0, v10

    .line 195
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L1(ZLandroid/widget/ImageView;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public C1(Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendInfo;->category:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, p1, p3, p0}, Ll/orb0;->G(Landroid/content/Context;Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final D0(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M1(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 17
    .line 18
    iget p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H1(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m:Lv/VImage;

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L1(ZLandroid/widget/ImageView;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 33
    .line 34
    new-instance v0, Ll/n870;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/n870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    .line 43
    .line 44
    new-instance v0, Ll/o870;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/o870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final E0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Ll/cmg;->T()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "from_mine_tab_album"

    .line 21
    .line 22
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "from_album"

    .line 31
    .line 32
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    return v1

    .line 56
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 57
    return p0
.end method

.method public E1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_discover_dating"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_nearby_focus"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "from_like"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public F1(ZLl/n570;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Ljava/util/HashMap;Ljava/lang/String;ZIILcom/p1/mobile/putong/feed/data/RawFeed;IZZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/n570;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            "ZII",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            "IZZZ)Z"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O:Ljava/util/HashMap;

    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    iput-object p9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 5
    iput p10, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 6
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    iget-boolean p10, p3, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    const/4 v0, 0x1

    xor-int/2addr p10, v0

    invoke-virtual {p0, p4, p10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 7
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    iget-boolean p10, p3, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    xor-int/2addr p10, v0

    invoke-virtual {p0, p4, p10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 8
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->r:Lv/VText;

    const/4 p10, 0x0

    invoke-virtual {p0, p4, p10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 10
    iput p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S:Z

    .line 12
    iput-boolean p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 14
    iput p8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U:I

    .line 15
    iput-boolean p12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J0:Z

    .line 16
    iput-boolean p13, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K0:Z

    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    const-string p4, "fake_id_"

    if-nez p1, :cond_0

    .line 18
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    invoke-virtual {p1, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 21
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object p8, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    invoke-virtual {p1, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    invoke-virtual {p1, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    :cond_1
    move p1, v0

    goto :goto_0

    :cond_2
    move p1, p10

    .line 24
    :goto_0
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    invoke-static {p4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result p4

    if-eqz p4, :cond_3

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    invoke-virtual {p4}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    move-result p4

    if-eqz p4, :cond_3

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3

    .line 28
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p4, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object p8, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    invoke-static {p4, p8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_3

    .line 30
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    invoke-virtual {p4, p10}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 31
    :cond_3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    iput-boolean p11, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F0:Z

    .line 33
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    invoke-interface {p4, p0}, Ll/lol;->a(Ljava/lang/Object;)Z

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K0()Z

    move-result p4

    .line 35
    iget-object p8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    const/16 p11, 0x8

    if-eqz p4, :cond_4

    .line 36
    invoke-virtual {p8}, Ll/t4;->l()Lv/VLinear;

    move-result-object p4

    invoke-virtual {p4, p11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 37
    :cond_4
    invoke-virtual {p8}, Ll/t4;->l()Lv/VLinear;

    move-result-object p4

    invoke-virtual {p4, p10}, Landroid/view/View;->setVisibility(I)V

    .line 38
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0()Z

    move-result p4

    .line 39
    iget-object p8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->c:Landroid/widget/RelativeLayout;

    if-eqz p4, :cond_5

    .line 40
    invoke-virtual {p0, p8, p10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    goto :goto_2

    .line 41
    :cond_5
    invoke-virtual {p0, p8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 42
    :goto_2
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 43
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j:Lv/VText;

    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_6

    .line 44
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j:Lv/VText;

    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G1(Landroid/view/View;)V

    .line 45
    :cond_6
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->g:Lv/VText;

    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I1(Lv/VText;)V

    .line 46
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h:Lv/VText;

    invoke-virtual {p0, p4, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O1(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 47
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 48
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    iget-object p8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    iget-object p12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G:Lv/VImage;

    const/4 p13, 0x3

    new-array p13, p13, [Landroid/view/View;

    aput-object p4, p13, p10

    aput-object p8, p13, v0

    const/4 p4, 0x2

    aput-object p12, p13, p4

    .line 49
    invoke-static {p13}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p8

    new-instance p12, Ll/b870;

    invoke-direct {p12, p0, p3, p5, p6}, Ll/b870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 50
    invoke-static {p8, p12}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 51
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 52
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_8

    .line 53
    iget-boolean p6, p3, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    if-eqz p6, :cond_7

    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p6

    invoke-interface {p6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p6

    iget-object p8, p3, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    iget-object p8, p8, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    iget-object p8, p8, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    invoke-virtual {p6, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_7

    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    invoke-virtual {p0, p2, p10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    goto :goto_3

    .line 55
    :cond_7
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    invoke-virtual {p6, p10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 56
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    new-instance p8, Ll/c870;

    invoke-direct {p8, p0, p3, p2, p5}, Ll/c870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;)V

    invoke-virtual {p6, p8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    :goto_3
    invoke-static {p3}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result p2

    if-eqz p2, :cond_8

    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    invoke-virtual {p2, p11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 59
    :cond_8
    iget-object p2, p3, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    iget p6, p2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-static {p6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->D0(I)V

    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    invoke-interface {p2, p0}, Ll/lol;->b(Ljava/lang/Object;)Z

    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {}, Ll/er60;->w()Ll/er60;

    invoke-static {p5}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p2, p6}, Lcom/p1/mobile/putong/feed/data/Moment;->setMomentShowFrom(Ljava/lang/String;)V

    :cond_9
    if-ne p7, p4, :cond_a

    const/high16 p2, 0x40400000    # 3.0f

    .line 64
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    invoke-static {p0, p2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 65
    :cond_a
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_b

    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 66
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_f

    :cond_b
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->g:Lv/VText;

    .line 67
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_c

    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->g:Lv/VText;

    .line 68
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_f

    :cond_c
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    .line 69
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_d

    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_f

    :cond_d
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h:Lv/VText;

    .line 70
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h:Lv/VText;

    .line 71
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_f

    :cond_e
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j:Lv/VText;

    .line 72
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_f

    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z:Lv/VText;

    .line 73
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N0(Landroid/view/View;)Z

    move-result p2

    if-nez p2, :cond_f

    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->i:Lv/VLinear;

    invoke-virtual {p2, p11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    .line 75
    :cond_f
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->i:Lv/VLinear;

    invoke-virtual {p2, p10}, Landroid/view/View;->setVisibility(I)V

    .line 76
    :goto_4
    invoke-static {}, Ll/cmg;->K()Z

    move-result p2

    if-eqz p2, :cond_11

    const-string p2, "from_like"

    .line 77
    invoke-static {p2, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_11

    .line 78
    invoke-static {p9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_11

    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->w:Lv/VText;

    iget-boolean p4, p9, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    if-nez p4, :cond_10

    iget-boolean p4, p9, Lcom/p1/mobile/putong/feed/data/RawFeed;->showUnreadSplitLine:Z

    if-eqz p4, :cond_10

    goto :goto_5

    :cond_10
    move v0, p10

    :goto_5
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    :cond_11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J1()V

    .line 81
    iget-object p2, p3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_12

    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->i:Lv/VLinear;

    invoke-virtual {p2, p11}, Landroid/view/View;->setVisibility(I)V

    .line 83
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->b:Lv/VLinear;

    invoke-static {p2, p10}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    invoke-virtual {p2}, Ll/t4;->v()Landroid/widget/RelativeLayout;

    move-result-object p2

    invoke-static {p2, p10}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    invoke-virtual {p0}, Ll/t4;->v()Landroid/widget/RelativeLayout;

    move-result-object p0

    invoke-static {p0, p10}, Ll/bnl0;->U(Landroid/view/View;I)V

    :cond_12
    return p1
.end method

.method public final G0(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    return p0

    .line 10
    :cond_1
    :try_start_0
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->count:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    :goto_0
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 19
    .line 20
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    :cond_2
    return p0
.end method

.method public final G1(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/ksg;->i0(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/owi;->c()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 25
    .line 26
    const-string v0, "selfOnly"

    .line 27
    .line 28
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final H0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;->onGoing:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "onMultiCall"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public H1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o:Landroid/widget/TextView;

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->d:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final I0()Z
    .locals 2

    .line 1
    const-string v0, "from_mine_tab_album"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "from_profile_album"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final I1(Lv/VText;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/ksg;->i0(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_5

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 33
    .line 34
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 49
    .line 50
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string v0, "qa_recommend"

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    invoke-static {}, Ll/skh;->b()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    long-to-double v0, v0

    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendTime()D

    .line 84
    .line 85
    .line 86
    move-result-wide v2

    .line 87
    cmpg-double v0, v0, v2

    .line 88
    .line 89
    if-gez v0, :cond_3

    .line 90
    .line 91
    const-string p0, "1\u79d2\u4ee5\u524d\u63a8\u8350"

    .line 92
    .line 93
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendTime()D

    .line 100
    .line 101
    .line 102
    move-result-wide v0

    .line 103
    invoke-static {v0, v1}, Ll/ksg;->C0(D)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 112
    .line 113
    iget-wide v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :cond_5
    return-void

    .line 127
    :cond_6
    :goto_0
    const/4 p0, 0x0

    .line 128
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final J0(ZZ)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public J1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/InteractionReason;->haveMoreInteraction:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/t4;->E()Lv/VLinear;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/t4;->E()Lv/VLinear;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/q870;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/q870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/t4;->E()Lv/VLinear;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final K0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J0(ZZ)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final K1(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 7
    .line 8
    const-string v1, "1"

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/2addr p1, v2

    .line 48
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    sub-int/2addr p0, v2

    .line 92
    invoke-static {p0}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public L0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 6
    .line 7
    return p0
.end method

.method public final L1(ZLandroid/widget/ImageView;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget v1, Ll/k9c0;->K:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    sget p0, Ll/lbc0;->c3:I

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d2(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_6

    .line 51
    .line 52
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 59
    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E0:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    move p1, v2

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    move p1, v1

    .line 77
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 78
    .line 79
    if-lez v0, :cond_2

    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    iget v4, v3, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 84
    .line 85
    if-eq v0, v4, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E0:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    move v0, v2

    .line 98
    goto :goto_1

    .line 99
    :cond_2
    move v0, v1

    .line 100
    :goto_1
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 104
    .line 105
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 113
    .line 114
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 115
    .line 116
    invoke-virtual {p2, v1}, Ll/nkh;->j(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-nez v1, :cond_3

    .line 125
    .line 126
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {v1, v2, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_3
    if-nez p1, :cond_4

    .line 134
    .line 135
    if-eqz v0, :cond_5

    .line 136
    .line 137
    :cond_4
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->l:Lv/VFrame;

    .line 144
    .line 145
    invoke-virtual {p1, p2, v0}, Ll/nkh;->n(Landroid/view/View;Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 149
    .line 150
    iget p2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 151
    .line 152
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0:I

    .line 153
    .line 154
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E0:Ljava/lang/String;

    .line 157
    .line 158
    return-void

    .line 159
    :cond_6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J:Z

    .line 160
    .line 161
    if-nez p1, :cond_7

    .line 162
    .line 163
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    sget v1, Ll/k9c0;->n:I

    .line 182
    .line 183
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 188
    .line 189
    .line 190
    sget p0, Ll/lbc0;->Y2:I

    .line 191
    .line 192
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public M0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    return v1
.end method

.method public M1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final N0(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    :cond_1
    return p0
.end method

.method public final synthetic O0(Lv/VEditText;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 p2, 0x2

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final O1(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E0()Z

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
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const-string v0, "from_profile_album"

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const-string v0, "from_mine_tab_album"

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_6

    .line 45
    .line 46
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 55
    .line 56
    invoke-static {v0}, Ll/ksg;->v(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    const-string v0, ""

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 77
    .line 78
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-boolean v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 85
    .line 86
    const/4 v3, 0x1

    .line 87
    if-eqz v2, :cond_4

    .line 88
    .line 89
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 96
    .line 97
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 104
    .line 105
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 106
    .line 107
    invoke-static {v0, v3}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    :goto_1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 126
    .line 127
    if-nez v0, :cond_6

    .line 128
    .line 129
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 130
    .line 131
    if-eqz p2, :cond_5

    .line 132
    .line 133
    move v1, v3

    .line 134
    :cond_5
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    :cond_6
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final P1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z:Lv/VText;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "\u6765\u81ea"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->name:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z:Lv/VText;

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic Q0(Lv/VEditText;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    new-instance p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 9
    .line 10
    invoke-direct {p3}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->momentShowFromType:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v1, 0x0

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Ll/f870;

    .line 76
    .line 77
    invoke-direct {v0, p0, p3}, Ll/f870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, v0, v1}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->y0(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic R0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final R1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    .line 42
    .line 43
    const/16 p1, 0x8

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic S0(ZLjava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e2(ZZ)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Ll/ksg;->i:Ljava/util/List;

    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B0()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final S1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->X1()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T1()V

    .line 38
    .line 39
    .line 40
    new-array v0, v1, [Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-nez v3, :cond_1

    .line 69
    .line 70
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 71
    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    const/4 v4, 0x3

    .line 79
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    move v4, v1

    .line 84
    :goto_0
    if-ge v4, v3, :cond_1

    .line 85
    .line 86
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 87
    .line 88
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    check-cast v5, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 95
    .line 96
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 97
    .line 98
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    add-int/lit8 v4, v4, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 108
    .line 109
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 113
    .line 114
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/t4;->M()Lv/VLinear;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G:Lv/VImage;

    .line 127
    .line 128
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    xor-int/2addr v2, v3

    .line 133
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 137
    .line 138
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_2

    .line 143
    .line 144
    move v2, v1

    .line 145
    goto :goto_1

    .line 146
    :cond_2
    const/high16 v2, 0x40800000    # 4.0f

    .line 147
    .line 148
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    :goto_1
    invoke-static {p1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->k0()V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 161
    .line 162
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->n0(Ljava/util/List;Z)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_3
    invoke-static {}, Ll/cmg;->z()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_4

    .line 171
    .line 172
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 173
    .line 174
    if-eqz v0, :cond_5

    .line 175
    .line 176
    :cond_4
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 177
    .line 178
    if-lez v0, :cond_a

    .line 179
    .line 180
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->X1()V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 184
    .line 185
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 191
    .line 192
    if-le v0, v2, :cond_6

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->n1:I

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 205
    .line 206
    invoke-static {v2}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->o1:I

    .line 231
    .line 232
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 237
    .line 238
    invoke-static {v2}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o0(Ljava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    :goto_2
    invoke-static {}, Ll/cmg;->T()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_9

    .line 262
    .line 263
    invoke-static {}, Ll/cmg;->z()Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    const-string v1, "\u6d4f\u89c8"

    .line 268
    .line 269
    if-eqz v0, :cond_7

    .line 270
    .line 271
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 272
    .line 273
    new-instance v2, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 276
    .line 277
    .line 278
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 279
    .line 280
    invoke-static {p1}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 295
    .line 296
    .line 297
    goto :goto_3

    .line 298
    :cond_7
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 299
    .line 300
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 301
    .line 302
    if-nez v0, :cond_8

    .line 303
    .line 304
    const-string p1, ""

    .line 305
    .line 306
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 307
    .line 308
    .line 309
    goto :goto_3

    .line 310
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 311
    .line 312
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 313
    .line 314
    .line 315
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 316
    .line 317
    invoke-static {p1}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    :cond_9
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->X1()V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 339
    .line 340
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->X1()V

    .line 344
    .line 345
    .line 346
    return-void
.end method

.method public final synthetic T0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final T1()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, "\u6d4f\u89c8"

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G:Lv/VImage;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 48
    .line 49
    const-string v0, "0\u6d4f\u89c8"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/cmg;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p5, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    const/16 v2, 0x4e85

    .line 23
    .line 24
    if-ne v0, v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k2()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    const/4 v4, 0x0

    .line 66
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 67
    .line 68
    invoke-interface {v2, v3, v0, v4, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ap(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/16 v4, 0xc9

    .line 76
    .line 77
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 78
    .line 79
    move-object v1, p1

    .line 80
    move-object v2, p2

    .line 81
    move v3, p3

    .line 82
    move v5, p4

    .line 83
    invoke-virtual/range {v0 .. v6}, Ll/er60;->g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZI)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->q0()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 93
    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    const-string v0, "like_click"

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a2(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 102
    .line 103
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 116
    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Z1(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 126
    .line 127
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 128
    .line 129
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ll/nkh;->h()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-le v0, v1, :cond_2

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Y1()V

    .line 140
    .line 141
    .line 142
    :cond_2
    return-void
.end method

.method public final U1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "comment"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 14
    .line 15
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 16
    .line 17
    invoke-static {v3, v4}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    new-instance v5, Ll/m870;

    .line 22
    .line 23
    invoke-direct {v5, p0, p1, p2}, Ll/m870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    .line 24
    .line 25
    .line 26
    const-string v3, "comment"

    .line 27
    .line 28
    invoke-static/range {v0 .. v5}, Ll/ksg;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic V0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZLjava/lang/Throwable;)V
    .locals 8

    .line 1
    invoke-static {p6}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 5
    .line 6
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L1(ZLandroid/widget/ImageView;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 14
    .line 15
    move-object v2, p1

    .line 16
    move-object v3, p3

    .line 17
    move v4, p4

    .line 18
    move v6, p5

    .line 19
    move-object v5, p6

    .line 20
    invoke-virtual/range {v1 .. v7}, Ll/er60;->i(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLjava/lang/Throwable;ZI)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K1(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final V1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V
    .locals 9

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "moment_id"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "owner_id"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "comment_user_id"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    const-string p2, "success"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p2, "fail"

    .line 49
    .line 50
    :goto_0
    const-string v0, "comment_state"

    .line 51
    .line 52
    invoke-static {v0, p2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    const-string p2, "comment_detail"

    .line 57
    .line 58
    const-string v0, "comment"

    .line 59
    .line 60
    invoke-static {p2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const-string p2, "trigger_time"

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k0:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    if-nez p3, :cond_1

    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    :goto_1
    move-object v8, p0

    .line 76
    goto :goto_2

    .line 77
    :cond_1
    const-string p0, "error"

    .line 78
    .line 79
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {p0, p2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    goto :goto_1

    .line 88
    :goto_2
    filled-new-array/range {v2 .. v8}, [Ll/tfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string p2, "e_comment_send"

    .line 93
    .line 94
    invoke-static {p2, p1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0, p1}, Ll/k3h;->J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final X1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/t4;->M()Lv/VLinear;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic Y0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final Y1()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o:Landroid/widget/TextView;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aget v3, v0, v2

    .line 16
    .line 17
    const/high16 v4, 0x42e80000    # 116.0f

    .line 18
    .line 19
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    sub-int/2addr v3, v4

    .line 24
    invoke-static {}, Ll/bnl0;->F0()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/high16 v5, 0x42300000    # 44.0f

    .line 29
    .line 30
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    add-int/2addr v4, v5

    .line 35
    const/high16 v5, 0x41400000    # 12.0f

    .line 36
    .line 37
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    add-int/2addr v4, v5

    .line 42
    if-ge v3, v4, :cond_0

    .line 43
    .line 44
    aget v3, v0, v2

    .line 45
    .line 46
    :cond_0
    iput v3, v1, Landroid/graphics/Point;->y:I

    .line 47
    .line 48
    const/high16 v0, 0x42500000    # 52.0f

    .line 49
    .line 50
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput v0, v1, Landroid/graphics/Point;->x:I

    .line 55
    .line 56
    new-instance v0, Ll/jrg;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 65
    .line 66
    iget-boolean v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 67
    .line 68
    invoke-static {v4, v5}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-direct {v0, v2, v1, v3, v4}, Ll/jrg;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o:Landroid/widget/TextView;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ll/jrg;->a(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic Z0(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A1(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/orb0;->m(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C1(Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-boolean p1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 54
    .line 55
    const-string p1, ""

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/orb0;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v5, ""

    .line 64
    .line 65
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m:Lv/VImage;

    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 72
    .line 73
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 76
    .line 77
    move-object v0, p0

    .line 78
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B1(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public Z1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "from_discover_discussion"

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic a1(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A1(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/orb0;->m(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C1(Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-boolean p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 54
    .line 55
    const-string p1, ""

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p1, v4}, Ll/orb0;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v5, ""

    .line 64
    .line 65
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->r0()V

    .line 70
    .line 71
    .line 72
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 73
    .line 74
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 75
    .line 76
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->v0(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K0:Z

    .line 90
    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 106
    .line 107
    const-string v5, "click"

    .line 108
    .line 109
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 110
    .line 111
    invoke-virtual/range {v0 .. v6}, Ll/qvm;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    return-void
.end method

.method public a2(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    .line 12
    iget-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 59
    .line 60
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_7

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    invoke-static {}, Ll/gch;->a()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    invoke-static {}, Ll/cmg;->H()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 83
    .line 84
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k0:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 94
    .line 95
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v1, "trigger_time"

    .line 100
    .line 101
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    filled-new-array {p1}, [Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const-string v1, "e_quick_comment"

    .line 110
    .line 111
    invoke-static {v1, v0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_7

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 123
    .line 124
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 125
    .line 126
    if-eqz v0, :cond_7

    .line 127
    .line 128
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 129
    .line 130
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 131
    .line 132
    if-nez v0, :cond_6

    .line 133
    .line 134
    new-instance v0, Ljava/util/HashMap;

    .line 135
    .line 136
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 140
    .line 141
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 142
    .line 143
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_7

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 154
    .line 155
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 156
    .line 157
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->b2()V

    .line 161
    .line 162
    .line 163
    :cond_7
    :goto_1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final b2()V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->v:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u:Lv/VImage;

    .line 27
    .line 28
    invoke-static {}, Ll/cmg;->z()Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/cmg;->z()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u:Lv/VImage;

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 47
    .line 48
    sget-object v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P0:Landroid/util/Property;

    .line 49
    .line 50
    const/high16 v3, 0x42400000    # 48.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    filled-new-array {v2, v3}, [I

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v1, v4, v3}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const-wide/16 v5, 0xc8

    .line 65
    .line 66
    invoke-virtual {v1, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t:Lv/VDraweeView;

    .line 70
    .line 71
    new-instance v13, Landroid/view/animation/LinearInterpolator;

    .line 72
    .line 73
    invoke-direct {v13}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 74
    .line 75
    .line 76
    const/4 v15, 0x2

    .line 77
    new-array v14, v15, [F

    .line 78
    .line 79
    fill-array-data v14, :array_0

    .line 80
    .line 81
    .line 82
    const-string v8, "alpha"

    .line 83
    .line 84
    const-wide/16 v9, 0x0

    .line 85
    .line 86
    const-wide/16 v11, 0xc8

    .line 87
    .line 88
    invoke-static/range {v7 .. v14}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v11

    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t:Lv/VDraweeView;

    .line 93
    .line 94
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 95
    .line 96
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 97
    .line 98
    .line 99
    const/high16 v5, 0x41c00000    # 24.0f

    .line 100
    .line 101
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    filled-new-array {v2, v5}, [I

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    const-wide/16 v5, 0x0

    .line 110
    .line 111
    const-wide/16 v7, 0xc8

    .line 112
    .line 113
    invoke-static/range {v3 .. v10}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object v12

    .line 117
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u:Lv/VImage;

    .line 118
    .line 119
    new-instance v22, Landroid/view/animation/LinearInterpolator;

    .line 120
    .line 121
    invoke-direct/range {v22 .. v22}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 122
    .line 123
    .line 124
    new-array v5, v15, [F

    .line 125
    .line 126
    fill-array-data v5, :array_1

    .line 127
    .line 128
    .line 129
    const-string v17, "alpha"

    .line 130
    .line 131
    const-wide/16 v18, 0x0

    .line 132
    .line 133
    const-wide/16 v20, 0xc8

    .line 134
    .line 135
    move-object/from16 v16, v3

    .line 136
    .line 137
    move-object/from16 v23, v5

    .line 138
    .line 139
    invoke-static/range {v16 .. v23}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 140
    .line 141
    .line 142
    move-result-object v13

    .line 143
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u:Lv/VImage;

    .line 144
    .line 145
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 146
    .line 147
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 148
    .line 149
    .line 150
    const/high16 v5, 0x41a80000    # 21.0f

    .line 151
    .line 152
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    filled-new-array {v2, v5}, [I

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    const-wide/16 v5, 0x0

    .line 161
    .line 162
    invoke-static/range {v3 .. v10}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->v:Lv/VText;

    .line 167
    .line 168
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 169
    .line 170
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 171
    .line 172
    .line 173
    new-array v10, v15, [F

    .line 174
    .line 175
    fill-array-data v10, :array_2

    .line 176
    .line 177
    .line 178
    const-string v4, "alpha"

    .line 179
    .line 180
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 185
    .line 186
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4, v11}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {v5, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3, v12}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 198
    .line 199
    .line 200
    invoke-static {}, Ll/cmg;->z()Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-eqz v3, :cond_1

    .line 205
    .line 206
    invoke-virtual {v5, v13}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-virtual {v3, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 211
    .line 212
    .line 213
    :cond_1
    new-instance v2, Ll/g870;

    .line 214
    .line 215
    invoke-direct {v2, v0, v4}, Ll/g870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/animation/AnimatorSet;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->E:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/y770;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/y770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/z770;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/z770;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic d1(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s0(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final d2(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "from_discover_discussion"

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget p0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final e2(ZZ)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 15
    .line 16
    sget v4, Ll/tec0;->b2:I

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    sget v6, Ll/fgc0;->d:I

    .line 23
    .line 24
    new-instance v8, Ll/e870;

    .line 25
    .line 26
    invoke-direct {v8, p0}, Ll/e870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 27
    .line 28
    .line 29
    move v3, p1

    .line 30
    move v7, p2

    .line 31
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->gi(Ljava/lang/String;Ljava/lang/String;ZILcom/p1/mobile/android/app/Act;IZLl/a30;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 36
    .line 37
    return-void
.end method

.method public final synthetic f1(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 52
    .line 53
    :cond_1
    const-string p1, "\u53d1\u9001\u6210\u529f"

    .line 54
    .line 55
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B0()V

    .line 59
    .line 60
    .line 61
    sget-object p1, Ll/ksg;->i:Ljava/util/List;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public g2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->F:Ljava/util/ArrayList;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h2()V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public getController()Ll/n570;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h2()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    const-string v3, "moments_user_id"

    .line 27
    .line 28
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v2}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "e_greet_guidance"

    .line 37
    .line 38
    invoke-static {v3, v0, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C:Lv/VText;

    .line 42
    .line 43
    invoke-static {}, Ll/ksg;->x()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v0, v2, v3}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B:Lv/VDraweeView;

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 88
    .line 89
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P0:Landroid/util/Property;

    .line 90
    .line 91
    const/high16 v2, 0x42a00000    # 80.0f

    .line 92
    .line 93
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    filled-new-array {v1, v2}, [I

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v0, v3, v2}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-wide/16 v4, 0xc8

    .line 106
    .line 107
    invoke-virtual {v0, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B:Lv/VDraweeView;

    .line 111
    .line 112
    new-instance v12, Landroid/view/animation/LinearInterpolator;

    .line 113
    .line 114
    invoke-direct {v12}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 115
    .line 116
    .line 117
    const/4 v14, 0x2

    .line 118
    new-array v13, v14, [F

    .line 119
    .line 120
    fill-array-data v13, :array_0

    .line 121
    .line 122
    .line 123
    const-string v7, "alpha"

    .line 124
    .line 125
    const-wide/16 v8, 0x0

    .line 126
    .line 127
    const-wide/16 v10, 0xc8

    .line 128
    .line 129
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B:Lv/VDraweeView;

    .line 134
    .line 135
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 136
    .line 137
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 138
    .line 139
    .line 140
    const/high16 v4, 0x41c00000    # 24.0f

    .line 141
    .line 142
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    filled-new-array {v1, v4}, [I

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    const-wide/16 v4, 0x0

    .line 151
    .line 152
    const-wide/16 v6, 0xc8

    .line 153
    .line 154
    invoke-static/range {v2 .. v9}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C:Lv/VText;

    .line 159
    .line 160
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 161
    .line 162
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 163
    .line 164
    .line 165
    new-array v9, v14, [F

    .line 166
    .line 167
    fill-array-data v9, :array_1

    .line 168
    .line 169
    .line 170
    const-string v3, "alpha"

    .line 171
    .line 172
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 177
    .line 178
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v10}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-virtual {v4, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 190
    .line 191
    .line 192
    new-instance v1, Ll/d870;

    .line 193
    .line 194
    invoke-direct {v1, p0, v3}, Ll/d870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/animation/AnimatorSet;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    nop

    .line 205
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final i2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->G:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/d970;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/d970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/e970;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/e970;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic j1(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k1(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 1

    .line 1
    iget p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 7
    .line 8
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-eqz p4, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-static {p2, p3}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {p4, p3, v0, p2, p0}, Ll/zzg;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public k2()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->T:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x2

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/z870;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/z870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 51
    .line 52
    iget-object v0, v0, Ll/jka;->T:Ll/byd0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ljava/lang/Long;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    const-wide/16 v3, 0x1

    .line 65
    .line 66
    add-long/2addr v1, v3

    .line 67
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    const-string v1, "\u70b9\u8d5e\u540e\u81ea\u52a8\u559c\u6b22\uff0c\u914d\u5bf9\u7387\u63d0\u53475\u500d"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget v2, Ll/k9c0;->n:I

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    filled-new-array {v1}, [I

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const/high16 v1, 0x41500000    # 13.0f

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/high16 v1, 0x41200000    # 10.0f

    .line 118
    .line 119
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/4 v1, 0x1

    .line 128
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-wide/16 v1, 0xbb8

    .line 143
    .line 144
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const/high16 v1, 0x40c00000    # 6.0f

    .line 149
    .line 150
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    const/high16 v1, 0x41a00000    # 20.0f

    .line 159
    .line 160
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    neg-int v1, v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 174
    .line 175
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0:Ljava/lang/String;

    .line 180
    .line 181
    return-void
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/l870;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/l870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l2(ZI)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->q:Landroid/view/View;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p2, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 8
    .line 9
    .line 10
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->q:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic m1(Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v1, Ll/rk00;

    .line 5
    .line 6
    invoke-direct {v1, p2}, Ll/rk00;-><init>(Ll/n570;)V

    .line 7
    .line 8
    .line 9
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, p4}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v0, p1

    .line 21
    move-object v4, p3

    .line 22
    invoke-static/range {v0 .. v5}, Ll/rzi;->P(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic n1(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Ll/qvm;->f(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/InteractionReason;->haveMoreInteraction:Z

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/t4;->E()Lv/VLinear;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "moment_id"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/InteractionReason;->type:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "recommend_reason"

    .line 58
    .line 59
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v0, "e_view_more"

    .line 68
    .line 69
    invoke-static {v0, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final o0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M0:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic o1(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 52
    .line 53
    :cond_1
    const-string p1, "\u53d1\u9001\u6210\u529f"

    .line 54
    .line 55
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B0()V

    .line 59
    .line 60
    .line 61
    sget-object p1, Ll/ksg;->i:Ljava/util/List;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/w770;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/w770;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/lol;->c(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/t4;->F()Landroid/widget/ImageView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/t4;->l()Lv/VLinear;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->b:Lv/VLinear;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/t4;->v()Landroid/widget/RelativeLayout;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->c:Landroid/widget/RelativeLayout;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/t4;->w()Lv/VRelative;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/t4;->j()Lv/VLinear;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/t4;->B()Lv/VText;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->f:Lv/VText;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/t4;->J()Lv/VText;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->g:Lv/VText;

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/t4;->m()Lv/VText;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->h:Lv/VText;

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/t4;->I()Lv/VLinear;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->i:Lv/VLinear;

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/t4;->H()Lv/VText;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->j:Lv/VText;

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/t4;->x()Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/t4;->z()Lv/VFrame;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->l:Lv/VFrame;

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/t4;->A()Lv/VImage;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m:Lv/VImage;

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/t4;->y()Lv/VDraweeView;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/t4;->k()Landroid/widget/TextView;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->o:Landroid/widget/TextView;

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/t4;->G()Lv/VText;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p:Lv/VText;

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 143
    .line 144
    invoke-virtual {v0}, Ll/t4;->n()Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->q:Landroid/view/View;

    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/t4;->D()Lv/VText;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->r:Lv/VText;

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 159
    .line 160
    invoke-virtual {v0}, Ll/t4;->e()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/t4;->g()Lv/VDraweeView;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->t:Lv/VDraweeView;

    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/t4;->f()Lv/VImage;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->u:Lv/VImage;

    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 183
    .line 184
    invoke-virtual {v0}, Ll/t4;->h()Lv/VText;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->v:Lv/VText;

    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/t4;->i()Lv/VText;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->w:Lv/VText;

    .line 197
    .line 198
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 199
    .line 200
    invoke-virtual {v0}, Ll/t4;->d()Lcom/tantan/library/svga/SVGAnimationView;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 205
    .line 206
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/t4;->o()Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->y:Landroid/view/View;

    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 215
    .line 216
    invoke-virtual {v0}, Ll/t4;->C()Lv/VText;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z:Lv/VText;

    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 223
    .line 224
    invoke-virtual {v0}, Ll/t4;->u()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 229
    .line 230
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 231
    .line 232
    invoke-virtual {v0}, Ll/t4;->r()Lv/VDraweeView;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B:Lv/VDraweeView;

    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 239
    .line 240
    invoke-virtual {v0}, Ll/t4;->t()Lv/VText;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C:Lv/VText;

    .line 245
    .line 246
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 247
    .line 248
    invoke-virtual {v0}, Ll/t4;->s()Lv/VText;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->D:Lv/VText;

    .line 253
    .line 254
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 255
    .line 256
    invoke-virtual {v0}, Ll/t4;->L()Lv/VText;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F:Lv/VText;

    .line 261
    .line 262
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 263
    .line 264
    invoke-virtual {v0}, Ll/t4;->q()Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 269
    .line 270
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 271
    .line 272
    invoke-virtual {v0}, Ll/t4;->K()Lv/VImage;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G:Lv/VImage;

    .line 277
    .line 278
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 279
    .line 280
    invoke-virtual {v0}, Ll/t4;->p()Landroid/widget/LinearLayout;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H:Landroid/widget/LinearLayout;

    .line 285
    .line 286
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->b:Lv/VLinear;

    .line 287
    .line 288
    sget v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N0:I

    .line 289
    .line 290
    const/4 v2, 0x0

    .line 291
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    sget v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O0:I

    .line 296
    .line 297
    const/4 v4, 0x0

    .line 298
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 302
    .line 303
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_0

    .line 308
    .line 309
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 310
    .line 311
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    sget v2, Ll/k9c0;->K:I

    .line 320
    .line 321
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 326
    .line 327
    .line 328
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->k:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 329
    .line 330
    const/high16 v1, 0x41400000    # 12.0f

    .line 331
    .line 332
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextSize(F)V

    .line 333
    .line 334
    .line 335
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->c:Landroid/widget/RelativeLayout;

    .line 336
    .line 337
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->c2()V

    .line 341
    .line 342
    .line 343
    invoke-static {}, Ll/cmg;->H()Z

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    if-eqz v0, :cond_1

    .line 348
    .line 349
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->i2()V

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->D:Lv/VText;

    .line 353
    .line 354
    new-instance v1, Ll/i870;

    .line 355
    .line 356
    invoke-direct {v1, p0}, Ll/i870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 357
    .line 358
    .line 359
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 360
    .line 361
    .line 362
    :cond_1
    return-void
.end method

.method public p0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/ksg;->k0(I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/cmg;->o()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public final synthetic p1(ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "greeting_guide"

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    new-instance v7, Ll/w870;

    .line 26
    .line 27
    invoke-direct {v7, p0}, Ll/w870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 28
    .line 29
    .line 30
    move-object v5, v3

    .line 31
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->J3:I

    .line 35
    .line 36
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 37
    .line 38
    .line 39
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 40
    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->d5(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    const/4 p3, 0x0

    .line 54
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public q0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/ksg;->k0(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V1(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final r0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "NewMainAct"

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->h(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->u(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->s(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-nez v0, :cond_0

    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2, p1}, Ll/jka;->N6(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/r870;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2, p1}, Ll/r870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/s870;

    .line 25
    .line 26
    invoke-direct {p2, p0, p1}, Ll/s870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final s0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/fgc0;->c:I

    .line 21
    .line 22
    invoke-direct {p1, v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget v0, Ll/tec0;->j0:I

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 48
    .line 49
    new-instance v1, Ll/t870;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/t870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 55
    .line 56
    .line 57
    sget v0, Ll/hdc0;->Q1:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lv/VEditText;

    .line 64
    .line 65
    sget v1, Ll/hdc0;->E1:I

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Landroid/widget/TextView;

    .line 72
    .line 73
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const/4 v2, 0x1

    .line 83
    invoke-virtual {v0, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    new-instance v2, Ll/a970;

    .line 92
    .line 93
    invoke-direct {v2, v0, p1}, Ll/a970;-><init>(Lv/VEditText;Landroid/widget/TextView;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 104
    .line 105
    new-instance v2, Ll/b970;

    .line 106
    .line 107
    invoke-direct {v2, p0, v0}, Ll/b970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lv/VEditText;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 114
    .line 115
    new-instance v2, Ll/c970;

    .line 116
    .line 117
    invoke-direct {v2, p0, v0, v1}, Ll/c970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lv/VEditText;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->G0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 126
    .line 127
    .line 128
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic s1(Landroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/high16 v0, 0x42400000    # 48.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setCurrentFrag(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    return-void
.end method

.method public setRawFeedsCanGreeting(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->V:Ll/t4;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/t4;->N(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final t0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/cmg;->G()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    sget-object p1, Ll/ksg;->i:Ljava/util/List;

    .line 22
    .line 23
    new-instance v1, Ll/f970;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/f970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e2(ZZ)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v1, Ll/g970;

    .line 51
    .line 52
    invoke-direct {v1, p0, p2}, Ll/g970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Z)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, v0, v1}, Ll/ksg;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e2(ZZ)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic t1(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q:I

    .line 22
    .line 23
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-ne v0, p1, :cond_0

    .line 32
    .line 33
    const-string p1, "preview_exit"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a2(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final u0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;ZZ)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/n570;->s(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    new-instance v0, Ll/x870;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p1

    .line 19
    move-object v3, p4

    .line 20
    move v4, p5

    .line 21
    move v5, p6

    .line 22
    invoke-direct/range {v0 .. v5}, Ll/x870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/y870;

    .line 26
    .line 27
    move v6, v4

    .line 28
    move v7, v5

    .line 29
    move-object v4, p2

    .line 30
    move-object v5, v3

    .line 31
    move-object v3, v2

    .line 32
    move-object v2, v1

    .line 33
    move-object v1, p0

    .line 34
    invoke-direct/range {v1 .. v7}, Ll/y870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZ)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic u1(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->w0(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v0(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v1, v2

    .line 22
    :goto_0
    const-string v3, "anchorId"

    .line 23
    .line 24
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 38
    .line 39
    :cond_1
    const-string v1, "liveId"

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    const-string v2, "moment_id"

    .line 53
    .line 54
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 64
    .line 65
    const-string v2, "owner_id"

    .line 66
    .line 67
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "moment_showfrom"

    .line 84
    .line 85
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v2, "moment_type"

    .line 103
    .line 104
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    const-string v1, "comment_detail"

    .line 112
    .line 113
    const-string v2, "comment"

    .line 114
    .line 115
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 123
    .line 124
    invoke-static {v1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 125
    .line 126
    .line 127
    move-result-wide v1

    .line 128
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const-string v2, "moment_distance"

    .line 133
    .line 134
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 142
    .line 143
    invoke-static {v1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 144
    .line 145
    .line 146
    move-result-wide v1

    .line 147
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const-string v2, "moment_create_time"

    .line 152
    .line 153
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 161
    .line 162
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 163
    .line 164
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v1}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v1

    .line 174
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "owner_active_time"

    .line 179
    .line 180
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M:I

    .line 188
    .line 189
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    const-string v2, "order"

    .line 194
    .line 195
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 203
    .line 204
    const/4 v1, 0x0

    .line 205
    new-array v1, v1, [Ll/pf60;

    .line 206
    .line 207
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, [Ll/pf60;

    .line 212
    .line 213
    invoke-static {p0, v0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    const-string v0, "e_comment"

    .line 218
    .line 219
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public final synthetic v1(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->x0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/p870;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1, p2, p3}, Ll/p870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "p_fake_nearby_comments_popup"

    .line 27
    .line 28
    invoke-static {v1, p0, v0, v2}, Ll/zzg;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->w0(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final w0(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->momentShowFromType:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    move v1, v2

    .line 47
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-ge v1, v3, :cond_0

    .line 52
    .line 53
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Ljava/lang/CharSequence;

    .line 58
    .line 59
    const-string v4, ""

    .line 60
    .line 61
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    sget-object p2, Ll/uqb0;->Z:Ll/a4j;

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/u870;

    .line 81
    .line 82
    invoke-direct {p2, p0, v0, p3}, Ll/u870;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Boolean;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p1, p2, v2}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->y0(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I0:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic w1(Landroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/high16 v0, 0x42280000    # 42.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final x0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic y1(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->E1()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->g2()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B0()V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public final z0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A0(Lcom/google/android/material/bottomsheet/BottomSheetDialog;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0:Ljava/lang/String;

    .line 6
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
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-void
.end method
