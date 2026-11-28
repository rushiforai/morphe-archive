.class public final Le/e/a/SmoothTabRestore204;
.super Ljava/lang/Object;
.source "SmoothTabRestore204.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SmoothTabRestore204$Applied;,
        Le/e/a/SmoothTabRestore204$Pending;
    }
.end annotation


# static fields
.field private static final APPLIED:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ListView;",
            "Le/e/a/SmoothTabRestore204$Applied;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final PENDING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ListView;",
            "Le/e/a/SmoothTabRestore204$Pending;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SmoothTabRestore204;->MAIN:Landroid/os/Handler;

    .line 20
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SmoothTabRestore204;->PENDING:Ljava/util/Map;

    .line 21
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SmoothTabRestore204;->APPLIED:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .registers 1

    .line 19
    sget-object v0, Le/e/a/SmoothTabRestore204;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/Map;
    .registers 1

    .line 20
    sget-object v0, Le/e/a/SmoothTabRestore204;->PENDING:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$2(Landroid/widget/ListView;II)V
    .registers 3

    .line 32
    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->apply(Landroid/widget/ListView;II)V

    return-void
.end method

.method private static apply(Landroid/widget/ListView;II)V
    .registers 5

    .line 33
    sget-object v0, Le/e/a/SmoothTabRestore204;->APPLIED:Ljava/util/Map;

    new-instance v1, Le/e/a/SmoothTabRestore204$Applied;

    invoke-direct {v1, p1, p2}, Le/e/a/SmoothTabRestore204$Applied;-><init>(II)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    invoke-virtual {p0, p1, p2}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    return-void
.end method

.method static cancel244(Landroid/widget/ListView;)V
    .registers 3

    sget-object v0, Le/e/a/SmoothTabRestore204;->PENDING:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SmoothTabRestore204$Pending;

    if-eqz v1, :cond_0

    # invokes: Le/e/a/SmoothTabRestore204$Pending;->cancel()V
    invoke-static {v1}, Le/e/a/SmoothTabRestore204$Pending;->access$2(Le/e/a/SmoothTabRestore204$Pending;)V

    :cond_0
    sget-object v0, Le/e/a/SmoothTabRestore204;->APPLIED:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    .line 40
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 39
    :catch_0
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 43
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static justApplied(Landroid/widget/ListView;II)Z
    .registers 5

    .line 28
    sget-object v0, Le/e/a/SmoothTabRestore204;->APPLIED:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/SmoothTabRestore204$Applied;

    if-eqz p0, :cond_0

    .line 29
    iget v0, p0, Le/e/a/SmoothTabRestore204$Applied;->position:I

    if-ne v0, p1, :cond_0

    iget p1, p0, Le/e/a/SmoothTabRestore204$Applied;->top:I

    if-ne p1, p2, :cond_0

    .line 30
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Le/e/a/SmoothTabRestore204$Applied;->at:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x1f4

    cmp-long p0, p1, v0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;II)V
    .registers 3

    .line 62
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/ListView;

    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->restoreList(Landroid/widget/ListView;II)V

    return-void
.end method

.method public static restore(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 49
    :try_start_0
    const-string v0, "current"

    invoke-static {p0, v0}, Le/e/a/SmoothTabRestore204;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_0

    .line 50
    const-string p0, "b0"

    invoke-static {p1, p0}, Le/e/a/SmoothTabRestore204;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 51
    instance-of p1, p0, Landroid/widget/ListView;

    if-eqz p1, :cond_0

    check-cast p0, Landroid/widget/ListView;

    .line 52
    const-string p1, "position"

    invoke-static {p2, p1}, Le/e/a/SmoothTabRestore204;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const-string v0, "top"

    invoke-static {p2, v0}, Le/e/a/SmoothTabRestore204;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 51
    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->restoreList(Landroid/widget/ListView;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 54
    const-string p1, "nicoid-tabs"

    const-string p2, "Single-jump restore skipped"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public static restoreList(Landroid/widget/ListView;II)V
    .registers 12

    if-eqz p0, :cond_6

    .line 60
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 61
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 62
    sget-object p0, Le/e/a/SmoothTabRestore204;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/SmoothTabRestore204$0;

    invoke-direct {v1, v0, p1, p2}, Le/e/a/SmoothTabRestore204$0;-><init>(Ljava/lang/ref/WeakReference;II)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 65
    :cond_0
    invoke-static {p0}, Le/e/a/LocalReload244;->pulling(Landroid/widget/ListView;)Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v0, Le/e/a/SmoothTabRestore204;->PENDING:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SmoothTabRestore204$Pending;

    if-eqz v1, :cond_1

    .line 66
    # getter for: Le/e/a/SmoothTabRestore204$Pending;->position:I
    invoke-static {v1}, Le/e/a/SmoothTabRestore204$Pending;->access$0(Le/e/a/SmoothTabRestore204$Pending;)I

    move-result v2

    if-ne v2, p1, :cond_1

    # getter for: Le/e/a/SmoothTabRestore204$Pending;->top:I
    invoke-static {v1}, Le/e/a/SmoothTabRestore204$Pending;->access$1(Le/e/a/SmoothTabRestore204$Pending;)I

    move-result v2

    if-eq v2, p2, :cond_6

    :cond_1
    if-eqz v1, :cond_2

    .line 67
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    # invokes: Le/e/a/SmoothTabRestore204$Pending;->cancel()V
    invoke-static {v1}, Le/e/a/SmoothTabRestore204$Pending;->access$2(Le/e/a/SmoothTabRestore204$Pending;)V

    :cond_2
    if-ltz p1, :cond_6

    .line 68
    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->justApplied(Landroid/widget/ListView;II)Z

    move-result v1

    if-nez v1, :cond_6

    .line 69
    invoke-virtual {p0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    const/4 v1, 0x0

    .line 70
    invoke-virtual {p0, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    if-nez p1, :cond_3

    if-nez p2, :cond_3

    if-nez v6, :cond_3

    if-eqz v7, :cond_6

    .line 73
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    if-nez v7, :cond_4

    move v2, v1

    goto :goto_0

    .line 74
    :cond_4
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v1

    const/4 v2, 0x1

    move v8, v2

    move v2, v1

    move v1, v8

    :goto_0
    invoke-static {p1, p2, v6, v2, v1}, Le/e/a/ScrollRestorePolicy204;->needs(IIIIZ)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 75
    invoke-virtual {p0}, Landroid/widget/ListView;->getCount()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/ListView;->getHeight()I

    move-result v2

    .line 76
    invoke-virtual {p0}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v3

    invoke-virtual {p0}, Landroid/widget/ListView;->isShown()Z

    move-result v4

    .line 75
    invoke-static {v1, p1, v2, v3, v4}, Le/e/a/ScrollRestorePolicy205;->ready(IIIZZ)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 77
    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->apply(Landroid/widget/ListView;II)V

    return-void

    .line 80
    :cond_5
    new-instance v2, Le/e/a/SmoothTabRestore204$Pending;

    move-object v3, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v2 .. v7}, Le/e/a/SmoothTabRestore204$Pending;-><init>(Landroid/widget/ListView;IIILandroid/view/View;)V

    .line 81
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object p0, Le/e/a/SmoothTabRestore204;->MAIN:Landroid/os/Handler;

    invoke-virtual {p0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_6
    return-void
.end method

.method public static restoring(Landroid/widget/ListView;)Z
    .registers 2

    if-eqz p0, :cond_0

    .line 87
    sget-object v0, Le/e/a/SmoothTabRestore204;->PENDING:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
