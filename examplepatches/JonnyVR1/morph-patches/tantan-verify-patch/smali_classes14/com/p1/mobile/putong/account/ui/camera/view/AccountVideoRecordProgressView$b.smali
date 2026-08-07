.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;->a:Z

    .line 3
    .line 4
    return-void
.end method
