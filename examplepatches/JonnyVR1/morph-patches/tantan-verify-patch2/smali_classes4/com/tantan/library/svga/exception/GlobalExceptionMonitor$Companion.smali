.class public final Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000f\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0000\u00a2\u0006\u0002\u0008\u0006J\u000e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nR\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;",
        "",
        "()V",
        "instance",
        "Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;",
        "get",
        "get$svga_lib_release",
        "register",
        "",
        "listener",
        "Lcom/tantan/library/svga/LoadResourceListener;",
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
    invoke-direct {p0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->access$getInstance$cp()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final register(Lcom/tantan/library/svga/LoadResourceListener;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/LoadResourceListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->access$getInstance$cp()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    new-instance p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;-><init>(Lcom/tantan/library/svga/LoadResourceListener;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->access$setInstance$cp(Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->access$getInstance$cp()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {p0, p1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->access$setListener$p(Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;Lcom/tantan/library/svga/LoadResourceListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
