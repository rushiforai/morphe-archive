.class public Lcom/momo/mcamera/mask/bean/AbsolutePosition;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private center:Lcom/momo/mcamera/mask/bean/ObjectRegion;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "center"
    .end annotation
.end field

.field private viewport:Lcom/momo/mcamera/mask/bean/ViewPortProportion;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "viewport"
    .end annotation
.end field


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
.method public getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->center:Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewport()Lcom/momo/mcamera/mask/bean/ViewPortProportion;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->viewport:Lcom/momo/mcamera/mask/bean/ViewPortProportion;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCenter(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->center:Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 2
    .line 3
    return-void
.end method

.method public setViewport(Lcom/momo/mcamera/mask/bean/ViewPortProportion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->viewport:Lcom/momo/mcamera/mask/bean/ViewPortProportion;

    .line 2
    .line 3
    return-void
.end method
