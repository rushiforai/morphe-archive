.class public Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SkinFaceBuffer"
.end annotation


# instance fields
.field private bufferSource:Ljava/nio/FloatBuffer;

.field private bufferTex:Ljava/nio/FloatBuffer;

.field private bufferVer:Ljava/nio/FloatBuffer;

.field private byteBufSource:Ljava/nio/ByteBuffer;

.field private byteBufTex:Ljava/nio/ByteBuffer;

.field private byteBufVer:Ljava/nio/ByteBuffer;

.field final synthetic this$0:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->this$0:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufVer:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferVer:Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufTex:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferTex:Ljava/nio/FloatBuffer;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufSource:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferSource:Ljava/nio/FloatBuffer;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufVer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufVer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferVer:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferVer:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufTex:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufTex:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferTex:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferTex:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufSource:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufSource:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferSource:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferSource:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SkinFaceBuffer{byteBufVer="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufVer:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", bufferVer="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferVer:Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", byteBufTex="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufTex:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", bufferTex="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferTex:Ljava/nio/FloatBuffer;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", byteBufSource="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->byteBufSource:Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", bufferSource="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->bufferSource:Ljava/nio/FloatBuffer;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x7d

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
