.class public final Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;,
        Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;,
        Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0010\u0008\u0086\u0008\u0018\u0000  2\u00020\u0001:\u0003\u0019!\"B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0010\u0010\u0011\u001a\u00020\u0010H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0010\u0010\u0014\u001a\u00020\u0013H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001a\u0010\u0017\u001a\u00020\t2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001cR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001d\u001a\u0004\u0008\u0019\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u001f\u00a8\u0006#"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "step",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;",
        "event",
        "data",
        "<init>",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;)V",
        "",
        "c",
        "()Z",
        "d",
        "",
        "e",
        "()Ljava/lang/Throwable;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "a",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "b",
        "()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;",
        "()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;",
        "Ljava/lang/Object;",
        "Companion",
        "Event",
        "Step",
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


# static fields
.field public static final Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/Object;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 17
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 2
    .line 3
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->values()[Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Lkotlin/collections/ArraysKt;->last([Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 14
    .line 15
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Success:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 2
    .line 3
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;->Failure:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final e()Ljava/lang/Throwable;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    check-cast p0, Ljava/lang/Throwable;

    .line 7
    .line 8
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    iget-object v3, p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    iget-object v3, p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    iget-object p1, p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_0
    add-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LoadEvent(step="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", event="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->b:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Event;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
