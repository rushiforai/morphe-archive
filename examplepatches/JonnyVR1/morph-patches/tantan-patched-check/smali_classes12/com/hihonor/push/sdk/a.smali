.class public Lcom/hihonor/push/sdk/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/sdk/k0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/hihonor/push/sdk/k0<",
        "Lcom/hihonor/push/sdk/HonorPushDataMsg;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/HonorMessageService;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/HonorMessageService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/a;->a:Lcom/hihonor/push/sdk/HonorMessageService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/hihonor/push/sdk/a1;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->c()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/hihonor/push/sdk/HonorPushDataMsg;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/HonorPushDataMsg;->getMsgId()J

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/hihonor/push/sdk/a;->a:Lcom/hihonor/push/sdk/HonorMessageService;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/HonorMessageService;->onMessageReceived(Lcom/hihonor/push/sdk/HonorPushDataMsg;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/a1;->b()Ljava/lang/Exception;

    .line 25
    .line 26
    .line 27
    return-void
.end method
