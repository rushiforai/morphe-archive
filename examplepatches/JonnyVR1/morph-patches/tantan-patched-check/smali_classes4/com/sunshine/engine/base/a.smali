.class public abstract Lcom/sunshine/engine/base/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sunshine/engine/base/a$c;,
        Lcom/sunshine/engine/base/a$d;,
        Lcom/sunshine/engine/base/a$b;,
        Lcom/sunshine/engine/base/a$a;
    }
.end annotation


# instance fields
.field public a:Lcom/sunshine/engine/base/s;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Landroid/graphics/Bitmap;

.field public f:Landroid/media/MediaPlayer;

.field public g:F

.field public h:Ll/drf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/drf0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/fz0;

.field public j:Ll/fz0;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:I

.field public n:Z

.field protected o:J

.field public p:Ll/kk90;

.field private q:F

.field public r:Z

.field public s:Ll/cce;

.field public t:Z

.field public u:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected v:Z

.field public w:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sunshine/engine/base/r$a;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sunshine/engine/base/a$a;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field protected z:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 19
    .line 20
    new-instance v2, Ll/drf0;

    .line 21
    .line 22
    const/16 v3, 0x2d0

    .line 23
    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const/16 v4, 0x500

    .line 29
    .line 30
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-direct {v2, v3, v4}, Ll/drf0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 38
    .line 39
    new-instance v2, Ll/fz0;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/fz0;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 45
    .line 46
    new-instance v2, Ll/fz0;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/fz0;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 52
    .line 53
    sget-object v2, Lcom/sunshine/engine/base/LayoutType;->center:Lcom/sunshine/engine/base/LayoutType;

    .line 54
    .line 55
    invoke-virtual {v2}, Lcom/sunshine/engine/base/LayoutType;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->k:Ljava/lang/String;

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    iput-boolean v2, p0, Lcom/sunshine/engine/base/a;->l:Z

    .line 63
    .line 64
    const/16 v3, 0x1770

    .line 65
    .line 66
    iput v3, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    iput-boolean v3, p0, Lcom/sunshine/engine/base/a;->n:Z

    .line 70
    .line 71
    const-wide/16 v4, -0x1

    .line 72
    .line 73
    iput-wide v4, p0, Lcom/sunshine/engine/base/a;->o:J

    .line 74
    .line 75
    new-instance v4, Ll/kk90;

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const/high16 v6, 0x3f800000    # 1.0f

    .line 82
    .line 83
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-direct {v4, v5, v6}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 88
    .line 89
    .line 90
    iput-object v4, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 91
    .line 92
    iput v1, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 93
    .line 94
    iput-boolean v3, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 95
    .line 96
    new-instance v1, Ll/cce;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/cce;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 102
    .line 103
    iput-boolean v3, p0, Lcom/sunshine/engine/base/a;->t:Z

    .line 104
    .line 105
    new-instance v1, Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->u:Ljava/util/Map;

    .line 111
    .line 112
    iput-boolean v2, p0, Lcom/sunshine/engine/base/a;->v:Z

    .line 113
    .line 114
    new-instance v1, Ljava/util/HashMap;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->w:Ljava/util/Map;

    .line 120
    .line 121
    new-instance v1, Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->x:Ljava/util/Map;

    .line 127
    .line 128
    new-instance v1, Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->y:Ljava/util/Map;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/sunshine/engine/base/a;->z:Ljava/lang/Runnable;

    .line 136
    .line 137
    iput-object p1, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 138
    .line 139
    iput-object p2, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p3, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 142
    .line 143
    iput-object p4, p0, Lcom/sunshine/engine/base/a;->d:Ljava/lang/String;

    .line 144
    .line 145
    return-void
.end method

.method public static synthetic a(Lcom/sunshine/engine/base/a;Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "   bmp.hashCode()="

    .line 10
    .line 11
    const-string v2, "   helper.entity.hashCode()="

    .line 12
    .line 13
    const-string v3, "   this.hashCode()="

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iput-object p1, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/sunshine/engine/base/s;->b()V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 27
    .line 28
    const-string v0, "in setSrcAsync set bmp"

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p2, v0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p2, p0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p2, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_0
    if-eqz p1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_2

    .line 105
    .line 106
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 107
    .line 108
    iget-object v4, v0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 109
    .line 110
    const-string v5, "in setSrcAsync recycle bmp"

    .line 111
    .line 112
    invoke-virtual {v0, v5}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v5, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    if-nez v4, :cond_1

    .line 142
    .line 143
    const/4 v2, -0x1

    .line 144
    goto :goto_0

    .line 145
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 180
    .line 181
    .line 182
    :cond_2
    if-eqz p2, :cond_3

    .line 183
    .line 184
    invoke-virtual {p2}, Landroid/media/MediaPlayer;->stop()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2}, Landroid/media/MediaPlayer;->release()V

    .line 188
    .line 189
    .line 190
    :cond_3
    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v3, "destroy bmp.hashCode()="

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 51
    .line 52
    :cond_1
    iget-boolean v0, p0, Lcom/sunshine/engine/base/a;->v:Z

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->u:Ljava/util/Map;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Landroid/graphics/Bitmap;

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->u:Ljava/util/Map;

    .line 85
    .line 86
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->z:Ljava/lang/Runnable;

    .line 90
    .line 91
    if-eqz p0, :cond_4

    .line 92
    .line 93
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 94
    .line 95
    .line 96
    :cond_4
    return-void
.end method

.method public abstract c(Landroid/graphics/Canvas;)V
.end method

.method public d(Landroid/graphics/Canvas;J)Z
    .locals 12

    .line 1
    iget v0, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 2
    .line 3
    invoke-static {v0}, Ll/a2j0;->e(F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x0

    .line 21
    const-string v3, "   bmp.hashCode()="

    .line 22
    .line 23
    const-string v4, "   entity.hashCode()="

    .line 24
    .line 25
    const-string v5, "   entity.picPath="

    .line 26
    .line 27
    const-string v6, "   entity.configPath="

    .line 28
    .line 29
    const-string v7, "   bmp.isRecycled()"

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 34
    .line 35
    const-string p2, "before draw"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, v7}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance p2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance p2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    invoke-virtual {p3}, Ljava/lang/Object;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Lcom/sunshine/engine/base/s;->k()V

    .line 124
    .line 125
    .line 126
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 127
    .line 128
    return v1

    .line 129
    :cond_2
    iget-wide v8, p0, Lcom/sunshine/engine/base/a;->o:J

    .line 130
    .line 131
    const-wide/16 v10, -0x1

    .line 132
    .line 133
    cmp-long v0, v8, v10

    .line 134
    .line 135
    if-nez v0, :cond_3

    .line 136
    .line 137
    iput-wide p2, p0, Lcom/sunshine/engine/base/a;->o:J

    .line 138
    .line 139
    :cond_3
    iget v0, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 140
    .line 141
    iget-object v8, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 142
    .line 143
    if-lez v0, :cond_4

    .line 144
    .line 145
    iget-wide v9, p0, Lcom/sunshine/engine/base/a;->o:J

    .line 146
    .line 147
    sub-long/2addr p2, v9

    .line 148
    long-to-float p2, p2

    .line 149
    int-to-float p3, v0

    .line 150
    div-float/2addr p2, p3

    .line 151
    invoke-virtual {v8, p2}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    iput p2, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_4
    invoke-virtual {v8}, Ll/ok90;->g()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    check-cast p2, Ljava/lang/Float;

    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    iput p2, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 173
    .line 174
    :goto_0
    iget p2, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 175
    .line 176
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 177
    .line 178
    invoke-virtual {p3}, Ll/ok90;->c()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p3

    .line 182
    check-cast p3, Ljava/lang/Float;

    .line 183
    .line 184
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 185
    .line 186
    .line 187
    move-result p3

    .line 188
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 189
    .line 190
    invoke-virtual {v0}, Ll/ok90;->g()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Ljava/lang/Float;

    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    invoke-static {p2, p3, v0}, Ll/a2j0;->c(FFF)F

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    iput p2, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 205
    .line 206
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/sunshine/engine/base/a;->c(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 210
    .line 211
    if-eqz p1, :cond_6

    .line 212
    .line 213
    iget p1, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 214
    .line 215
    invoke-static {p1}, Ll/a2j0;->e(F)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_6

    .line 220
    .line 221
    iget p1, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 222
    .line 223
    if-lez p1, :cond_6

    .line 224
    .line 225
    iget-object p1, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 226
    .line 227
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_5

    .line 232
    .line 233
    iget-object p1, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 234
    .line 235
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 236
    .line 237
    .line 238
    :cond_5
    iget-object p1, p0, Lcom/sunshine/engine/base/a;->f:Landroid/media/MediaPlayer;

    .line 239
    .line 240
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 241
    .line 242
    .line 243
    :cond_6
    iget p1, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Lcom/sunshine/engine/base/a;->h(F)Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    return p0

    .line 250
    :catchall_0
    move-exception p1

    .line 251
    iget-object p2, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 252
    .line 253
    const-string p3, "in draw"

    .line 254
    .line 255
    invoke-virtual {p2, p3}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    invoke-virtual {p2, v7}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    new-instance p3, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    const-string v0, "   exp="

    .line 266
    .line 267
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    invoke-virtual {p2, p1}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    new-instance p2, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p2

    .line 299
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    new-instance p2, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 309
    .line 310
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p2

    .line 317
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    new-instance p2, Ljava/lang/StringBuilder;

    .line 322
    .line 323
    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 327
    .line 328
    .line 329
    move-result p3

    .line 330
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object p2

    .line 337
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    new-instance p2, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object p3, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 347
    .line 348
    invoke-virtual {p3}, Ljava/lang/Object;->hashCode()I

    .line 349
    .line 350
    .line 351
    move-result p3

    .line 352
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p2

    .line 359
    invoke-virtual {p1, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    invoke-virtual {p1}, Lcom/sunshine/engine/base/s;->k()V

    .line 364
    .line 365
    .line 366
    iput-object v2, p0, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 367
    .line 368
    return v1
.end method

.method public abstract e()Lorg/xml/sax/helpers/DefaultHandler;
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 2
    .line 3
    return p0
.end method

.method public g(Landroid/graphics/Matrix;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 5
    .line 6
    iget v1, v0, Ll/fz0;->b:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    iget v0, v0, Ll/fz0;->d:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 16
    .line 17
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 21
    .line 22
    iget-object v1, v0, Ll/cce;->c:Landroid/graphics/RectF;

    .line 23
    .line 24
    iget-object v0, v0, Ll/cce;->a:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 30
    .line 31
    iget-object v1, v0, Ll/cce;->e:Landroid/graphics/PointF;

    .line 32
    .line 33
    iget-object v2, v0, Ll/cce;->b:Landroid/graphics/PointF;

    .line 34
    .line 35
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 36
    .line 37
    iget v4, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 38
    .line 39
    mul-float/2addr v3, v4

    .line 40
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 41
    .line 42
    iget v5, p0, Ll/fz0;->b:I

    .line 43
    .line 44
    int-to-float v5, v5

    .line 45
    add-float/2addr v3, v5

    .line 46
    iput v3, v1, Landroid/graphics/PointF;->x:F

    .line 47
    .line 48
    iget v3, v2, Landroid/graphics/PointF;->y:F

    .line 49
    .line 50
    mul-float/2addr v3, v4

    .line 51
    iget p0, p0, Ll/fz0;->d:I

    .line 52
    .line 53
    int-to-float p0, p0

    .line 54
    add-float/2addr v3, p0

    .line 55
    iput v3, v1, Landroid/graphics/PointF;->y:F

    .line 56
    .line 57
    iget p0, v0, Ll/cce;->d:F

    .line 58
    .line 59
    iget v0, v2, Landroid/graphics/PointF;->x:F

    .line 60
    .line 61
    iget v1, v2, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    invoke-virtual {p1, p0, v0, v1}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public abstract h(F)Z
.end method

.method public i(FFI)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/sunshine/engine/base/a;->o:J

    .line 4
    .line 5
    iput p1, p0, Lcom/sunshine/engine/base/a;->q:F

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/sunshine/engine/base/a;->n:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    iput-boolean p3, p0, Lcom/sunshine/engine/base/a;->l:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/sunshine/engine/base/a;->l:Z

    .line 30
    .line 31
    iput p3, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 32
    .line 33
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->p:Ll/kk90;

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public j(Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/s;->g:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/s2f;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/s2f;-><init>(Lcom/sunshine/engine/base/a;Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
