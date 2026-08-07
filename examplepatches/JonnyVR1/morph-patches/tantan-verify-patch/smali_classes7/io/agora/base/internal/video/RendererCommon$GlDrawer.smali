.class public interface abstract Lio/agora/base/internal/video/RendererCommon$GlDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/RendererCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GlDrawer"
.end annotation


# virtual methods
.method public abstract drawAlpha(I[FIIIIII)V
.end method

.method public abstract drawAlphaStitchGraph([II[FIIIIIILio/agora/base/VideoFrame$ColorSpace;II)V
.end method

.method public abstract drawOes(II[FIIIIIII)V
.end method

.method public abstract drawOes(II[FIIIIIIII)V
.end method

.method public abstract drawRgb(II[FIIIIIII)V
.end method

.method public abstract drawRgb(II[FIIIIIIII)V
.end method

.method public abstract drawRgb(II[FIIIIIIZII)V
.end method

.method public abstract drawRgb(I[FIIIIII)V
.end method

.method public abstract drawYuv([II[FIIIIIII)V
.end method

.method public abstract drawYuv([II[FIIIIIILio/agora/base/VideoFrame$ColorSpace;I)V
.end method

.method public abstract release()V
.end method

.method public abstract setLut10Texture([B)V
.end method

.method public abstract setTextureCropCoord(Ljava/nio/FloatBuffer;)V
.end method
