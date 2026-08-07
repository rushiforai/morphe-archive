.class public final synthetic Ll/fce;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/fce;->a:F

    iput p2, p0, Ll/fce;->b:F

    iput p3, p0, Ll/fce;->c:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/fce;->a:F

    iget v1, p0, Ll/fce;->b:F

    iget p0, p0, Ll/fce;->c:F

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a(FFFLcom/p1/mobile/putong/live/base/data/BLivePosition;)V

    return-void
.end method
