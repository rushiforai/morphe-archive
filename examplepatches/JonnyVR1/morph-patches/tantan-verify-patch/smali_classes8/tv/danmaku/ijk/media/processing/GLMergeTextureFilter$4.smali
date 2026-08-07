.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->C2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:I

.field final synthetic c:Landroid/graphics/SurfaceTexture;

.field final synthetic d:Landroid/graphics/Bitmap;

.field final synthetic e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JILandroid/graphics/SurfaceTexture;Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->b:I

    .line 6
    .line 7
    iput-object p5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->c:Landroid/graphics/SurfaceTexture;

    .line 8
    .line 9
    iput-object p6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->d:Landroid/graphics/Bitmap;

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
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 4
    .line 5
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 6
    .line 7
    const/4 v4, -0x1

    .line 8
    if-ge v1, v3, :cond_2

    .line 9
    .line 10
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->a:J

    .line 11
    .line 12
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 13
    .line 14
    aget-wide v7, v3, v1

    .line 15
    .line 16
    cmp-long v3, v5, v7

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 21
    .line 22
    aget v5, v3, v1

    .line 23
    .line 24
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->b:I

    .line 25
    .line 26
    if-ne v5, v6, :cond_0

    .line 27
    .line 28
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    aget-object v5, v5, v1

    .line 31
    .line 32
    :cond_0
    aput v6, v3, v1

    .line 33
    .line 34
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 35
    .line 36
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->c:Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    aput-object v5, v3, v1

    .line 39
    .line 40
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 41
    .line 42
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->d:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    aput-object v5, v3, v1

    .line 45
    .line 46
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move v1, v4

    .line 54
    :goto_1
    if-ne v1, v4, :cond_3

    .line 55
    .line 56
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 57
    .line 58
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 59
    .line 60
    const/16 v4, 0x9

    .line 61
    .line 62
    if-ge v3, v4, :cond_3

    .line 63
    .line 64
    iget-object v4, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 65
    .line 66
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->d:Landroid/graphics/Bitmap;

    .line 67
    .line 68
    aput-object v5, v4, v3

    .line 69
    .line 70
    iget-object v4, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 71
    .line 72
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->b:I

    .line 73
    .line 74
    aput v5, v4, v3

    .line 75
    .line 76
    iget-object v4, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 77
    .line 78
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->c:Landroid/graphics/SurfaceTexture;

    .line 79
    .line 80
    aput-object v5, v4, v3

    .line 81
    .line 82
    iget-object v4, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 83
    .line 84
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->a:J

    .line 85
    .line 86
    aput-wide v5, v4, v3

    .line 87
    .line 88
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 92
    .line 93
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 94
    .line 95
    add-int/2addr v3, v0

    .line 96
    iput v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 97
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v2, "----update: "

    .line 101
    .line 102
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-wide v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->a:J

    .line 106
    .line 107
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v2, ", TID="

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->b:I

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v2, ",svn="

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 126
    .line 127
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v2, ", fsi="

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;->e:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 138
    .line 139
    invoke-static {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string p0, ", ind="

    .line 147
    .line 148
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string v0, "mergeFilter"

    .line 159
    .line 160
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    :cond_3
    return-void
.end method
