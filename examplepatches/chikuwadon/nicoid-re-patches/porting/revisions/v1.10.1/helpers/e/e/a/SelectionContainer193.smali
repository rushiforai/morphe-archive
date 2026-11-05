.class public final Le/e/a/SelectionContainer193;
.super Ljava/lang/Object;
.source "SelectionContainer193.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static outer(Landroid/view/View;)Landroid/view/View;
    .registers 4

    .line 5
    nop

    .line 6
    nop

    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-nez v0, :cond_b

    goto :goto_26

    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 7
    instance-of v2, v0, Le/e/a/SearchSwipe;

    if-nez v2, :cond_27

    const-string v2, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    goto :goto_27

    .line 9
    :cond_26
    :goto_26
    return-object p0

    .line 7
    :cond_27
    :goto_27
    move-object p0, v0

    goto :goto_2
.end method
