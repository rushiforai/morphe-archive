.class public interface abstract Lcom/ss/bytertc/engine/video/IVideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addRef()V
.end method

.method public abstract bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;
.end method

.method public abstract cameraId()Lcom/ss/bytertc/engine/data/CameraId;
.end method

.method public abstract contentType()Lcom/ss/bytertc/engine/data/VideoContentType;
.end method

.method public abstract eglContext()Landroid/opengl/EGLContext;
.end method

.method public abstract fovTileInfo()Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;
.end method

.method public abstract height()I
.end method

.method public abstract numberOfPlanes()I
.end method

.method public abstract pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;
.end method

.method public abstract planeData(I)Ljava/nio/ByteBuffer;
.end method

.method public abstract planeStride(I)I
.end method

.method public abstract releaseRef()J
.end method

.method public abstract rotation()Lcom/ss/bytertc/engine/data/VideoRotation;
.end method

.method public abstract seiData()Ljava/nio/ByteBuffer;
.end method

.method public abstract textureId()I
.end method

.method public abstract textureMatrix()[F
.end method

.method public abstract timestampUs()J
.end method

.method public abstract width()I
.end method
