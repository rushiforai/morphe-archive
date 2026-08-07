.class public final synthetic Ll/zh50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zh50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iput-object p2, p0, Ll/zh50;->b:Landroid/view/View;

    iput-object p3, p0, Ll/zh50;->c:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zh50;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    iget-object v1, p0, Ll/zh50;->b:Landroid/view/View;

    iget-object p0, p0, Ll/zh50;->c:Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Landroid/graphics/Bitmap;)V

    return-void
.end method
