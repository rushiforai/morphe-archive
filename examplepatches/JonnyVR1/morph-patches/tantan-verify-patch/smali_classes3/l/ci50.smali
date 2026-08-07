.class public final synthetic Ll/ci50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/data/OMSDialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ci50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iput-object p2, p0, Ll/ci50;->b:Landroid/view/View;

    iput-object p3, p0, Ll/ci50;->c:Lcom/p1/mobile/putong/data/OMSDialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ci50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iget-object v1, p0, Ll/ci50;->b:Landroid/view/View;

    iget-object p0, p0, Ll/ci50;->c:Lcom/p1/mobile/putong/data/OMSDialog;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->h(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/graphics/Bitmap;)V

    return-void
.end method
