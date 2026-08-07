.class public abstract Lcom/tantanapp/sharelib/workmanager/Result;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharelib/workmanager/Result$Companion;,
        Lcom/tantanapp/sharelib/workmanager/Result$Success;,
        Lcom/tantanapp/sharelib/workmanager/Result$Failure;,
        Lcom/tantanapp/sharelib/workmanager/Result$Retry;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008&\u0018\u0000 \u00072\u00020\u0001:\u0004\u0007\u0008\t\nB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H&\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "a",
        "()Lcom/tantanapp/sharelib/workmanager/Data;",
        "Companion",
        "Failure",
        "Retry",
        "Success",
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
.field public static final Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

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


# virtual methods
.method public abstract a()Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method
