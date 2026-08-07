.class public interface abstract Lcom/bytedance/realx/video/RendererCommon$GlDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/RendererCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GlDrawer"
.end annotation


# virtual methods
.method public abstract drawOes(I[FIIIIII)V
.end method

.method public abstract drawOes(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
.end method

.method public abstract drawRgb(I[FIIIIII)V
.end method

.method public abstract drawRgb(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
.end method

.method public abstract drawYuv([I[FIIIIII)V
.end method

.method public abstract drawYuv([I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
.end method

.method public abstract release()V
.end method
