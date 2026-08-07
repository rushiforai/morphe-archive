.class Lcom/ss/bytertc/engine/utils/TextureHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureHelper;->drawTexture(III[F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field final synthetic val$srcTextureId:I

.field final synthetic val$targetTextureId:I

.field final synthetic val$tex_matrix:[F

.field final synthetic val$textureType:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;III[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$targetTextureId:I

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$textureType:I

    .line 6
    .line 7
    iput p4, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$srcTextureId:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$tex_matrix:[F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$002(Lcom/ss/bytertc/engine/utils/TextureHelper;Lcom/bytedance/realx/video/GlRectDrawer;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string v0, "TextureHelper construct"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$100(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const v1, 0x8d40

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 34
    .line 35
    .line 36
    const v0, 0x8ce0

    .line 37
    .line 38
    .line 39
    iget v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$targetTextureId:I

    .line 40
    .line 41
    const/16 v3, 0xde1

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-static {v1, v0, v3, v2, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$textureType:I

    .line 48
    .line 49
    const/16 v2, 0xa

    .line 50
    .line 51
    if-eq v0, v2, :cond_2

    .line 52
    .line 53
    const/16 v2, 0xb

    .line 54
    .line 55
    if-eq v0, v2, :cond_1

    .line 56
    .line 57
    const-string p0, "TextureHelper"

    .line 58
    .line 59
    const-string v0, "draw texture type error"

    .line 60
    .line 61
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget v6, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$srcTextureId:I

    .line 72
    .line 73
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$tex_matrix:[F

    .line 74
    .line 75
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 90
    .line 91
    .line 92
    move-result v12

    .line 93
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 94
    .line 95
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    const/4 v10, 0x0

    .line 100
    const/4 v11, 0x0

    .line 101
    invoke-virtual/range {v5 .. v13}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIII)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    iget v6, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$srcTextureId:I

    .line 112
    .line 113
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->val$tex_matrix:[F

    .line 114
    .line 115
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 118
    .line 119
    .line 120
    move-result v8

    .line 121
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 130
    .line 131
    .line 132
    move-result v12

    .line 133
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 134
    .line 135
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I

    .line 136
    .line 137
    .line 138
    move-result v13

    .line 139
    const/4 v10, 0x0

    .line 140
    const/4 v11, 0x0

    .line 141
    invoke-virtual/range {v5 .. v13}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawRgb(I[FIIIIII)V

    .line 142
    .line 143
    .line 144
    :goto_0
    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 145
    .line 146
    .line 147
    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 151
    .line 152
    .line 153
    const-string p0, "TextureHelper drawTexture"

    .line 154
    .line 155
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
