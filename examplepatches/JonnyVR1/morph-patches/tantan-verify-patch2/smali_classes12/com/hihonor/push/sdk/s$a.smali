.class public Lcom/hihonor/push/sdk/s$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hihonor/push/sdk/s;->a(Ljava/util/concurrent/Callable;Lcom/hihonor/push/sdk/HonorPushCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/Callable;

.field public final synthetic b:Lcom/hihonor/push/sdk/HonorPushCallback;

.field public final synthetic c:Lcom/hihonor/push/sdk/s;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/s;Ljava/util/concurrent/Callable;Lcom/hihonor/push/sdk/HonorPushCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/s$a;->c:Lcom/hihonor/push/sdk/s;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hihonor/push/sdk/s$a;->a:Ljava/util/concurrent/Callable;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hihonor/push/sdk/s$a;->b:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/hihonor/push/sdk/s$a;->a:Ljava/util/concurrent/Callable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/hihonor/push/sdk/s$a;->c:Lcom/hihonor/push/sdk/s;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/hihonor/push/sdk/s$a;->b:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v3, Lcom/hihonor/push/sdk/t;

    .line 15
    .line 16
    invoke-direct {v3, v1, v2, v0}, Lcom/hihonor/push/sdk/t;-><init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v3}, Lcom/hihonor/push/sdk/b1;->a(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lcom/hihonor/push/sdk/common/data/ApiException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception v0

    .line 24
    goto :goto_0

    .line 25
    :catch_1
    iget-object v0, p0, Lcom/hihonor/push/sdk/s$a;->c:Lcom/hihonor/push/sdk/s;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/hihonor/push/sdk/s$a;->b:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 28
    .line 29
    sget-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_INTERNAL_ERROR:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getErrorCode()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v1}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getMessage()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v0, p0, v2, v1}, Lcom/hihonor/push/sdk/s;->a(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :goto_0
    iget-object v1, p0, Lcom/hihonor/push/sdk/s$a;->c:Lcom/hihonor/push/sdk/s;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/hihonor/push/sdk/s$a;->b:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/common/data/ApiException;->getErrorCode()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/common/data/ApiException;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v1, p0, v2, v0}, Lcom/hihonor/push/sdk/s;->a(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    return-void
.end method
