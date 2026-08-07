.class public Lcom/effectsar/labcv/effectsdk/BefC1Info;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;
    }
.end annotation


# instance fields
.field items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;


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
.method public getItems()[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info;->items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public setItems([Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info;->items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefC1Info{items="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info;->items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x7d

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public topN(I)[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info;->items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 2
    .line 3
    new-instance v1, Lcom/effectsar/labcv/effectsdk/BefC1Info$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/effectsar/labcv/effectsdk/BefC1Info$1;-><init>(Lcom/effectsar/labcv/effectsdk/BefC1Info;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    if-ge v2, p1, :cond_0

    .line 19
    .line 20
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info;->items:[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 21
    .line 22
    aget-object v3, v3, v2

    .line 23
    .line 24
    iget-boolean v4, v3, Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;->satisfied:Z

    .line 25
    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-array p0, v1, [Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 35
    .line 36
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, [Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    .line 41
    .line 42
    return-object p0
.end method
