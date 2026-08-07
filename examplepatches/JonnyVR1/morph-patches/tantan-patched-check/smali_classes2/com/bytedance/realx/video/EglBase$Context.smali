.class public interface abstract Lcom/bytedance/realx/video/EglBase$Context;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/EglBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Context"
.end annotation


# static fields
.field public static final NO_CONTEXT:J


# virtual methods
.method public abstract getEgl14Context()Landroid/opengl/EGLContext;
.end method

.method public abstract getGLESVersion()I
.end method

.method public abstract getNativeEglContext()J
.end method
