.class Le/e/a/DirectBackground235$State$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DirectBackground235.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/DirectBackground235$State;->settle(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/DirectBackground235$State;

.field private final synthetic val$expand:Z

.field private final synthetic val$generation:I


# direct methods
.method constructor <init>(Le/e/a/DirectBackground235$State;IZ)V
    .registers 4

    .line 49
    iput-object p1, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    iput p2, p0, Le/e/a/DirectBackground235$State$3;->val$generation:I

    iput-boolean p3, p0, Le/e/a/DirectBackground235$State$3;->val$expand:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 49
    sget-object p1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v0, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    if-ne p1, v0, :cond_29

    iget-object p1, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    iget-object p1, p1, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v0, p0, Le/e/a/DirectBackground235$State$3;->val$generation:I

    invoke-virtual {p1, v0}, Le/e/a/MiniState225;->current(I)Z

    move-result p1

    if-nez p1, :cond_13

    goto :goto_29

    :cond_13
    iget-object p1, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    iget-boolean p1, p0, Le/e/a/DirectBackground235$State$3;->val$expand:Z

    if-eqz p1, :cond_22

    iget-object p1, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    invoke-virtual {p1}, Le/e/a/DirectBackground235$State;->expand()V

    goto :goto_29

    :cond_22
    iget-object p1, p0, Le/e/a/DirectBackground235$State$3;->this$1:Le/e/a/DirectBackground235$State;

    iget-object p1, p1, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {p1}, Le/e/a/MiniState225;->cancel()I

    :cond_29
    :goto_29
    return-void
.end method
