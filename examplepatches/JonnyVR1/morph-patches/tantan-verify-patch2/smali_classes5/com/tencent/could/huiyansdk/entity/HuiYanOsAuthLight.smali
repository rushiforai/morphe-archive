.class public Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;
    }
.end annotation


# instance fields
.field public code:I

.field public data:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;

.field public message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->code:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->data:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->code:I

    .line 2
    .line 3
    return-void
.end method

.method public setData(Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->data:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;

    .line 2
    .line 3
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
