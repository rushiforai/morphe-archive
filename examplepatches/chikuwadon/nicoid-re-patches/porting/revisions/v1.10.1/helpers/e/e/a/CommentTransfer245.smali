.class public final Le/e/a/CommentTransfer245;
.super Ljava/lang/Object;
.source "CommentTransfer245.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static stop(Landroid/view/View;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 7
    if-nez p0, :cond_3

    return-void

    .line 8
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e.e.a.u"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 10
    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "t"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 12
    instance-of v3, v2, Ljava/lang/Thread;

    if-eqz v3, :cond_39

    move-object v3, v2

    check-cast v3, Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 13
    :cond_39
    monitor-enter p0

    .line 14
    :try_start_3a
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "t"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 16
    instance-of v1, v0, Ljava/lang/Thread;

    if-eqz v1, :cond_56

    if-eq v0, v2, :cond_56

    check-cast v0, Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 13
    :cond_56
    monitor-exit p0

    goto :goto_5b

    :catchall_58
    move-exception v0

    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_3a .. :try_end_5a} :catchall_58

    throw v0

    .line 19
    :cond_5b
    :goto_5b
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_73

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_69

    goto :goto_73

    :cond_69
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CommentTransfer245;->stop(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_62

    .line 20
    :cond_73
    :goto_73
    return-void
.end method
