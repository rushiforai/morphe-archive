.class public final Ld/b/q/a0;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/b/q/a0$a;,
        Ld/b/q/a0$b;,
        Ld/b/q/a0$f;,
        Ld/b/q/a0$c;,
        Ld/b/q/a0$d;,
        Ld/b/q/a0$e;
    }
.end annotation


# static fields
.field public static final h:Landroid/graphics/PorterDuff$Mode;

.field public static i:Ld/b/q/a0;

.field public static final j:Ld/b/q/a0$c;


# instance fields
.field public a:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Ld/e/i<",
            "Landroid/content/res/ColorStateList;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ld/e/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ld/e/h<",
            "Ljava/lang/String;",
            "Ld/b/q/a0$d;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ld/e/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ld/e/i<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Ld/e/e<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public e:Landroid/util/TypedValue;

.field public f:Z

.field public g:Ld/b/q/a0$e;


# virtual methods
.method public declared-synchronized a(Landroid/content/Context;)V
    .registers 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ld/b/q/a0;->a:Ljava/util/WeakHashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Ld/b/q/a0;->d:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld/e/e;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ld/e/e;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
