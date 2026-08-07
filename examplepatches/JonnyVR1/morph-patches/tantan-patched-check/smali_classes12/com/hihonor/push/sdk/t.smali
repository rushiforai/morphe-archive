.class public Lcom/hihonor/push/sdk/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/HonorPushCallback;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/hihonor/push/sdk/t;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/hihonor/push/sdk/t;->b:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hihonor/push/sdk/t;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/hihonor/push/sdk/t;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/hihonor/push/sdk/HonorPushCallback;->onSuccess(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
