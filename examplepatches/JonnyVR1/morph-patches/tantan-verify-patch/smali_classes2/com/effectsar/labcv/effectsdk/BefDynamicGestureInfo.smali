.class public Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;
    }
.end annotation


# instance fields
.field private gestureInfos:[Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;

.field private gestureNum:I


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
.method public getGestureInfos()[Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo;->gestureInfos:[Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGestureNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo;->gestureNum:I

    .line 2
    .line 3
    return p0
.end method

.method public setGestureInfos([Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo;->gestureInfos:[Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo$GestureInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setGestureNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicGestureInfo;->gestureNum:I

    .line 2
    .line 3
    return-void
.end method
