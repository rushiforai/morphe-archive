.class public final Ll/r3f0;
.super Ll/n3f0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r3f0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 \u001a2\u00020\u0001:\u0001\u0006B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0011\u001a\u00020\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010R\u0016\u0010\u0015\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0016\u0010\u0017\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0014R\u0016\u0010\u0019\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0014\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/r3f0;",
        "Ll/n3f0;",
        "<init>",
        "()V",
        "Lkotlin/Function0;",
        "",
        "a",
        "()Lkotlin/jvm/functions/Function0;",
        "Ll/eyl;",
        "g",
        "()Ll/eyl;",
        "Ll/sv5;",
        "h",
        "()Ll/sv5;",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "p",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "assetsReaderOutput",
        "Ljava/util/Observer;",
        "q",
        "Ljava/util/Observer;",
        "initializerObserver",
        "r",
        "loaderObserver",
        "s",
        "innerObServer",
        "Companion",
        "sharedlibrarymanager_release"
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
.field public static final Companion:Ll/r3f0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static volatile INSTANCE:Ll/r3f0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# instance fields
.field public final p:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public q:Ljava/util/Observer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public r:Ljava/util/Observer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public s:Ljava/util/Observer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/r3f0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/r3f0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/r3f0;->Companion:Ll/r3f0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/n3f0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Data;->Companion:Lcom/tantanapp/sharelib/workmanager/Data$Companion;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/r3f0;->p:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 11
    .line 12
    new-instance v0, Ll/o3f0;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/o3f0;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/r3f0;->q:Ljava/util/Observer;

    .line 18
    .line 19
    new-instance v0, Ll/p3f0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/p3f0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/r3f0;->r:Ljava/util/Observer;

    .line 25
    .line 26
    new-instance v0, Ll/q3f0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/q3f0;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/r3f0;->s:Ljava/util/Observer;

    .line 32
    .line 33
    return-void
.end method

.method public static b(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static d(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static final synthetic e()Ll/r3f0;
    .locals 1

    .line 1
    sget-object v0, Ll/r3f0;->INSTANCE:Ll/r3f0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic f(Ll/r3f0;)V
    .locals 0

    .line 1
    sput-object p0, Ll/r3f0;->INSTANCE:Ll/r3f0;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public a()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "config"

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    throw p0
.end method

.method public final g()Ll/eyl;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "config"

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    throw p0
.end method

.method public final h()Ll/sv5;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "config"

    .line 2
    .line 3
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method
