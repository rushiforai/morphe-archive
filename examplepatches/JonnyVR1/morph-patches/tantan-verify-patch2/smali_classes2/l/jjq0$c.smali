.class public final Ll/jjq0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jjq0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jjq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0015\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\'\u0010\u000f\u001a\u00060\u0000R\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0018\u00010\u0000R\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J!\u0010\u0011\u001a\u0008\u0018\u00010\u0000R\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0018\u00010\u0000R\u00020\u000c\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R0\u0010\u001a\u001a\u0008\u0018\u00010\u0000R\u00020\u000c2\u000c\u0010\u0016\u001a\u0008\u0018\u00010\u0000R\u00020\u000c8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\u001c\u0010\u001b\u001a\u0008\u0018\u00010\u0000R\u00020\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0017R\"\u0010 \u001a\u00020\u00068\u0016@\u0016X\u0096\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001c\u0010\u0008\"\u0004\u0008\u001e\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Ll/jjq0$c;",
        "Ll/jjq0$b;",
        "Ljava/lang/Runnable;",
        "callback",
        "<init>",
        "(Ll/jjq0;Ljava/lang/Runnable;)V",
        "",
        "cancel",
        "()Z",
        "",
        "a",
        "()V",
        "Ll/jjq0;",
        "list",
        "addToFront",
        "b",
        "(Ll/jjq0$c;Z)Ll/jjq0$c;",
        "e",
        "(Ll/jjq0$c;)Ll/jjq0$c;",
        "Ljava/lang/Runnable;",
        "c",
        "()Ljava/lang/Runnable;",
        "<set-?>",
        "Ll/jjq0$c;",
        "getNext",
        "()Ll/jjq0$c;",
        "next",
        "prev",
        "d",
        "Z",
        "f",
        "(Z)V",
        "isRunning",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ll/jjq0$c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:Ll/jjq0$c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Z

.field public final synthetic e:Ll/jjq0;


# direct methods
.method public constructor <init>(Ll/jjq0;Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ll/jjq0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jjq0$c;->e:Ll/jjq0;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/jjq0$c;->a:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jjq0$c;->e:Ll/jjq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jjq0;->c(Ll/jjq0;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jjq0$c;->e:Ll/jjq0;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Ll/jjq0$c;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Ll/jjq0;->b(Ll/jjq0;)Ll/jjq0$c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0, v2}, Ll/jjq0$c;->e(Ll/jjq0$c;)Ll/jjq0$c;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v1, v2}, Ll/jjq0;->d(Ll/jjq0;Ll/jjq0$c;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/jjq0;->b(Ll/jjq0;)Ll/jjq0$c;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {p0, v2, v3}, Ll/jjq0$c;->b(Ll/jjq0$c;Z)Ll/jjq0$c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v1, p0}, Ll/jjq0;->d(Ll/jjq0;Ll/jjq0$c;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :goto_1
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 51
    .line 52
    .line 53
    throw p0
.end method

.method public final b(Ll/jjq0$c;Z)Ll/jjq0$c;
    .locals 4
    .param p1    # Ll/jjq0$c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/jjq0;->Companion:Ll/jjq0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    move v1, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    invoke-static {v0, v1}, Ll/jjq0$a;->a(Ll/jjq0$a;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    move v2, v3

    .line 20
    :cond_1
    invoke-static {v0, v2}, Ll/jjq0$a;->a(Ll/jjq0$a;Z)V

    .line 21
    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    iput-object p0, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 26
    .line 27
    iput-object p0, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 28
    .line 29
    move-object p1, p0

    .line 30
    goto :goto_3

    .line 31
    :cond_2
    iput-object p1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 32
    .line 33
    iget-object v0, p1, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 34
    .line 35
    iput-object v0, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    iput-object p0, v0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 41
    .line 42
    :goto_1
    iget-object v1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 43
    .line 44
    if-nez v1, :cond_4

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_4
    if-eqz v0, :cond_5

    .line 48
    .line 49
    iget-object v0, v0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_5
    const/4 v0, 0x0

    .line 53
    :goto_2
    iput-object v0, v1, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 54
    .line 55
    :goto_3
    if-eqz p2, :cond_6

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_6
    return-object p1
.end method

.method public final c()Ljava/lang/Runnable;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jjq0$c;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public cancel()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jjq0$c;->e:Ll/jjq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jjq0;->c(Ll/jjq0;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jjq0$c;->e:Ll/jjq0;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Ll/jjq0$c;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Ll/jjq0;->b(Ll/jjq0;)Ll/jjq0$c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0, v2}, Ll/jjq0$c;->e(Ll/jjq0$c;)Ll/jjq0$c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, p0}, Ll/jjq0;->d(Ll/jjq0;Ll/jjq0$c;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    :try_start_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jjq0$c;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e(Ll/jjq0$c;)Ll/jjq0$c;
    .locals 4
    .param p1    # Ll/jjq0$c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/jjq0;->Companion:Ll/jjq0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move v1, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    invoke-static {v0, v1}, Ll/jjq0$a;->a(Ll/jjq0$a;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    move v2, v3

    .line 20
    :cond_1
    invoke-static {v0, v2}, Ll/jjq0$a;->a(Ll/jjq0$a;Z)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-ne p1, p0, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 27
    .line 28
    if-ne p1, p0, :cond_2

    .line 29
    .line 30
    move-object p1, v0

    .line 31
    :cond_2
    iget-object v1, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 32
    .line 33
    if-nez v1, :cond_3

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_3
    iget-object v2, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 37
    .line 38
    iput-object v2, v1, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 39
    .line 40
    :goto_1
    iget-object v2, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 41
    .line 42
    if-nez v2, :cond_4

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_4
    iput-object v1, v2, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 46
    .line 47
    :goto_2
    iput-object v0, p0, Ll/jjq0$c;->c:Ll/jjq0$c;

    .line 48
    .line 49
    iput-object v0, p0, Ll/jjq0$c;->b:Ll/jjq0$c;

    .line 50
    .line 51
    return-object p1
.end method

.method public f(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jjq0$c;->d:Z

    .line 2
    .line 3
    return-void
.end method
