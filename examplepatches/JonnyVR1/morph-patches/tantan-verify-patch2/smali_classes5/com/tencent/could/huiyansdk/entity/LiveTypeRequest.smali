.class public Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public imei:Ljava/lang/String;

.field public platform:I

.field public selectData:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "select_data"
    .end annotation
.end field

.field public turingFaceData:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->platform:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->selectData:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->imei:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->turingFaceData:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getImei()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->imei:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlatform()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->platform:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->selectData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTuringFaceData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->turingFaceData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setImei(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->imei:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlatform(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->platform:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelectData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->selectData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTuringFaceData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeRequest;->turingFaceData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
