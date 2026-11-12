.class public final synthetic Lhvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnwo;


# instance fields
.field public final synthetic a:Lnxo;

.field public final synthetic b:Landroid/view/TextureView;

.field public final synthetic c:Lbno;

.field public final synthetic d:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Lnxo;Landroid/view/TextureView;Lbno;Landroid/widget/FrameLayout;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhvo;->a:Lnxo;

    iput-object p2, p0, Lhvo;->b:Landroid/view/TextureView;

    iput-object p3, p0, Lhvo;->c:Lbno;

    iput-object p4, p0, Lhvo;->d:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lhvo;->a:Lnxo;

    iget-object v1, v0, Lnxo;->d:Lujo;

    iget-object v2, p0, Lhvo;->b:Landroid/view/TextureView;

    iget-object v3, p0, Lhvo;->c:Lbno;

    invoke-virtual {v2, v3}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_32

    iget-object v2, v1, Lujo;->e:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_32

    new-instance v2, Landroid/widget/ImageView;

    iget-object p0, p0, Lhvo;->d:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iget-object v1, v1, Lujo;->e:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    new-instance v1, Lmvo;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Lmvo;-><init>(Lnxo;B)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void

    :cond_32
    iget-object p0, v0, Lnxo;->j:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object p0, v0, Lnxo;->j:Landroid/widget/FrameLayout;

    new-instance v1, Lmvo;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lmvo;-><init>(Lnxo;B)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
