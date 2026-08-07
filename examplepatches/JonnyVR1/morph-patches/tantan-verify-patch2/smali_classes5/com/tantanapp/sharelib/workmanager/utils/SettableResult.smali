.class public final Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0006\u001a\u00020\u00002\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eR$\u0010\u0014\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R\"\u0010\t\u001a\u00020\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0015\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "",
        "<init>",
        "()V",
        "",
        "t",
        "c",
        "(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "result",
        "d",
        "(Lcom/tantanapp/sharelib/workmanager/Result;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "a",
        "()Lcom/tantanapp/sharelib/workmanager/Data;",
        "Ljava/lang/Throwable;",
        "getException",
        "()Ljava/lang/Throwable;",
        "setException",
        "(Ljava/lang/Throwable;)V",
        "exception",
        "b",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "()Lcom/tantanapp/sharelib/workmanager/Result;",
        "setResult",
        "(Lcom/tantanapp/sharelib/workmanager/Result;)V",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Ljava/lang/Throwable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Lcom/tantanapp/sharelib/workmanager/Result;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->Companion:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b:Lcom/tantanapp/sharelib/workmanager/Result;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lcom/tantanapp/sharelib/workmanager/Data;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b:Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Result;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final b()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b:Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->a:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Lcom/tantanapp/sharelib/workmanager/Result;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Result;
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
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b:Lcom/tantanapp/sharelib/workmanager/Result;

    .line 5
    .line 6
    return-object p0
.end method
