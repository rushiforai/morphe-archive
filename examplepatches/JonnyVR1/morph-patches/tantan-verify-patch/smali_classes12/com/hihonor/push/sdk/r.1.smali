.class public Lcom/hihonor/push/sdk/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/sdk/k0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/hihonor/push/sdk/k0<",
        "Ljava/util/List<",
        "Lcom/hihonor/push/sdk/HonorPushDataMsg;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/HonorPushCallback;

.field public final synthetic b:Lcom/hihonor/push/sdk/s;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/r;->b:Lcom/hihonor/push/sdk/s;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hihonor/push/sdk/r;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/hihonor/push/sdk/a1;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hihonor/push/sdk/a1;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/hihonor/push/sdk/r;->b:Lcom/hihonor/push/sdk/s;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hihonor/push/sdk/r;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->c()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/hihonor/push/sdk/t;

    .line 19
    .line 20
    invoke-direct {v1, v0, p0, p1}, Lcom/hihonor/push/sdk/t;-><init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Lcom/hihonor/push/sdk/b1;->a(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->b()Ljava/lang/Exception;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/hihonor/push/sdk/r;->b:Lcom/hihonor/push/sdk/s;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/hihonor/push/sdk/r;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/4 v1, -0x1

    .line 40
    invoke-static {v0, p0, v1, p1}, Lcom/hihonor/push/sdk/s;->a(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
