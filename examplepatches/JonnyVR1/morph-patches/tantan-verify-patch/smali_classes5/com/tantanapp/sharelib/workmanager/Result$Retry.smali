.class public final Lcom/tantanapp/sharelib/workmanager/Result$Retry;
.super Lcom/tantanapp/sharelib/workmanager/Result;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharelib/workmanager/Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Retry"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Result$Retry;",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "output",
        "<init>",
        "(Lcom/tantanapp/sharelib/workmanager/Data;)V",
        "()V",
        "a",
        "()Lcom/tantanapp/sharelib/workmanager/Data;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
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


# instance fields
.field public final a:Lcom/tantanapp/sharelib/workmanager/Data;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Data;->Companion:Lcom/tantanapp/sharelib/workmanager/Data$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Companion;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Retry;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/sharelib/workmanager/Data;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    invoke-direct {p0}, Lcom/tantanapp/sharelib/workmanager/Result;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Result$Retry;->a:Lcom/tantanapp/sharelib/workmanager/Data;

    return-void
.end method


# virtual methods
.method public a()Lcom/tantanapp/sharelib/workmanager/Data;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Result$Retry;->a:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Retry { output = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Result$Retry;->a:Lcom/tantanapp/sharelib/workmanager/Data;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " }"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
