.class public final synthetic Ll/hi50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

.field public final synthetic b:Lcom/p1/mobile/putong/data/OMSDialog;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hi50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iput-object p2, p0, Ll/hi50;->b:Lcom/p1/mobile/putong/data/OMSDialog;

    iput p3, p0, Ll/hi50;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hi50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iget-object v1, p0, Ll/hi50;->b:Lcom/p1/mobile/putong/data/OMSDialog;

    iget p0, p0, Ll/hi50;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;ILandroid/view/View;)V

    return-void
.end method
