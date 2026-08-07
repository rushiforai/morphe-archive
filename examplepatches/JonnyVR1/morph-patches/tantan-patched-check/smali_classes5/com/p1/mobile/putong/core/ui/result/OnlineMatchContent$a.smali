.class public Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->a:Lv/VFrame;

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
    neg-int v2, v2

    .line 12
    int-to-float v2, v2

    .line 13
    const/4 v9, 0x2

    .line 14
    new-array v8, v9, [F

    .line 15
    .line 16
    const/4 v10, 0x0

    .line 17
    aput v2, v8, v10

    .line 18
    .line 19
    const/4 v11, 0x1

    .line 20
    const/4 v12, 0x0

    .line 21
    aput v12, v8, v11

    .line 22
    .line 23
    const-string v2, "translationY"

    .line 24
    .line 25
    const-wide/16 v3, 0x0

    .line 26
    .line 27
    const-wide/16 v5, 0x190

    .line 28
    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->d(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;Landroid/animation/Animator;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    int-to-float v1, v1

    .line 45
    new-array v9, v9, [F

    .line 46
    .line 47
    aput v1, v9, v10

    .line 48
    .line 49
    aput v12, v9, v11

    .line 50
    .line 51
    const-string v3, "translationY"

    .line 52
    .line 53
    const-wide/16 v4, 0x0

    .line 54
    .line 55
    move-object v8, v7

    .line 56
    const-wide/16 v6, 0x190

    .line 57
    .line 58
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->e(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;Landroid/animation/Animator;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->a(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;-><init>(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
