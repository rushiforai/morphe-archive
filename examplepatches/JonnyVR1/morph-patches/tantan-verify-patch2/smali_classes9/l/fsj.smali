.class public Ll/fsj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;

.field public b:Landroid/animation/Animator;

.field public c:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fsj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/fsj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fsj;->c()V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)[I
    .locals 2

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    aget v0, p0, p1

    .line 9
    .line 10
    sget v1, Ll/qa00;->f:I

    .line 11
    .line 12
    sub-int/2addr v0, v1

    .line 13
    aput v0, p0, p1

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fsj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->g:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsj;->b:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;Ll/x20;Ll/x20;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fsj;->b:Landroid/animation/Animator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/fsj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 9
    .line 10
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 11
    .line 12
    const/4 v3, 0x2

    .line 13
    new-array v3, v3, [F

    .line 14
    .line 15
    fill-array-data v3, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v2, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/fsj;->b:Landroid/animation/Animator;

    .line 23
    .line 24
    const-wide/16 v2, 0xc8

    .line 25
    .line 26
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/fsj;->b:Landroid/animation/Animator;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/fsj;->b:Landroid/animation/Animator;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/fsj;->c:Landroid/animation/Animator;

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    const/16 v0, 0x12c

    .line 44
    .line 45
    invoke-static {v0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/fsj;->c:Landroid/animation/Animator;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/fsj;->c:Landroid/animation/Animator;

    .line 55
    .line 56
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    new-instance v1, Ll/bri0;

    .line 60
    .line 61
    invoke-direct {v1, p4}, Ll/bri0;-><init>(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p4, p0, Ll/fsj;->c:Landroid/animation/Animator;

    .line 68
    .line 69
    invoke-virtual {p4}, Landroid/animation/Animator;->start()V

    .line 70
    .line 71
    .line 72
    invoke-interface {p3}, Ll/x20;->call()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;->l()V

    .line 76
    .line 77
    .line 78
    iget-object p3, p0, Ll/fsj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;

    .line 79
    .line 80
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->g:Lv/VDraweeView;

    .line 81
    .line 82
    invoke-virtual {p0, p3}, Ll/fsj;->b(Landroid/view/View;)[I

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;->k([I)V

    .line 87
    .line 88
    .line 89
    new-instance p3, Ll/dsj;

    .line 90
    .line 91
    invoke-direct {p3, p0}, Ll/dsj;-><init>(Ll/fsj;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;->p([ILl/x20;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    nop

    .line 99
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
