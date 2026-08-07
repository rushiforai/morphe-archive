.class public final synthetic Ll/fah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fah0;->a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fah0;->a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    invoke-static {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->e(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    return-void
.end method
