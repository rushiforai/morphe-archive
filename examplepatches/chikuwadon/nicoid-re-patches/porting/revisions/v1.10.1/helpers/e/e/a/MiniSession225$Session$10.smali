.class Le/e/a/MiniSession225$Session$10;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MiniSession225.java"


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

.field private final synthetic val$expand:Z

.field private final synthetic val$token:I


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;IZ)V
    .registers 4

    .line 187
    iput-object p1, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    iput p2, p0, Le/e/a/MiniSession225$Session$10;->val$token:I

    iput-boolean p3, p0, Le/e/a/MiniSession225$Session$10;->val$expand:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 187
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    if-ne p1, v0, :cond_2b

    iget-object p1, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    iget-object p1, p1, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, p0, Le/e/a/MiniSession225$Session$10;->val$token:I

    invoke-virtual {p1, v0}, Le/e/a/MiniState225;->current(I)Z

    move-result p1

    if-nez p1, :cond_15

    goto :goto_2b

    :cond_15
    iget-object p1, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    iget-boolean p1, p0, Le/e/a/MiniSession225$Session$10;->val$expand:Z

    if-eqz p1, :cond_24

    iget-object p1, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {p1}, Le/e/a/MiniSession225$Session;->restore()V

    goto :goto_2b

    :cond_24
    iget-object p1, p0, Le/e/a/MiniSession225$Session$10;->this$1:Le/e/a/MiniSession225$Session;

    iget-object p1, p1, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {p1}, Le/e/a/MiniState225;->cancel()I

    :cond_2b
    :goto_2b
    return-void
.end method
