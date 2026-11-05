.class Le/e/a/MiniSession225$Session$9;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MiniSession225$Session;->settle(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;

.field private final synthetic val$token:I


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;I)V
    .registers 3

    .line 186
    iput-object p1, p0, Le/e/a/MiniSession225$Session$9;->this$1:Le/e/a/MiniSession225$Session;

    iput p2, p0, Le/e/a/MiniSession225$Session$9;->val$token:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 4

    .line 186
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$9;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_23

    iget-object v0, p0, Le/e/a/MiniSession225$Session$9;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v1, p0, Le/e/a/MiniSession225$Session$9;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/MiniState225;->current(I)Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Le/e/a/MiniSession225$Session$9;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v0, p1}, Le/e/a/MiniSession225$Session;->apply(F)V

    :cond_23
    return-void
.end method
