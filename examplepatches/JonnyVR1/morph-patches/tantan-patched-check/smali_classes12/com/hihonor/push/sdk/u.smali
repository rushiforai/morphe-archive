.class public Lcom/hihonor/push/sdk/u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/HonorPushCallback;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/hihonor/push/sdk/u;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 2
    .line 3
    iput p3, p0, Lcom/hihonor/push/sdk/u;->b:I

    .line 4
    .line 5
    iput-object p4, p0, Lcom/hihonor/push/sdk/u;->c:Ljava/lang/String;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hihonor/push/sdk/u;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/hihonor/push/sdk/u;->b:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/hihonor/push/sdk/u;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/hihonor/push/sdk/HonorPushCallback;->onFailure(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
