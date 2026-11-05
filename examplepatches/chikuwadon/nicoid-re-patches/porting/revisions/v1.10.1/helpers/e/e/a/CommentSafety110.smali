.class public final Le/e/a/CommentSafety110;
.super Ljava/lang/Object;
.source "CommentSafety110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activity(Landroid/app/Activity;)V
    .registers 1

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CommentSafety110;->stop(Landroid/view/View;)V

    return-void
.end method

.method public static stop(Landroid/view/View;)V
    .registers 3

    .line 5
    if-nez p0, :cond_3

    return-void

    :cond_3
    :try_start_3
    invoke-static {p0}, Le/e/a/CommentTransfer245;->stop(Landroid/view/View;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_f

    :catch_7
    move-exception p0

    const-string v0, "nicoid-comments"

    const-string v1, "Cannot drain comment renderer"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_f
    return-void
.end method
