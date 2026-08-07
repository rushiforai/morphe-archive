.class public Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;,
        Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicActionInfo;
    }
.end annotation


# instance fields
.field private personCount:I

.field private persons:[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicActionInfo;

.field private skInfos:[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getPersonCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo;->personCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getPersons()[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicActionInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo;->persons:[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicActionInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSkInfos()[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo;->skInfos:[Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;

    .line 2
    .line 3
    return-object p0
.end method
