.class public final Lcom/waze/gw/PhoneAlertPlacement;
.super Ljava/lang/Object;
.implements Lg/h/a/l;
.field private final child:Landroidx/compose/ui/layout/Placeable;
.field private final scale:F

.method public constructor <init>(Landroidx/compose/ui/layout/Placeable;F)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/waze/gw/PhoneAlertPlacement;->child:Landroidx/compose/ui/layout/Placeable;
    iput p2, p0, Lcom/waze/gw/PhoneAlertPlacement;->scale:F
    return-void
.end method

.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    instance-of v0, p1, Landroidx/compose/ui/graphics/GraphicsLayerScope;
    if-eqz v0, :place
    check-cast p1, Landroidx/compose/ui/graphics/GraphicsLayerScope;
    iget v0, p0, Lcom/waze/gw/PhoneAlertPlacement;->scale:F
    invoke-interface {p1, v0}, Landroidx/compose/ui/graphics/GraphicsLayerScope;->setScaleX(F)V
    invoke-interface {p1, v0}, Landroidx/compose/ui/graphics/GraphicsLayerScope;->setScaleY(F)V
    const-wide/16 v0, 0x0
    invoke-interface {p1, v0, v1}, Landroidx/compose/ui/graphics/GraphicsLayerScope;->setTransformOrigin-__ExYCQ(J)V
    goto :done
    :place
    move-object v0, p1
    check-cast v0, Landroidx/compose/ui/layout/Placeable$PlacementScope;
    iget-object v1, p0, Lcom/waze/gw/PhoneAlertPlacement;->child:Landroidx/compose/ui/layout/Placeable;
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    move-object v5, p0
    invoke-virtual/range {v0 .. v5}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeWithLayer(Landroidx/compose/ui/layout/Placeable;IIFLg/h/a/l;)V
    :done
    sget-object v0, Lg/ab;->a:Lg/ab;
    return-object v0
.end method
