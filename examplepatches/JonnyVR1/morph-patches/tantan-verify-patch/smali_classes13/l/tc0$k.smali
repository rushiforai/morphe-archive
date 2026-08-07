.class Ll/tc0$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gkl0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->j8(I)V
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
    iput-object p1, p0, Ll/tc0$k;->b:Ll/tc0;

    .line 2
    .line 3
    iput p2, p0, Ll/tc0$k;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0$k;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->A3(Ll/tc0;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/tc0$k;->b:Ll/tc0;

    .line 8
    .line 9
    invoke-static {v1}, Ll/tc0;->B3(Ll/tc0;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tc0$k;->b:Ll/tc0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/tc0;->j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget p0, p0, Ll/tc0$k;->a:I

    .line 23
    .line 24
    int-to-long v1, p0

    .line 25
    new-instance p0, Landroid/view/Surface;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, p0}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
