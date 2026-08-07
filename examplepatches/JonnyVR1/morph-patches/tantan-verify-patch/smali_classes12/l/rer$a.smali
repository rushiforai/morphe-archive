.class Ll/rer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rer;->h0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/nio/ByteBuffer;

.field final synthetic b:Z

.field final synthetic c:Ll/rer;


# direct methods
.method public constructor <init>(Ll/rer;Ljava/nio/ByteBuffer;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rer$a;->c:Ll/rer;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rer$a;->a:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/rer$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/rer$a;->c:Ll/rer;

    .line 2
    .line 3
    invoke-static {v0}, Ll/rer;->P(Ll/rer;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/rer$a;->c:Ll/rer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Ll/rer;->Q(Ll/rer;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/rer$a;->c:Ll/rer;

    .line 16
    .line 17
    invoke-static {v1}, Ll/rer;->R(Ll/rer;)I

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
    invoke-static {v1}, Ll/rer;->S(Ll/rer;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Ll/rer$a;->c:Ll/rer;

    .line 34
    .line 35
    invoke-static {v1}, Ll/rer;->T(Ll/rer;)I

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
    iget-object v0, p0, Ll/rer$a;->a:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 49
    .line 50
    .line 51
    new-instance v6, Landroid/graphics/Matrix;

    .line 52
    .line 53
    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 54
    .line 55
    .line 56
    const/high16 v0, 0x3f800000    # 1.0f

    .line 57
    .line 58
    const/high16 v2, -0x40800000    # -1.0f

    .line 59
    .line 60
    invoke-virtual {v6, v0, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/rer$a;->c:Ll/rer;

    .line 64
    .line 65
    invoke-static {v0}, Ll/rer;->U(Ll/rer;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    int-to-float v0, v0

    .line 70
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/rer$a;->c:Ll/rer;

    .line 74
    .line 75
    invoke-static {v0}, Ll/rer;->P(Ll/rer;)Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v2, p0, Ll/rer$a;->c:Ll/rer;

    .line 80
    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    invoke-static {v2}, Ll/rer;->Q(Ll/rer;)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    iget-object v0, p0, Ll/rer$a;->c:Ll/rer;

    .line 88
    .line 89
    invoke-static {v0}, Ll/rer;->R(Ll/rer;)I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    const/4 v7, 0x1

    .line 94
    const/4 v2, 0x0

    .line 95
    const/4 v3, 0x0

    .line 96
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    goto :goto_2

    .line 101
    :cond_1
    invoke-static {v2}, Ll/rer;->V(Ll/rer;)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    iget-object v0, p0, Ll/rer$a;->c:Ll/rer;

    .line 106
    .line 107
    invoke-static {v0}, Ll/rer;->W(Ll/rer;)I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    const/4 v7, 0x1

    .line 112
    const/4 v2, 0x0

    .line 113
    const/4 v3, 0x0

    .line 114
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_2
    iget-boolean v1, p0, Ll/rer$a;->b:Z

    .line 119
    .line 120
    iget-object p0, p0, Ll/rer$a;->c:Ll/rer;

    .line 121
    .line 122
    if-eqz v1, :cond_2

    .line 123
    .line 124
    invoke-static {p0}, Ll/rer;->X(Ll/rer;)Ll/dh4;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-interface {p0, v0}, Ll/dh4;->a(Landroid/graphics/Bitmap;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_2
    invoke-static {p0}, Ll/rer;->X(Ll/rer;)Ll/dh4;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-interface {p0, v0}, Ll/dh4;->get3DRenderImage(Landroid/graphics/Bitmap;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method
