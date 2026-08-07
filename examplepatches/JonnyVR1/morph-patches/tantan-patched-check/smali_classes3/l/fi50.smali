.class public final synthetic Ll/fi50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

.field public final synthetic b:Lcom/p1/mobile/putong/data/OMSDialog;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fi50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iput-object p2, p0, Ll/fi50;->b:Lcom/p1/mobile/putong/data/OMSDialog;

    iput-object p3, p0, Ll/fi50;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fi50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iget-object v1, p0, Ll/fi50;->b:Lcom/p1/mobile/putong/data/OMSDialog;

    iget-object p0, p0, Ll/fi50;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->j(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method
