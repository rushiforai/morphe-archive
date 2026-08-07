.class Lcom/ss/bytertc/engine/utils/TextureHelper$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureHelper;->yuvToTexture(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;I[F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field final synthetic val$i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

.field final synthetic val$targetTextureId:I

.field final synthetic val$tex_matrix:[F


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;ILcom/bytedance/realx/video/VideoFrame$I420Buffer;[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$targetTextureId:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$tex_matrix:[F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$400(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "TextureHelper construct"

    .line 18
    .line 19
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$100(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const v1, 0x8d40

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 32
    .line 33
    .line 34
    const v0, 0x8ce0

    .line 35
    .line 36
    .line 37
    iget v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$targetTextureId:I

    .line 38
    .line 39
    const/16 v3, 0xde1

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-static {v1, v0, v3, v2, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$400(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;->uploadFromBuffer(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;)[I

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$400(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;->getYuvTextures()[I

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->val$tex_matrix:[F

    .line 73
    .line 74
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 89
    .line 90
    .line 91
    move-result v12

    .line 92
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 93
    .line 94
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    const/4 v10, 0x0

    .line 99
    const/4 v11, 0x0

    .line 100
    invoke-virtual/range {v5 .. v13}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawYuv([I[FIIIIII)V

    .line 101
    .line 102
    .line 103
    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 110
    .line 111
    .line 112
    const-string p0, "TextureHelper drawTexture"

    .line 113
    .line 114
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_0
    const-string p0, "mTextureDrawer and mYuvUploader can not null."

    .line 119
    .line 120
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method
