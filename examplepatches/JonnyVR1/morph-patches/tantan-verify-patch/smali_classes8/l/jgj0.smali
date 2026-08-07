.class public abstract Ll/jgj0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static FILTER_BOTTOM_TO_TOP_INDEX:I = 0x7

.field public static FILTER_DIFFUSION_INDEX:I = 0x5

.field public static FILTER_RIGHT_TO_LEFT_INDEX:I = 0x6


# instance fields
.field protected processErrorListener:Ll/jk90;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public getVideoProcessFilter()Ll/jt2;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract lockCoverFrame(Landroid/graphics/Bitmap;Ll/k6j$a;)V
.end method

.method public lockFrame(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method

.method public resetInternalStatusInEglThread()V
    .locals 0

    .line 1
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setProcessErrorListener(Ll/jk90;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setTransFieldFilterListener(Ll/ap50;)V
    .locals 0

    .line 1
    return-void
.end method

.method public startPostWatermark(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public startPreWatermark(Z)V
    .locals 0

    .line 1
    return-void
.end method
