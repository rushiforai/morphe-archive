.class public final Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J!\u0010\n\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001d\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "step",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "b",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "result",
        "c",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "",
        "throwable",
        "a",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Throwable;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
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
    invoke-direct {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;-><init>()V

    return-void
.end method

.method public static synthetic d(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;ILjava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->c(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Throwable;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
    .locals 1
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 8
    .line 9
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Failure:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 10
    .line 11
    invoke-direct {p0, p1, v0, p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final b(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
    .locals 6
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 5
    .line 6
    sget-object v2, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Start:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 7
    .line 8
    const/4 v4, 0x4

    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v1, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final c(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
    .locals 1
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Success:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 7
    .line 8
    invoke-direct {p0, p1, v0, p2}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
