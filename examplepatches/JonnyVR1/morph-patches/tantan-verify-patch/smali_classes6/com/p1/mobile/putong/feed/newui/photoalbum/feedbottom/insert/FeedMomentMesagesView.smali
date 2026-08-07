.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/ImageView;

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;

.field public f:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->i()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->j(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Ll/n570;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->k(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Ll/n570;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->h(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final g()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->P0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->a:Landroid/view/View;

    .line 8
    .line 9
    sget v0, Ll/hdc0;->V0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VText;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->b:Lv/VText;

    .line 18
    .line 19
    sget v0, Ll/hdc0;->Q0:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VText;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->c:Lv/VText;

    .line 28
    .line 29
    sget v0, Ll/hdc0;->R0:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/widget/ImageView;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 38
    .line 39
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p5, 0x0

    .line 2
    invoke-static {p2, p5}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p5

    .line 6
    const-string v0, "comment"

    .line 7
    .line 8
    iget-object p3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1, p2, p5, v0, p3}, Ll/y3i;->b(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const/4 p3, 0x1

    .line 38
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->u(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-nez p0, :cond_0

    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-virtual {p4, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic i()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    sget v2, Ll/qa00;->l:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    add-int/2addr v1, v2

    .line 21
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    new-instance v1, Landroid/view/TouchDelegate;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-direct {v1, v0, v2}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic j(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 6
    .line 7
    xor-int/lit8 v2, v1, 0x1

    .line 8
    .line 9
    iput-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 21
    .line 22
    add-int/lit8 v1, v1, -0x1

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 25
    .line 26
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 27
    .line 28
    iget-object v0, v0, Ll/jka;->H0:Ljava/util/Map;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->n(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->o(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 43
    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object p1, p1, Ll/jka;->R0:Lrx/subjects/b;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Ll/n570;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    iget-object p6, p6, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 4
    .line 5
    iget-boolean p6, p6, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 6
    .line 7
    if-nez p6, :cond_0

    .line 8
    .line 9
    const/4 p6, 0x0

    .line 10
    invoke-static {p1, p6}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string p6, "moment_id"

    .line 15
    .line 16
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p6, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p6

    .line 22
    const-string v0, "owner_id"

    .line 23
    .line 24
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "comment_id"

    .line 31
    .line 32
    iget-object p3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, p3}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    filled-new-array {p6, v0, p3}, [Ll/tfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    const-string p6, "e_comment_like"

    .line 43
    .line 44
    invoke-static {p6, p1, p3}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 52
    .line 53
    iget-object p6, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 56
    .line 57
    iget-boolean p3, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 58
    .line 59
    xor-int/lit8 p3, p3, 0x1

    .line 60
    .line 61
    invoke-virtual {p5, p1, p2, p6, p3}, Ll/n570;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance p2, Ll/wgh;

    .line 70
    .line 71
    invoke-direct {p2, p0}, Ll/wgh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;)V

    .line 72
    .line 73
    .line 74
    new-instance p0, Ll/xgh;

    .line 75
    .line 76
    invoke-direct {p0}, Ll/xgh;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jka;->H0:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->n(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->o(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Ll/n570;)V
    .locals 8

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 4
    .line 5
    new-instance p4, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "\u70ed\u8bc4 "

    .line 8
    .line 9
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    const-string v0, "\u70ed\u8bc4"

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Ll/k9c0;->D:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x3

    .line 40
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {p4, v0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->b:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 54
    .line 55
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->o(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 56
    .line 57
    .line 58
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->f:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 59
    .line 60
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->n(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 61
    .line 62
    .line 63
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->a:Landroid/view/View;

    .line 64
    .line 65
    new-instance v0, Ll/sgh;

    .line 66
    .line 67
    move-object v1, p0

    .line 68
    move-object v5, p1

    .line 69
    move-object v2, p2

    .line 70
    move-object v4, p3

    .line 71
    move-object v3, p5

    .line 72
    invoke-direct/range {v0 .. v5}, Ll/sgh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_0

    .line 89
    .line 90
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getTouchDelegate()Landroid/view/TouchDelegate;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    if-nez p0, :cond_0

    .line 103
    .line 104
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 105
    .line 106
    new-instance p1, Ll/tgh;

    .line 107
    .line 108
    invoke-direct {p1, v1}, Ll/tgh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 112
    .line 113
    .line 114
    :cond_0
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 115
    .line 116
    move-object v6, v5

    .line 117
    move-object v5, v4

    .line 118
    move-object v4, v2

    .line 119
    move-object v2, v1

    .line 120
    new-instance v1, Ll/ugh;

    .line 121
    .line 122
    move-object v7, p6

    .line 123
    invoke-direct/range {v1 .. v7}, Ll/ugh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Ll/n570;)V

    .line 124
    .line 125
    .line 126
    move-object p1, v1

    .line 127
    move-object v1, v2

    .line 128
    move-object v5, v6

    .line 129
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 133
    .line 134
    iget-object p0, p0, Ll/jka;->R0:Lrx/subjects/b;

    .line 135
    .line 136
    invoke-virtual {v5, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    new-instance p1, Ll/vgh;

    .line 141
    .line 142
    invoke-direct {p1, v1}, Ll/vgh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;)V

    .line 143
    .line 144
    .line 145
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p1, Ll/lbc0;->Q1:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p1, Ll/lbc0;->R1:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->c:Lv/VText;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v2, Ll/k9c0;->D:I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v2, Ll/k9c0;->q:I

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->c:Lv/VText;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 49
    .line 50
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 51
    .line 52
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
