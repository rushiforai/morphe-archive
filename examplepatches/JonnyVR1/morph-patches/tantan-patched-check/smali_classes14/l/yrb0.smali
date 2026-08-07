.class public final synthetic Ll/yrb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/fsb0;

.field public final synthetic b:Lcom/facebook/drawee/view/DraweeView;

.field public final synthetic c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public synthetic constructor <init>(Ll/fsb0;Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yrb0;->a:Ll/fsb0;

    iput-object p2, p0, Ll/yrb0;->b:Lcom/facebook/drawee/view/DraweeView;

    iput-object p3, p0, Ll/yrb0;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iput-object p4, p0, Ll/yrb0;->d:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yrb0;->a:Ll/fsb0;

    iget-object v1, p0, Ll/yrb0;->b:Lcom/facebook/drawee/view/DraweeView;

    iget-object v2, p0, Ll/yrb0;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iget-object v3, p0, Ll/yrb0;->d:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    move-object v5, p2

    check-cast v5, Ll/qim;

    move-object v6, p3

    check-cast v6, Landroid/graphics/drawable/Animatable;

    invoke-static/range {v0 .. v6}, Ll/fsb0;->x(Ll/fsb0;Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    return-void
.end method
