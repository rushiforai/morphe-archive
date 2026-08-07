.class public final synthetic Ll/bq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bq3;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    iput-boolean p2, p0, Ll/bq3;->b:Z

    iput-object p3, p0, Ll/bq3;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bq3;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    iget-boolean v1, p0, Ll/bq3;->b:Z

    iget-object p0, p0, Ll/bq3;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;->a(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;ZLjava/lang/String;Landroid/animation/ValueAnimator;)V

    return-void
.end method
