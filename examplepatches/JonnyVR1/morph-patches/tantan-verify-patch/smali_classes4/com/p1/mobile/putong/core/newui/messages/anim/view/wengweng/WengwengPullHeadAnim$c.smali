.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->b(Landroid/animation/Animator;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->k0(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView;->getHeaderState()Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView$State;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView$State;->TipState:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengWengHeaderView$State;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->g:Lv/VDraweeView;

    .line 18
    .line 19
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v8, v0, [F

    .line 23
    .line 24
    fill-array-data v8, :array_0

    .line 25
    .line 26
    .line 27
    move-object v2, v3

    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    const-wide/16 v5, 0xc8

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 38
    .line 39
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->f:Lv/VDraweeView;

    .line 40
    .line 41
    new-array v9, v0, [F

    .line 42
    .line 43
    fill-array-data v9, :array_1

    .line 44
    .line 45
    .line 46
    const-wide/16 v4, 0x0

    .line 47
    .line 48
    const-wide/16 v6, 0xc8

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    move-object v11, v3

    .line 52
    move-object v3, v2

    .line 53
    move-object v2, v11

    .line 54
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    move-object v2, v3

    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;

    .line 60
    .line 61
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 62
    .line 63
    new-array v9, v0, [F

    .line 64
    .line 65
    fill-array-data v9, :array_2

    .line 66
    .line 67
    .line 68
    move-object v11, v3

    .line 69
    move-object v3, v2

    .line 70
    move-object v2, v11

    .line 71
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v2, Ll/ceq0;

    .line 76
    .line 77
    invoke-direct {v2, p0, v0}, Ll/ceq0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;Landroid/animation/Animator;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v10}, Landroid/animation/Animator;->start()V

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void

    .line 90
    nop

    .line 91
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
