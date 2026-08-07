.class public final Lcom/tantanapp/sharelib/workmanager/Data$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharelib/workmanager/Data;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Data$Companion;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "a",
        "()Lcom/tantanapp/sharelib/workmanager/Data;",
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
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lcom/tantanapp/sharelib/workmanager/Data;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
