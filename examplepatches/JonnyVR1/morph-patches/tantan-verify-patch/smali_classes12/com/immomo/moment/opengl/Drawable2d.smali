.class public Lcom/immomo/moment/opengl/Drawable2d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/opengl/Drawable2d$Prefab;
    }
.end annotation


# static fields
.field private static final h:[F

.field private static final i:[F

.field private static final j:Ljava/nio/FloatBuffer;

.field private static final k:Ljava/nio/FloatBuffer;

.field private static final l:[F

.field private static final m:[F

.field private static final n:Ljava/nio/FloatBuffer;

.field private static final o:Ljava/nio/FloatBuffer;

.field private static final p:[F

.field private static final q:[F

.field private static final r:Ljava/nio/FloatBuffer;

.field private static final s:Ljava/nio/FloatBuffer;


# instance fields
.field private a:Ljava/nio/FloatBuffer;

.field private b:Ljava/nio/FloatBuffer;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Lcom/immomo/moment/opengl/Drawable2d$Prefab;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->h:[F

    .line 8
    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    fill-array-data v0, :array_1

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/immomo/moment/opengl/Drawable2d;->i:[F

    .line 15
    .line 16
    invoke-static {v1}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->j:Ljava/nio/FloatBuffer;

    .line 21
    .line 22
    invoke-static {v0}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/immomo/moment/opengl/Drawable2d;->k:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    new-array v1, v0, [F

    .line 31
    .line 32
    fill-array-data v1, :array_2

    .line 33
    .line 34
    .line 35
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->l:[F

    .line 36
    .line 37
    new-array v2, v0, [F

    .line 38
    .line 39
    fill-array-data v2, :array_3

    .line 40
    .line 41
    .line 42
    sput-object v2, Lcom/immomo/moment/opengl/Drawable2d;->m:[F

    .line 43
    .line 44
    invoke-static {v1}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->n:Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    invoke-static {v2}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->o:Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    new-array v1, v0, [F

    .line 57
    .line 58
    fill-array-data v1, :array_4

    .line 59
    .line 60
    .line 61
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->p:[F

    .line 62
    .line 63
    new-array v0, v0, [F

    .line 64
    .line 65
    fill-array-data v0, :array_5

    .line 66
    .line 67
    .line 68
    sput-object v0, Lcom/immomo/moment/opengl/Drawable2d;->q:[F

    .line 69
    .line 70
    invoke-static {v1}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sput-object v1, Lcom/immomo/moment/opengl/Drawable2d;->r:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    invoke-static {v0}, Ll/z3k;->c([F)Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sput-object v0, Lcom/immomo/moment/opengl/Drawable2d;->s:Ljava/nio/FloatBuffer;

    .line 81
    .line 82
    return-void

    .line 83
    :array_0
    .array-data 4
        0x0
        0x3f13cd3a
        -0x41000000    # -0.5f
        -0x416c32c6
        0x3f000000    # 0.5f
        -0x416c32c6
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :array_2
    .array-data 4
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_4
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :array_5
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/immomo/moment/opengl/Drawable2d$Prefab;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    aget v0, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->r:Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->a:Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->s:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->b:Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    iput v2, p0, Lcom/immomo/moment/opengl/Drawable2d;->d:I

    .line 30
    .line 31
    mul-int/lit8 v0, v2, 0x4

    .line 32
    .line 33
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->e:I

    .line 34
    .line 35
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->p:[F

    .line 36
    .line 37
    array-length v0, v0

    .line 38
    div-int/2addr v0, v2

    .line 39
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->c:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p0, "Unknown shape "

    .line 43
    .line 44
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    throw p0

    .line 49
    :cond_1
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->n:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->a:Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->o:Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->b:Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    iput v2, p0, Lcom/immomo/moment/opengl/Drawable2d;->d:I

    .line 58
    .line 59
    mul-int/lit8 v0, v2, 0x4

    .line 60
    .line 61
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->e:I

    .line 62
    .line 63
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->l:[F

    .line 64
    .line 65
    array-length v0, v0

    .line 66
    div-int/2addr v0, v2

    .line 67
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->c:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->j:Ljava/nio/FloatBuffer;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->a:Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->k:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->b:Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    iput v2, p0, Lcom/immomo/moment/opengl/Drawable2d;->d:I

    .line 79
    .line 80
    mul-int/lit8 v0, v2, 0x4

    .line 81
    .line 82
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->e:I

    .line 83
    .line 84
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d;->h:[F

    .line 85
    .line 86
    array-length v0, v0

    .line 87
    div-int/2addr v0, v2

    .line 88
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->c:I

    .line 89
    .line 90
    :goto_0
    const/16 v0, 0x8

    .line 91
    .line 92
    iput v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->f:I

    .line 93
    .line 94
    iput-object p1, p0, Lcom/immomo/moment/opengl/Drawable2d;->g:Lcom/immomo/moment/opengl/Drawable2d$Prefab;

    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/opengl/Drawable2d;->g:Lcom/immomo/moment/opengl/Drawable2d$Prefab;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "[Drawable2d: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/moment/opengl/Drawable2d;->g:Lcom/immomo/moment/opengl/Drawable2d$Prefab;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "]"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, "[Drawable2d: ...]"

    .line 28
    .line 29
    return-object p0
.end method
