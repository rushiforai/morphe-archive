.class public final Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/LoadResourceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016R\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;",
        "Lcom/tantan/library/svga/LoadResourceListener;",
        "listener",
        "(Lcom/tantan/library/svga/LoadResourceListener;)V",
        "onFailed",
        "",
        "path",
        "",
        "e",
        "Lcom/tantan/library/svga/exception/SVGAException;",
        "onSuccess",
        "Companion",
        "svga_lib_release"
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
.field public static final Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static instance:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# instance fields
.field private listener:Lcom/tantan/library/svga/LoadResourceListener;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    return-void
.end method

.method private constructor <init>(Lcom/tantan/library/svga/LoadResourceListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/LoadResourceListener;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;-><init>(Lcom/tantan/library/svga/LoadResourceListener;)V

    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->instance:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->instance:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setListener$p(Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;Lcom/tantan/library/svga/LoadResourceListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    iget-object p0, p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/LoadResourceListener;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/tantan/library/svga/LoadResourceListener;->onSuccess(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
