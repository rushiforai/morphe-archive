.class public Lcom/samsung/android/app/sdk/deepsky/barcode/result/Barcode;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Rect;[Landroid/graphics/Point;Lcom/samsung/android/app/sdk/deepsky/barcode/result/ActionUIResource;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public getPoly()[Landroid/graphics/Point;
    .locals 2
    const/4 v0, 0x0
    return-object v0
.end method

.method public getUiResource()Lcom/samsung/android/app/sdk/deepsky/barcode/result/ActionUIResource;
    .locals 2
    new-instance v0, Lcom/samsung/android/app/sdk/deepsky/barcode/result/ActionUIResource;
    invoke-direct {v0}, Lcom/samsung/android/app/sdk/deepsky/barcode/result/ActionUIResource;-><init>()V
    return-object v0
.end method

