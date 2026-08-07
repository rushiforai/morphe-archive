.class public final Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharelib/workmanager/Worker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u000e\u001a\u00020\u00002\u0006\u0010\u0005\u001a\u00020\u0006J\u000e\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\nJ\u000e\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\rJ#\u0010\u0013\u001a\u0002H\u0014\"\u0008\u0008\u0000\u0010\u0014*\u00020\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u0017\u00a2\u0006\u0002\u0010\u0018J\u000e\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Worker$Builder;",
        "",
        "appContext",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "constraints",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "id",
        "Ljava/util/UUID;",
        "inputData",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "tags",
        "",
        "",
        "addConstraints",
        "addInputData",
        "data",
        "addTag",
        "tag",
        "from",
        "T",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "kClass",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;)Lcom/tantanapp/sharelib/workmanager/Worker;",
        "setID",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final appContext:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private constraints:Lcom/tantanapp/sharelib/workmanager/Constraints;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private id:Ljava/util/UUID;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private inputData:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private tags:Ljava/util/Set;
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


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->appContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->id:Ljava/util/UUID;

    .line 17
    .line 18
    sget-object p1, Lcom/tantanapp/sharelib/workmanager/Data;->Companion:Lcom/tantanapp/sharelib/workmanager/Data$Companion;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->inputData:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 25
    .line 26
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->tags:Ljava/util/Set;

    .line 32
    .line 33
    new-instance p1, Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-direct {p1, v0}, Lcom/tantanapp/sharelib/workmanager/Constraints;-><init>(I)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->constraints:Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final addConstraints(Lcom/tantanapp/sharelib/workmanager/Constraints;)Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Constraints;
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
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->constraints:Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 5
    .line 6
    return-object p0
.end method

.method public final addInputData(Lcom/tantanapp/sharelib/workmanager/Data;)Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
    .locals 1
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
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
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->inputData:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/Data;->e(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final addTag(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
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
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->tags:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final from(Ljava/lang/Class;)Lcom/tantanapp/sharelib/workmanager/Worker;
    .locals 9
    .param p1    # Ljava/lang/Class;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/sharelib/workmanager/Worker;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-class v0, Landroid/content/Context;

    .line 5
    .line 6
    const-class v1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 7
    .line 8
    filled-new-array {v0, v1}, [Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->appContext:Landroid/content/Context;

    .line 17
    .line 18
    new-instance v1, Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->id:Ljava/util/UUID;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->tags:Ljava/util/Set;

    .line 23
    .line 24
    sget-object v4, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->IDLE:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 25
    .line 26
    iget-object v5, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->inputData:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 27
    .line 28
    sget-object v6, Lcom/tantanapp/sharelib/workmanager/Data;->Companion:Lcom/tantanapp/sharelib/workmanager/Data$Companion;

    .line 29
    .line 30
    move-object v7, v6

    .line 31
    invoke-virtual {v7}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v7}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    iget-object v8, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->constraints:Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 40
    .line 41
    invoke-direct/range {v1 .. v8}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;-><init>(Ljava/util/UUID;Ljava/util/Set;Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Data;Lcom/tantanapp/sharelib/workmanager/Constraints;)V

    .line 42
    .line 43
    .line 44
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    check-cast p0, Lcom/tantanapp/sharelib/workmanager/Worker;

    .line 56
    .line 57
    return-object p0
.end method

.method public final setID(Ljava/util/UUID;)Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
    .locals 0
    .param p1    # Ljava/util/UUID;
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
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker$Builder;->id:Ljava/util/UUID;

    .line 5
    .line 6
    return-object p0
.end method
