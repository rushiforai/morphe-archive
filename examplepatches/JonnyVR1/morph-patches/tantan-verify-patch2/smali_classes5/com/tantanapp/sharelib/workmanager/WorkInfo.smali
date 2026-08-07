.class public final Lcom/tantanapp/sharelib/workmanager/WorkInfo;
.super Ljava/util/Observable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;,
        Lcom/tantanapp/sharelib/workmanager/WorkInfo$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u001e\u0008\u0086\u0008\u0018\u0000 B2\u00020\u0001:\u0002BCBE\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\t\u0012\u0006\u0010\u000c\u001a\u00020\t\u0012\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0011J\u0015\u0010\u0014\u001a\u00020\u00122\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\u00020\u00122\u0006\u0010\u0018\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0019\u0010\u0017J\u0015\u0010\u001a\u001a\u00020\u00122\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u001a\u0010\u0017J\u0017\u0010\u001d\u001a\u00020\u00122\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u001b\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005H\u00d6\u0001\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0010\u0010\"\u001a\u00020!H\u00d6\u0001\u00a2\u0006\u0004\u0008\"\u0010#J\u001a\u0010\'\u001a\u00020&2\u0008\u0010%\u001a\u0004\u0018\u00010$H\u00d6\u0003\u00a2\u0006\u0004\u0008\'\u0010(R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008)\u0010*\u001a\u0004\u0008+\u0010,R\u001d\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008+\u0010-\u001a\u0004\u0008.\u0010/R\"\u0010\u0008\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00080\u00101\u001a\u0004\u00082\u00103\"\u0004\u00084\u0010\u0015R\u0017\u0010\n\u001a\u00020\t8\u0006\u00a2\u0006\u000c\n\u0004\u0008.\u00105\u001a\u0004\u00080\u00106R\u0017\u0010\u000b\u001a\u00020\t8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001d\u00105\u001a\u0004\u00087\u00106R\u0017\u0010\u000c\u001a\u00020\t8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u00105\u001a\u0004\u00088\u00106R\"\u0010\u000e\u001a\u00020\r8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0013\u00109\u001a\u0004\u0008)\u0010:\"\u0004\u0008;\u0010<R$\u0010A\u001a\u0004\u0018\u00010\u001b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010\u001e\u00a8\u0006D"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "Ljava/util/Observable;",
        "Ljava/util/UUID;",
        "id",
        "",
        "",
        "tags",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        "state",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "input",
        "output",
        "progress",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "constraints",
        "<init>",
        "(Ljava/util/UUID;Ljava/util/Set;Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Constraints;)V",
        "()V",
        "",
        "g",
        "j",
        "(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V",
        "i",
        "(Lcom/tantanapp/sharelib/workmanager/Data;)V",
        "result",
        "h",
        "f",
        "",
        "err",
        "e",
        "(Ljava/lang/Throwable;)V",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "a",
        "Ljava/util/UUID;",
        "b",
        "()Ljava/util/UUID;",
        "Ljava/util/Set;",
        "d",
        "()Ljava/util/Set;",
        "c",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        "getState",
        "()Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        "setState",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "()Lcom/tantanapp/sharelib/workmanager/Data;",
        "getOutput",
        "getProgress",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "()Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "setConstraints",
        "(Lcom/tantanapp/sharelib/workmanager/Constraints;)V",
        "Ljava/lang/Throwable;",
        "getException",
        "()Ljava/lang/Throwable;",
        "setException",
        "exception",
        "Companion",
        "State",
        "workmanager_release"
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
.field public static final Companion:Lcom/tantanapp/sharelib/workmanager/WorkInfo$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final i:Lcom/tantanapp/sharelib/workmanager/WorkInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/util/UUID;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final e:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final f:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public g:Lcom/tantanapp/sharelib/workmanager/Constraints;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public h:Ljava/lang/Throwable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->Companion:Lcom/tantanapp/sharelib/workmanager/WorkInfo$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->i:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "EMPTY"

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    sget-object v3, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->IDLE:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 18
    .line 19
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Data;->Companion:Lcom/tantanapp/sharelib/workmanager/Data$Companion;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    new-instance v7, Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-direct {v7, v0}, Lcom/tantanapp/sharelib/workmanager/Constraints;-><init>(I)V

    .line 37
    .line 38
    .line 39
    move-object v0, p0

    .line 40
    invoke-direct/range {v0 .. v7}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;-><init>(Ljava/util/UUID;Ljava/util/Set;Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Constraints;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/Set;Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Constraints;)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Set;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lcom/tantanapp/sharelib/workmanager/Constraints;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
            "Lcom/tantanapp/sharelib/workmanager/Data;",
            "Lcom/tantanapp/sharelib/workmanager/Data;",
            "Lcom/tantanapp/sharelib/workmanager/Data;",
            "Lcom/tantanapp/sharelib/workmanager/Constraints;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    .line 46
    iput-object p2, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    .line 47
    iput-object p3, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 48
    iput-object p4, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 49
    iput-object p5, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 50
    iput-object p6, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 51
    iput-object p7, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    return-void
.end method


# virtual methods
.method public final a()Lcom/tantanapp/sharelib/workmanager/Constraints;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ljava/util/UUID;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Lcom/tantanapp/sharelib/workmanager/Data;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/lang/Throwable;)V
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->h:Ljava/lang/Throwable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->h:Ljava/lang/Throwable;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->h:Ljava/lang/Throwable;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void

    .line 22
    :cond_2
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->h:Ljava/lang/Throwable;

    .line 23
    .line 24
    return-void
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
    instance-of v1, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    iget-object v3, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    iget-object p1, p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    return v2

    :cond_8
    return v0
.end method

.method public final f(Lcom/tantanapp/sharelib/workmanager/Data;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Data;->e(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/Observable;->setChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/Observable;->clearChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h(Lcom/tantanapp/sharelib/workmanager/Data;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Data;->e(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public final i(Lcom/tantanapp/sharelib/workmanager/Data;)V
    .locals 1
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/Data;->e(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final j(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WorkInfo(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->b:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", input="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", output="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", progress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f:Lcom/tantanapp/sharelib/workmanager/Data;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", constraints="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->g:Lcom/tantanapp/sharelib/workmanager/Constraints;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
