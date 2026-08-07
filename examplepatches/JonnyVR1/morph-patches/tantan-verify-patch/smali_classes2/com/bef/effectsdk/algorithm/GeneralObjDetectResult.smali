.class public Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation


# static fields
.field public static final DETECT_FAIL:I = -0x1

.field public static final DETECT_SUCCESS:I


# instance fields
.field private obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

.field private obj_infos_data:Ljava/lang/String;

.field private obj_num:I

.field private res:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->res:I

    return-void
.end method

.method public constructor <init>(I[Lcom/bef/effectsdk/algorithm/ObjectInfo;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->res:I

    .line 16
    iput p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_num:I

    .line 17
    iput-object p2, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

    return-void
.end method

.method public constructor <init>(I[Lcom/bef/effectsdk/algorithm/ObjectInfo;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->res:I

    .line 6
    .line 7
    iput p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_num:I

    .line 8
    .line 9
    iput-object p2, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos_data:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public ObjectInfosData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos_data:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public getObjectInfos()[Lcom/bef/effectsdk/algorithm/ObjectInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getObjectInfosData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos_data:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getObjectNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_num:I

    .line 2
    .line 3
    return p0
.end method

.method public getResult()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->res:I

    .line 2
    .line 3
    return p0
.end method

.method public logData()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_num:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

    .line 7
    .line 8
    aget-object v1, v1, v0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/bef/effectsdk/algorithm/ObjectInfo;->logData()V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method public setObjectInfos([Lcom/bef/effectsdk/algorithm/ObjectInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_infos:[Lcom/bef/effectsdk/algorithm/ObjectInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setObjectNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->obj_num:I

    .line 2
    .line 3
    return-void
.end method

.method public setResult(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/algorithm/GeneralObjDetectResult;->res:I

    .line 2
    .line 3
    return-void
.end method
