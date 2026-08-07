.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;
.super Lv/VFrame;
.source "SourceFile"


# static fields
.field public static e:I = 0x20

.field public static f:I = 0x2

.field public static g:I

.field public static h:I


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Ll/w30;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->e:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->g:I

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->f:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    mul-int/lit8 v1, v1, 0x3

    .line 23
    .line 24
    sub-int/2addr v0, v1

    .line 25
    div-int/lit8 v0, v0, 0x3

    .line 26
    .line 27
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->h:I

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->B(Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->C(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->E(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/Object;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->h2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic B(Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-ltz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    if-ge p2, p5, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p4}, Ll/y0m;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->d:Ll/w30;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic C(Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->g:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/w30$b;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v1, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Ll/rq20;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/rq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v2, Ll/sq20;

    .line 48
    .line 49
    move-object v3, p0

    .line 50
    move-object v4, p2

    .line 51
    move-object v5, p3

    .line 52
    move-object v6, p4

    .line 53
    move-object v7, p5

    .line 54
    invoke-direct/range {v2 .. v7}, Ll/sq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->d:Ll/w30;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->d:Ll/w30;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->d:Ll/w30;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v1, Ll/qq20;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move-object v4, p2

    .line 21
    move-object v5, p3

    .line 22
    move-object v6, p4

    .line 23
    move-object v7, p5

    .line 24
    move-object v3, p6

    .line 25
    invoke-direct/range {v1 .. v7}, Ll/qq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 p2, 0x190

    .line 29
    .line 30
    invoke-static {p1, v1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;IZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ll/y0m;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/Object;",
            "Ll/xl80;",
            "IZ)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    if-eqz p6, :cond_0

    .line 6
    .line 7
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->c:Landroid/widget/ImageView;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->b:Landroid/widget/ImageView;

    .line 11
    .line 12
    :goto_0
    new-instance v0, Ll/oq20;

    .line 13
    .line 14
    move-object v1, p0

    .line 15
    move-object v2, p1

    .line 16
    move-object v6, p2

    .line 17
    move-object v3, p3

    .line 18
    move-object v4, p4

    .line 19
    move-object v5, p5

    .line 20
    invoke-direct/range {v0 .. v6}, Ll/oq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p6, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 31
    .line 32
    .line 33
    instance-of p0, v4, Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 40
    .line 41
    move-object p4, v4

    .line 42
    check-cast p4, Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    iget-object p2, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    if-nez p7, :cond_2

    .line 50
    .line 51
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 52
    .line 53
    new-instance p1, Ll/pq20;

    .line 54
    .line 55
    invoke-direct {p1, v2, v4, v3}, Ll/pq20;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/hdc0;->m0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/hdc0;->F:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/ImageView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->b:Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v0, Ll/hdc0;->G:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/ImageView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->c:Landroid/widget/ImageView;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->h:I

    .line 43
    .line 44
    const/high16 v2, 0x40c00000    # 6.0f

    .line 45
    .line 46
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    sub-int/2addr v1, v3

    .line 51
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 52
    .line 53
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->h:I

    .line 54
    .line 55
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    sub-int/2addr v1, v2

    .line 60
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->a:Lv/VDraweeView;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->b:Landroid/widget/ImageView;

    .line 68
    .line 69
    invoke-static {}, Ll/j4h;->h()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    xor-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->c:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-static {}, Ll/j4h;->h()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public setImageDeleteVisible(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->c:Landroid/widget/ImageView;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->b:Landroid/widget/ImageView;

    .line 11
    .line 12
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
