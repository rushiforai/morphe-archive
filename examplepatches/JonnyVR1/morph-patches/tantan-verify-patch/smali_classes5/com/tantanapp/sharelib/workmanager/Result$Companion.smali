.class public final Lcom/tantanapp/sharelib/workmanager/Result$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharelib/workmanager/Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Result$Companion;",
        "",
        "<init>",
        "()V",
        "",
        "msg",
        "Lcom/tantanapp/sharelib/workmanager/Result$Failure;",
        "a",
        "(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;",
        "",
        "err",
        "b",
        "(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;",
        "Lcom/tantanapp/sharelib/workmanager/Result$Success;",
        "d",
        "()Lcom/tantanapp/sharelib/workmanager/Result$Success;",
        "Lcom/tantanapp/sharelib/workmanager/Result$Retry;",
        "c",
        "()Lcom/tantanapp/sharelib/workmanager/Result$Retry;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;
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
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/Exception;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Failure;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final b(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;
    .locals 0
    .param p1    # Ljava/lang/Throwable;
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
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Result$Failure;-><init>(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final c()Lcom/tantanapp/sharelib/workmanager/Result$Retry;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Retry;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Retry;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final d()Lcom/tantanapp/sharelib/workmanager/Result$Success;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
