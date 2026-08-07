.class Lcom/effectsar/labcv/effectsdk/BefC1Info$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/effectsar/labcv/effectsdk/BefC1Info;->topN(I)[Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/effectsar/labcv/effectsdk/BefC1Info;


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/BefC1Info;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefC1Info$1;->this$0:Lcom/effectsar/labcv/effectsdk/BefC1Info;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public compare(Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;)I
    .locals 0

    .line 1
    iget p0, p2, Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;->prob:F

    .line 2
    .line 3
    iget p1, p1, Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;->prob:F

    .line 4
    .line 5
    sub-float/2addr p0, p1

    .line 6
    const/4 p1, 0x0

    .line 7
    cmpl-float p2, p0, p1

    .line 8
    .line 9
    if-lez p2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    cmpg-float p0, p0, p1

    .line 14
    .line 15
    if-gez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 21
    check-cast p1, Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    check-cast p2, Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;

    invoke-virtual {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/BefC1Info$1;->compare(Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;Lcom/effectsar/labcv/effectsdk/BefC1Info$BefC1CategoryItem;)I

    move-result p0

    return p0
.end method
