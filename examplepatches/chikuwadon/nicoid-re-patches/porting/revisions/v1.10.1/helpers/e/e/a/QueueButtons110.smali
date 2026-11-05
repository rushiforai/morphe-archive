.class public final Le/e/a/QueueButtons110;
.super Ljava/lang/Object;
.source "QueueButtons110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;)V
    .registers 9

    .line 5
    if-nez p0, :cond_3

    return-void

    :cond_3
    const-string v0, "prevbutton"

    const-string v1, "nextbutton"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    :goto_c
    const/4 v3, 0x2

    if-lt v2, v3, :cond_10

    return-void

    :cond_10
    aget-object v3, v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "id"

    invoke-virtual {v4, v3, v6, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_28

    const/4 v4, 0x0

    goto :goto_2c

    :cond_28
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    :goto_2c
    if-nez v4, :cond_2f

    goto :goto_3b

    :cond_2f
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    new-instance v5, Le/e/a/QueueButtons110$1;

    invoke-direct {v5, p1, v3}, Le/e/a/QueueButtons110$1;-><init>(Ljava/lang/Object;Z)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :goto_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method
