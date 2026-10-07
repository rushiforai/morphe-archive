.class public final Le/e/a/CommentDuration;
.super Ljava/lang/Object;
.source "CommentDuration.java"


# static fields
.field static final applied:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final fields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentDuration;->applied:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/CommentDuration;->fields:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 5
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_75

    if-nez p2, :cond_7

    goto :goto_75

    :cond_7
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 p1, 0x5

    const/16 v0, 0x14

    const-string v1, "comment_duration_seconds"

    const/4 v2, 0x1

    invoke-static {p0, v1, p1, v2, v0}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result p0

    mul-int/lit8 p0, p0, 0x64

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_75

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_2a

    :goto_29
    goto :goto_1d

    :cond_2a
    sget-object v0, Le/e/a/CommentDuration;->applied:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_3b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p0, :cond_3b

    goto :goto_29

    :cond_3b
    :try_start_3b
    sget-object v0, Le/e/a/CommentDuration;->fields:Ljava/util/Map;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-nez v0, :cond_5f

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "k"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    sget-object v1, Le/e/a/CommentDuration;->fields:Ljava/util/Map;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5f
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Le/e/a/CommentDuration;->applied:Ljava/util/WeakHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_6f} :catch_70

    goto :goto_29

    :catch_70
    move-exception p2

    invoke-static {p2}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    goto :goto_29

    :cond_75
    :goto_75
    return-void
.end method
