.class Lcom/immomo/moment/mediautils/m$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/m;->y(Landroid/graphics/SurfaceTexture;ILandroid/view/Surface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/m;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m$a;->a:Lcom/immomo/moment/mediautils/m;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m$a;->a:Lcom/immomo/moment/mediautils/m;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/m$e;->f(Landroid/graphics/SurfaceTexture;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
