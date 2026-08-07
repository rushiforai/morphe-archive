.class public final Lcom/tantanapp/sharelib/workmanager/Configuration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharelib/workmanager/Configuration$Builder;,
        Lcom/tantanapp/sharelib/workmanager/Configuration$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Configuration;",
        "",
        "Companion",
        "Builder",
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
.field public static final Companion:Lcom/tantanapp/sharelib/workmanager/Configuration$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Configuration$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/Configuration$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantanapp/sharelib/workmanager/Configuration;->Companion:Lcom/tantanapp/sharelib/workmanager/Configuration$Companion;

    return-void
.end method
