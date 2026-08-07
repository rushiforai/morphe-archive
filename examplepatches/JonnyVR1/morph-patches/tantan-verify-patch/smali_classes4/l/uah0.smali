.class public final synthetic Ll/uah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uah0;->a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    iput p2, p0, Ll/uah0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uah0;->a:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    iget p0, p0, Ll/uah0;->b:I

    invoke-static {v0, p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->d(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;I)V

    return-void
.end method
