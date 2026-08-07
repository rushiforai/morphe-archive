.class public Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Data"
.end annotation


# instance fields
.field public bestFrame:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "BestFrame"
    .end annotation
.end field

.field public resultCode:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ResultCode"
    .end annotation
.end field

.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->this$0:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getBestFrame()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->bestFrame:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResultCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->resultCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBestFrame(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->bestFrame:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResultCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->resultCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
