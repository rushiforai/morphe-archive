.class public Lorg/chromium/content/common/SurfaceWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lorg/chromium/content/common/SurfaceWrapper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Z

.field public b:Landroid/view/Surface;

.field public final c:Z

.field public d:Landroid/view/SurfaceControl;

.field public final e:Landroid/window/InputTransferToken;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ll7k;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ll7k;-><init>(B)V

    sput-object v0, Lorg/chromium/content/common/SurfaceWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;Z)V
    .registers 4

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->a:Z

    .line 21
    iput-object p1, p0, Lorg/chromium/content/common/SurfaceWrapper;->b:Landroid/view/Surface;

    .line 22
    iput-boolean p2, p0, Lorg/chromium/content/common/SurfaceWrapper;->c:Z

    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lorg/chromium/content/common/SurfaceWrapper;->d:Landroid/view/SurfaceControl;

    .line 24
    iput-object p1, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;ZLandroid/window/InputTransferToken;)V
    .registers 4

    .line 17
    invoke-direct {p0, p1, p2}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/Surface;Z)V

    .line 18
    iput-object p3, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceControl;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->a:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->b:Landroid/view/Surface;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/content/common/SurfaceWrapper;->c:Z

    iput-object p1, p0, Lorg/chromium/content/common/SurfaceWrapper;->d:Landroid/view/SurfaceControl;

    iput-object v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    return-void
.end method

.method public static a(Landroid/os/Parcel;)Landroid/window/InputTransferToken;
    .registers 2

    invoke-static {}, Lpza;->d()Landroid/os/Parcelable$Creator;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lpza;->g(Ljava/lang/Object;)Landroid/window/InputTransferToken;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/view/Surface;Z)Lorg/chromium/content/common/SurfaceWrapper;
    .registers 3

    .line 6
    new-instance v0, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {v0, p0, p1}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/Surface;Z)V

    return-object v0
.end method

.method public static create(Landroid/view/Surface;ZLandroid/window/InputTransferToken;)Lorg/chromium/content/common/SurfaceWrapper;
    .registers 4

    new-instance v0, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {v0, p0, p1, p2}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/Surface;ZLandroid/window/InputTransferToken;)V

    return-object v0
.end method

.method public static createFromSurfaceControl(Landroid/view/SurfaceControl;)Lorg/chromium/content/common/SurfaceWrapper;
    .registers 2

    new-instance v0, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {v0, p0}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/SurfaceControl;)V

    return-object v0
.end method


# virtual methods
.method public final canBeUsedWithSurfaceControl()Z
    .registers 1

    iget-boolean p0, p0, Lorg/chromium/content/common/SurfaceWrapper;->c:Z

    return p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getBrowserInputToken()Landroid/window/InputTransferToken;
    .registers 1

    iget-object p0, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    return-object p0
.end method

.method public final getWrapsSurface()Z
    .registers 1

    iget-boolean p0, p0, Lorg/chromium/content/common/SurfaceWrapper;->a:Z

    return p0
.end method

.method public final takeSurface()Landroid/view/Surface;
    .registers 3

    iget-object v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->b:Landroid/view/Surface;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/content/common/SurfaceWrapper;->b:Landroid/view/Surface;

    return-object v0
.end method

.method public final takeSurfaceControl()Landroid/view/SurfaceControl;
    .registers 3

    iget-object v0, p0, Lorg/chromium/content/common/SurfaceWrapper;->d:Landroid/view/SurfaceControl;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/content/common/SurfaceWrapper;->d:Landroid/view/SurfaceControl;

    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    iget-boolean p2, p0, Lorg/chromium/content/common/SurfaceWrapper;->a:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x0

    if-eqz p2, :cond_24

    iget-object p2, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    if-eqz p2, :cond_e

    const/4 p2, 0x1

    goto :goto_f

    :cond_e
    move p2, v0

    :goto_f
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Lorg/chromium/content/common/SurfaceWrapper;->b:Landroid/view/Surface;

    invoke-virtual {v1, p1, v0}, Landroid/view/Surface;->writeToParcel(Landroid/os/Parcel;I)V

    iget-boolean v1, p0, Lorg/chromium/content/common/SurfaceWrapper;->c:Z

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    if-eqz p2, :cond_23

    iget-object p0, p0, Lorg/chromium/content/common/SurfaceWrapper;->e:Landroid/window/InputTransferToken;

    invoke-virtual {p0, p1, v0}, Landroid/window/InputTransferToken;->writeToParcel(Landroid/os/Parcel;I)V

    :cond_23
    return-void

    :cond_24
    iget-object p0, p0, Lorg/chromium/content/common/SurfaceWrapper;->d:Landroid/view/SurfaceControl;

    invoke-virtual {p0, p1, v0}, Landroid/view/SurfaceControl;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
