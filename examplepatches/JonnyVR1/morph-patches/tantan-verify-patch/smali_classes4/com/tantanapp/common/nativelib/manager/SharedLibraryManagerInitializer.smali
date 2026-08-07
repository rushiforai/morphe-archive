.class public final Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003RM\u0010\u0010\u001a\'\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u00a2\u0006\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00048\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0018\n\u0004\u0008\n\u0010\u000b\u0012\u0004\u0008\u000f\u0010\u0003\u001a\u0004\u0008\n\u0010\u000c\"\u0004\u0008\r\u0010\u000e\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;",
        "",
        "<init>",
        "()V",
        "Lkotlin/Function1;",
        "Lkotlin/Function0;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "func",
        "a",
        "Lkotlin/jvm/functions/Function1;",
        "()Lkotlin/jvm/functions/Function1;",
        "setInstallNativeLibraryPathAction",
        "(Lkotlin/jvm/functions/Function1;)V",
        "getInstallNativeLibraryPathAction$annotations",
        "installNativeLibraryPathAction",
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


# static fields
.field public static final INSTANCE:Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static a:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;->INSTANCE:Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;

    .line 7
    .line 8
    sget-object v0, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer$installNativeLibraryPathAction$1;->INSTANCE:Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer$installNativeLibraryPathAction$1;

    .line 9
    .line 10
    sput-object v0, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;->a:Lkotlin/jvm/functions/Function1;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a()Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/nativelib/manager/SharedLibraryManagerInitializer;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object v0
.end method
