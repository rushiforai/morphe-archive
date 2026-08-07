.class public final synthetic Ll/jti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

.field public final synthetic b:Landroid/view/TextureView;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Landroid/view/TextureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jti0;->a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    iput-object p2, p0, Ll/jti0;->b:Landroid/view/TextureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jti0;->a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    iget-object p0, p0, Ll/jti0;->b:Landroid/view/TextureView;

    invoke-static {v0, p0}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->i(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Landroid/view/TextureView;)V

    return-void
.end method
