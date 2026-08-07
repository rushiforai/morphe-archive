.class public final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0018\u0010\u000c\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "config",
        "",
        "b",
        "(Lcom/tantanapp/sharedlibrary/loader/a;)V",
        "Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;",
        "a",
        "()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;",
        "instance",
        "Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->f()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "Required value was null."

    .line 9
    .line 10
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public final b(Lcom/tantanapp/sharedlibrary/loader/a;)V
    .locals 2
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->f()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    monitor-enter p0

    .line 12
    :try_start_0
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->f()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 13
    .line 14
    .line 15
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :cond_1
    :try_start_1
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-direct {v0, p1, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;-><init>(Lcom/tantanapp/sharedlibrary/loader/a;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->i(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->g(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    monitor-exit p0

    .line 38
    throw p1
.end method
