.class public abstract Lcom/hihonor/push/sdk/f1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lcom/hihonor/push/sdk/n0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/hihonor/push/sdk/n0<",
            "TTResult;>;"
        }
    .end annotation
.end field

.field public final b:Ljava/lang/String;

.field public final c:Lcom/hihonor/push/framework/aidl/IMessageEntity;

.field public final d:Lcom/hihonor/push/sdk/w;

.field public e:Lcom/hihonor/push/framework/aidl/entity/RequestHeader;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/hihonor/push/framework/aidl/IMessageEntity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hihonor/push/sdk/f1;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/hihonor/push/sdk/f1;->c:Lcom/hihonor/push/framework/aidl/IMessageEntity;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/hihonor/push/sdk/w;->a(Ljava/lang/String;)Lcom/hihonor/push/sdk/w;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/hihonor/push/sdk/f1;->d:Lcom/hihonor/push/sdk/w;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public abstract a(Lcom/hihonor/push/sdk/common/data/ApiException;Ljava/lang/Object;)V
.end method

.method public final b(Lcom/hihonor/push/sdk/common/data/ApiException;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hihonor/push/sdk/f1;->a:Lcom/hihonor/push/sdk/n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/hihonor/push/sdk/f1;->a(Lcom/hihonor/push/sdk/common/data/ApiException;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
