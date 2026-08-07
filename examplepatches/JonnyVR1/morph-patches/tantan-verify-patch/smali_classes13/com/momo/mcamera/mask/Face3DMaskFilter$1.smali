.class Lcom/momo/mcamera/mask/Face3DMaskFilter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/Face3DMaskFilter;->get3DRenderImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

.field final synthetic val$PixelBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Face3DMaskFilter;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->val$PixelBuffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$000(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$100(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$200(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    move-object v1, v0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-static {v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$300(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$400(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 40
    .line 41
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    goto :goto_0

    .line 46
    :goto_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->val$PixelBuffer:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$500(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    new-instance v6, Landroid/graphics/Matrix;

    .line 60
    .line 61
    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 62
    .line 63
    .line 64
    const/high16 v0, 0x3f800000    # 1.0f

    .line 65
    .line 66
    const/high16 v2, -0x40800000    # -1.0f

    .line 67
    .line 68
    invoke-virtual {v6, v0, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 69
    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$000(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Landroid/graphics/Rect;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-static {v2}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$100(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$200(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const/4 v7, 0x1

    .line 96
    const/4 v2, 0x0

    .line 97
    const/4 v3, 0x0

    .line 98
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    goto :goto_2

    .line 103
    :cond_1
    invoke-static {v2}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$600(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$700(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    const/4 v7, 0x1

    .line 114
    const/4 v2, 0x0

    .line 115
    const/4 v3, 0x0

    .line 116
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    :goto_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;->this$0:Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 121
    .line 122
    invoke-static {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->access$500(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0, v0}, Lcom/momo/mcamera/mask/Capture3DImageListener;->get3DRenderImage(Landroid/graphics/Bitmap;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    return-void
.end method
