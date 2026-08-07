.class public Lcom/momo/xeengine/egl/TextureRender;
.super Lcom/momo/xeengine/egl/BaseTextureRender;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final ps:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCo;\nuniform sampler2D uTexture;\nvoid main() {\n    gl_FragColor = texture2D(uTexture, vTextureCo);\n}"

.field private static final vs:Ljava/lang/String; = "attribute vec4 aVertexCo;\nattribute vec2 aTextureCo;\nuniform mat4 uVertexMatrix;\nuniform mat4 uTextureMatrix;\nvarying vec2 vTextureCo;\nvoid main(){\n    gl_Position = uVertexMatrix * aVertexCo;\n    vTextureCo = (uTextureMatrix * vec4(aTextureCo,0,1)).xy;\n}"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 aVertexCo;\nattribute vec2 aTextureCo;\nuniform mat4 uVertexMatrix;\nuniform mat4 uTextureMatrix;\nvarying vec2 vTextureCo;\nvoid main(){\n    gl_Position = uVertexMatrix * aVertexCo;\n    vTextureCo = (uTextureMatrix * vec4(aTextureCo,0,1)).xy;\n}"

    .line 2
    .line 3
    const-string v1, "precision mediump float;\nvarying vec2 vTextureCo;\nuniform sampler2D uTexture;\nvoid main() {\n    gl_FragColor = texture2D(uTexture, vTextureCo);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/egl/BaseTextureRender;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/egl/BaseTextureRender;->create()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
