.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->onStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->a:Landroid/view/View;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v2, v1, [F

    .line 7
    .line 8
    fill-array-data v2, :array_0

    .line 9
    .line 10
    .line 11
    const-string v3, "scaleX"

    .line 12
    .line 13
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->a:Landroid/view/View;

    .line 20
    .line 21
    new-array v3, v1, [F

    .line 22
    .line 23
    fill-array-data v3, :array_1

    .line 24
    .line 25
    .line 26
    const-string v4, "scaleY"

    .line 27
    .line 28
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-wide/16 v3, 0xfa

    .line 33
    .line 34
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    new-instance v3, Landroid/view/animation/AccelerateInterpolator;

    .line 41
    .line 42
    invoke-direct {v3}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/view/animation/AccelerateInterpolator;

    .line 49
    .line 50
    invoke-direct {v3}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->b:Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    new-array v1, v1, [Landroid/animation/Animator;

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    aput-object v0, v1, v4

    .line 64
    .line 65
    const/4 v0, 0x1

    .line 66
    aput-object v2, v1, v0

    .line 67
    .line 68
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->b:Landroid/animation/AnimatorSet;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
