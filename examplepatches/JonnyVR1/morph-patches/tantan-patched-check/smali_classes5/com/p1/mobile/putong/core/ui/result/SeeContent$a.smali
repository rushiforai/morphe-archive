.class public Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/SeeContent;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/SeeContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->b:Lv/VLinear;

    .line 4
    .line 5
    sget-object v7, Ll/gt0;->c:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    int-to-float v2, v2

    .line 12
    const/4 v9, 0x2

    .line 13
    new-array v8, v9, [F

    .line 14
    .line 15
    const/4 v10, 0x0

    .line 16
    aput v2, v8, v10

    .line 17
    .line 18
    const/4 v11, 0x1

    .line 19
    const/4 v12, 0x0

    .line 20
    aput v12, v8, v11

    .line 21
    .line 22
    const-string v2, "translationY"

    .line 23
    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    const-wide/16 v5, 0xc8

    .line 27
    .line 28
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->e(Lcom/p1/mobile/putong/core/ui/result/SeeContent;Landroid/animation/Animator;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->c:Lv/VLinear;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    int-to-float v1, v1

    .line 44
    new-array v9, v9, [F

    .line 45
    .line 46
    aput v1, v9, v10

    .line 47
    .line 48
    aput v12, v9, v11

    .line 49
    .line 50
    const-string v3, "translationY"

    .line 51
    .line 52
    const-wide/16 v4, 0x0

    .line 53
    .line 54
    move-object v8, v7

    .line 55
    const-wide/16 v6, 0xc8

    .line 56
    .line 57
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->d(Lcom/p1/mobile/putong/core/ui/result/SeeContent;Landroid/animation/Animator;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->c(Lcom/p1/mobile/putong/core/ui/result/SeeContent;)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;-><init>(Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
