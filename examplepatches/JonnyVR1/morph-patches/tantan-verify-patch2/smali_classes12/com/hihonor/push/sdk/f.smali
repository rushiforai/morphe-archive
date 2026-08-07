.class public Lcom/hihonor/push/sdk/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/HonorPushCallback;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/hihonor/push/sdk/l;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/l;Lcom/hihonor/push/sdk/HonorPushCallback;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/f;->c:Lcom/hihonor/push/sdk/l;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hihonor/push/sdk/f;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/hihonor/push/sdk/f;->b:Z

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hihonor/push/sdk/f;->c:Lcom/hihonor/push/sdk/l;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/hihonor/push/sdk/l;->d:Lcom/hihonor/push/sdk/s;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hihonor/push/sdk/f;->a:Lcom/hihonor/push/sdk/HonorPushCallback;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/hihonor/push/sdk/f;->b:Z

    .line 8
    .line 9
    new-instance v2, Lcom/hihonor/push/sdk/m;

    .line 10
    .line 11
    invoke-direct {v2, v0, p0}, Lcom/hihonor/push/sdk/m;-><init>(Lcom/hihonor/push/sdk/s;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2, v1}, Lcom/hihonor/push/sdk/s;->a(Ljava/util/concurrent/Callable;Lcom/hihonor/push/sdk/HonorPushCallback;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
