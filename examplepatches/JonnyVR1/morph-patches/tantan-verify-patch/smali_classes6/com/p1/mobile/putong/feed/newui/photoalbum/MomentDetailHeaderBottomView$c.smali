.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/ImageView;

.field public final synthetic b:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/widget/ImageView;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->a:Landroid/widget/ImageView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->b(Lcom/tantan/library/svga/SVGAnimationView;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const v0, 0x1020002

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFinished()V
    .locals 10

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->a:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    .line 27
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    new-array v9, v0, [F

    .line 34
    .line 35
    fill-array-data v9, :array_0

    .line 36
    .line 37
    .line 38
    const-string v3, "alpha"

    .line 39
    .line 40
    const-wide/16 v4, 0x0

    .line 41
    .line 42
    const-wide/16 v6, 0xfa

    .line 43
    .line 44
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 49
    .line 50
    new-instance v2, Ll/hl00;

    .line 51
    .line 52
    invoke-direct {v2, p0, v1}, Ll/hl00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;->a:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
