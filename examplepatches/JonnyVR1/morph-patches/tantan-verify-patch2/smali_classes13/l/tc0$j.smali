.class Ll/tc0$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->z6(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$j;->b:Ll/tc0;

    .line 2
    .line 3
    iput p2, p0, Ll/tc0$j;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0$j;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Ll/tc0$j;->a:I

    .line 8
    .line 9
    int-to-long v1, p0

    .line 10
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, v1, v2, p0}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tc0$j;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tc0;->j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p0, p0, Ll/tc0$j;->a:I

    .line 8
    .line 9
    int-to-long v0, p0

    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p1, v0, v1, p0}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
