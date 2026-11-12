.class public final Lcom/leanplum/LeanplumMessageDisplayControllers;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\n\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0007J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0004H\u0007R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/leanplum/LeanplumMessageDisplayControllers;",
        "",
        "()V",
        "displayController",
        "Lcom/leanplum/MessageDisplayController;",
        "getMessageDisplayController",
        "setMessageDisplayController",
        "",
        "messageDisplayController",
        "AndroidSDKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/leanplum/LeanplumMessageDisplayControllers;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static displayController:Lcom/leanplum/MessageDisplayController;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/LeanplumMessageDisplayControllers;

    invoke-direct {v0}, Lcom/leanplum/LeanplumMessageDisplayControllers;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumMessageDisplayControllers;->INSTANCE:Lcom/leanplum/LeanplumMessageDisplayControllers;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getMessageDisplayController()Lcom/leanplum/MessageDisplayController;
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumMessageDisplayControllers;->displayController:Lcom/leanplum/MessageDisplayController;

    return-object v0
.end method

.method public static final setMessageDisplayController(Lcom/leanplum/MessageDisplayController;)V
    .registers 1
    .param p0    # Lcom/leanplum/MessageDisplayController;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    sput-object p0, Lcom/leanplum/LeanplumMessageDisplayControllers;->displayController:Lcom/leanplum/MessageDisplayController;

    return-void
.end method
