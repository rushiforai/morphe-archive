.class public Ll/u1l0$g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# static fields
.field public static final q:Landroid/graphics/Matrix;


# instance fields
.field public final a:Landroid/graphics/Path;

.field public final b:Landroid/graphics/Path;

.field public final c:Landroid/graphics/Matrix;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/PathMeasure;

.field public g:I

.field public final h:Ll/u1l0$d;

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:I

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/Boolean;

.field public final p:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u1l0$g;->q:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    const/4 v0, 0x0

    .line 105
    iput v0, p0, Ll/u1l0$g;->i:F

    .line 106
    iput v0, p0, Ll/u1l0$g;->j:F

    .line 107
    iput v0, p0, Ll/u1l0$g;->k:F

    .line 108
    iput v0, p0, Ll/u1l0$g;->l:F

    const/16 v0, 0xff

    .line 109
    iput v0, p0, Ll/u1l0$g;->m:I

    const/4 v0, 0x0

    .line 110
    iput-object v0, p0, Ll/u1l0$g;->n:Ljava/lang/String;

    .line 111
    iput-object v0, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 112
    new-instance v0, Ll/l01;

    invoke-direct {v0}, Ll/l01;-><init>()V

    iput-object v0, p0, Ll/u1l0$g;->p:Ll/l01;

    .line 113
    new-instance v0, Ll/u1l0$d;

    invoke-direct {v0}, Ll/u1l0$d;-><init>()V

    iput-object v0, p0, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 114
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 115
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    return-void
.end method

.method public constructor <init>(Ll/u1l0$g;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/u1l0$g;->i:F

    .line 13
    .line 14
    iput v0, p0, Ll/u1l0$g;->j:F

    .line 15
    .line 16
    iput v0, p0, Ll/u1l0$g;->k:F

    .line 17
    .line 18
    iput v0, p0, Ll/u1l0$g;->l:F

    .line 19
    .line 20
    const/16 v0, 0xff

    .line 21
    .line 22
    iput v0, p0, Ll/u1l0$g;->m:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/u1l0$g;->n:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 28
    .line 29
    new-instance v0, Ll/l01;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/u1l0$g;->p:Ll/l01;

    .line 35
    .line 36
    new-instance v1, Ll/u1l0$d;

    .line 37
    .line 38
    iget-object v2, p1, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 39
    .line 40
    invoke-direct {v1, v2, v0}, Ll/u1l0$d;-><init>(Ll/u1l0$d;Ll/l01;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 44
    .line 45
    new-instance v1, Landroid/graphics/Path;

    .line 46
    .line 47
    iget-object v2, p1, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 48
    .line 49
    invoke-direct {v1, v2}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 53
    .line 54
    new-instance v1, Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v2, p1, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 57
    .line 58
    invoke-direct {v1, v2}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 62
    .line 63
    iget v1, p1, Ll/u1l0$g;->i:F

    .line 64
    .line 65
    iput v1, p0, Ll/u1l0$g;->i:F

    .line 66
    .line 67
    iget v1, p1, Ll/u1l0$g;->j:F

    .line 68
    .line 69
    iput v1, p0, Ll/u1l0$g;->j:F

    .line 70
    .line 71
    iget v1, p1, Ll/u1l0$g;->k:F

    .line 72
    .line 73
    iput v1, p0, Ll/u1l0$g;->k:F

    .line 74
    .line 75
    iget v1, p1, Ll/u1l0$g;->l:F

    .line 76
    .line 77
    iput v1, p0, Ll/u1l0$g;->l:F

    .line 78
    .line 79
    iget v1, p1, Ll/u1l0$g;->g:I

    .line 80
    .line 81
    iput v1, p0, Ll/u1l0$g;->g:I

    .line 82
    .line 83
    iget v1, p1, Ll/u1l0$g;->m:I

    .line 84
    .line 85
    iput v1, p0, Ll/u1l0$g;->m:I

    .line 86
    .line 87
    iget-object v1, p1, Ll/u1l0$g;->n:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, p0, Ll/u1l0$g;->n:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v1, p1, Ll/u1l0$g;->n:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz v1, :cond_0

    .line 94
    .line 95
    invoke-virtual {v0, v1, p0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object p1, p1, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 99
    .line 100
    iput-object p1, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 101
    .line 102
    return-void
.end method

.method public static a(FFFF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p3

    .line 2
    mul-float/2addr p1, p2

    .line 3
    sub-float/2addr p0, p1

    .line 4
    return p0
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .locals 7

    .line 1
    iget-object v1, p0, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 2
    .line 3
    sget-object v2, Ll/u1l0$g;->q:Landroid/graphics/Matrix;

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-object v3, p1

    .line 7
    move v4, p2

    .line 8
    move v5, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-virtual/range {v0 .. v6}, Ll/u1l0$g;->c(Ll/u1l0$d;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final c(Ll/u1l0$d;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .locals 15

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    iget-object v0, v1, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, v1, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 11
    .line 12
    iget-object v2, v1, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Canvas;->save()I

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    move v7, v0

    .line 22
    :goto_0
    iget-object v0, v1, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ge v7, v0, :cond_2

    .line 29
    .line 30
    iget-object v0, v1, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/u1l0$e;

    .line 37
    .line 38
    instance-of v2, v0, Ll/u1l0$d;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    move-object v9, v0

    .line 43
    check-cast v9, Ll/u1l0$d;

    .line 44
    .line 45
    iget-object v10, v1, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 46
    .line 47
    move-object v8, p0

    .line 48
    move-object/from16 v11, p3

    .line 49
    .line 50
    move/from16 v12, p4

    .line 51
    .line 52
    move/from16 v13, p5

    .line 53
    .line 54
    move-object/from16 v14, p6

    .line 55
    .line 56
    invoke-virtual/range {v8 .. v14}, Ll/u1l0$g;->c(Ll/u1l0$d;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    instance-of v2, v0, Ll/u1l0$f;

    .line 61
    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    move-object v2, v0

    .line 65
    check-cast v2, Ll/u1l0$f;

    .line 66
    .line 67
    move-object v0, p0

    .line 68
    move-object/from16 v3, p3

    .line 69
    .line 70
    move/from16 v4, p4

    .line 71
    .line 72
    move/from16 v5, p5

    .line 73
    .line 74
    move-object/from16 v6, p6

    .line 75
    .line 76
    invoke-virtual/range {v0 .. v6}, Ll/u1l0$g;->d(Ll/u1l0$d;Ll/u1l0$f;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 80
    .line 81
    move-object/from16 v1, p1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Canvas;->restore()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final d(Ll/u1l0$d;Ll/u1l0$f;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .locals 7

    .line 1
    int-to-float p4, p4

    .line 2
    iget v0, p0, Ll/u1l0$g;->k:F

    .line 3
    .line 4
    div-float/2addr p4, v0

    .line 5
    int-to-float p5, p5

    .line 6
    iget v0, p0, Ll/u1l0$g;->l:F

    .line 7
    .line 8
    div-float/2addr p5, v0

    .line 9
    invoke-static {p4, p5}, Ljava/lang/Math;->min(FF)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p1, p1, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 14
    .line 15
    iget-object v1, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 21
    .line 22
    invoke-virtual {v1, p4, p5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/u1l0$g;->e(Landroid/graphics/Matrix;)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 p4, 0x0

    .line 30
    cmpl-float p5, p1, p4

    .line 31
    .line 32
    if-nez p5, :cond_0

    .line 33
    .line 34
    goto/16 :goto_5

    .line 35
    .line 36
    :cond_0
    iget-object p5, p0, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 37
    .line 38
    invoke-virtual {p2, p5}, Ll/u1l0$f;->d(Landroid/graphics/Path;)V

    .line 39
    .line 40
    .line 41
    iget-object p5, p0, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 42
    .line 43
    iget-object v1, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ll/u1l0$f;->c()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 55
    .line 56
    iget p2, p2, Ll/u1l0$f;->c:I

    .line 57
    .line 58
    if-nez p2, :cond_1

    .line 59
    .line 60
    sget-object p2, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget-object p2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 64
    .line 65
    :goto_0
    invoke-virtual {p1, p2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 69
    .line 70
    iget-object p2, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 71
    .line 72
    invoke-virtual {p1, p5, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 76
    .line 77
    invoke-virtual {p3, p0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    check-cast p2, Ll/u1l0$c;

    .line 82
    .line 83
    iget v1, p2, Ll/u1l0$c;->k:F

    .line 84
    .line 85
    cmpl-float v2, v1, p4

    .line 86
    .line 87
    const/high16 v3, 0x3f800000    # 1.0f

    .line 88
    .line 89
    const/4 v4, 0x1

    .line 90
    if-nez v2, :cond_3

    .line 91
    .line 92
    iget v2, p2, Ll/u1l0$c;->l:F

    .line 93
    .line 94
    cmpl-float v2, v2, v3

    .line 95
    .line 96
    if-eqz v2, :cond_6

    .line 97
    .line 98
    :cond_3
    iget v2, p2, Ll/u1l0$c;->m:F

    .line 99
    .line 100
    add-float/2addr v1, v2

    .line 101
    rem-float/2addr v1, v3

    .line 102
    iget v5, p2, Ll/u1l0$c;->l:F

    .line 103
    .line 104
    add-float/2addr v5, v2

    .line 105
    rem-float/2addr v5, v3

    .line 106
    iget-object v2, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 107
    .line 108
    if-nez v2, :cond_4

    .line 109
    .line 110
    new-instance v2, Landroid/graphics/PathMeasure;

    .line 111
    .line 112
    invoke-direct {v2}, Landroid/graphics/PathMeasure;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v2, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 116
    .line 117
    :cond_4
    iget-object v2, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 118
    .line 119
    iget-object v3, p0, Ll/u1l0$g;->a:Landroid/graphics/Path;

    .line 120
    .line 121
    const/4 v6, 0x0

    .line 122
    invoke-virtual {v2, v3, v6}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 126
    .line 127
    invoke-virtual {v2}, Landroid/graphics/PathMeasure;->getLength()F

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    mul-float/2addr v1, v2

    .line 132
    mul-float/2addr v5, v2

    .line 133
    invoke-virtual {p5}, Landroid/graphics/Path;->reset()V

    .line 134
    .line 135
    .line 136
    cmpl-float v3, v1, v5

    .line 137
    .line 138
    iget-object v6, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 139
    .line 140
    if-lez v3, :cond_5

    .line 141
    .line 142
    invoke-virtual {v6, v1, v2, p5, v4}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/u1l0$g;->f:Landroid/graphics/PathMeasure;

    .line 146
    .line 147
    invoke-virtual {v1, p4, v5, p5, v4}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_5
    invoke-virtual {v6, v1, v5, p5, v4}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 152
    .line 153
    .line 154
    :goto_1
    invoke-virtual {p5, p4, p4}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 155
    .line 156
    .line 157
    :cond_6
    iget-object p4, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 158
    .line 159
    iget-object v1, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 160
    .line 161
    invoke-virtual {p4, p5, v1}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 162
    .line 163
    .line 164
    iget-object p4, p2, Ll/u1l0$c;->h:Ll/xo5;

    .line 165
    .line 166
    invoke-virtual {p4}, Ll/xo5;->l()Z

    .line 167
    .line 168
    .line 169
    move-result p4

    .line 170
    const/16 p5, 0xff

    .line 171
    .line 172
    const/4 v1, 0x0

    .line 173
    const/high16 v2, 0x437f0000    # 255.0f

    .line 174
    .line 175
    if-eqz p4, :cond_a

    .line 176
    .line 177
    iget-object p4, p2, Ll/u1l0$c;->h:Ll/xo5;

    .line 178
    .line 179
    iget-object v3, p0, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 180
    .line 181
    if-nez v3, :cond_7

    .line 182
    .line 183
    new-instance v3, Landroid/graphics/Paint;

    .line 184
    .line 185
    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    .line 186
    .line 187
    .line 188
    iput-object v3, p0, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 189
    .line 190
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 191
    .line 192
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 193
    .line 194
    .line 195
    :cond_7
    iget-object v3, p0, Ll/u1l0$g;->e:Landroid/graphics/Paint;

    .line 196
    .line 197
    invoke-virtual {p4}, Ll/xo5;->h()Z

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    if-eqz v5, :cond_8

    .line 202
    .line 203
    invoke-virtual {p4}, Ll/xo5;->f()Landroid/graphics/Shader;

    .line 204
    .line 205
    .line 206
    move-result-object p4

    .line 207
    iget-object v5, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 208
    .line 209
    invoke-virtual {p4, v5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 213
    .line 214
    .line 215
    iget p4, p2, Ll/u1l0$c;->j:F

    .line 216
    .line 217
    mul-float/2addr p4, v2

    .line 218
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    .line 219
    .line 220
    .line 221
    move-result p4

    .line 222
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_8
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v3, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p4}, Ll/xo5;->e()I

    .line 233
    .line 234
    .line 235
    move-result p4

    .line 236
    iget v5, p2, Ll/u1l0$c;->j:F

    .line 237
    .line 238
    invoke-static {p4, v5}, Ll/u1l0;->a(IF)I

    .line 239
    .line 240
    .line 241
    move-result p4

    .line 242
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 243
    .line 244
    .line 245
    :goto_2
    invoke-virtual {v3, p6}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 246
    .line 247
    .line 248
    iget-object p4, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 249
    .line 250
    iget v5, p2, Ll/u1l0$f;->c:I

    .line 251
    .line 252
    if-nez v5, :cond_9

    .line 253
    .line 254
    sget-object v5, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    .line 255
    .line 256
    goto :goto_3

    .line 257
    :cond_9
    sget-object v5, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 258
    .line 259
    :goto_3
    invoke-virtual {p4, v5}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 260
    .line 261
    .line 262
    iget-object p4, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 263
    .line 264
    invoke-virtual {p3, p4, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 265
    .line 266
    .line 267
    :cond_a
    iget-object p4, p2, Ll/u1l0$c;->f:Ll/xo5;

    .line 268
    .line 269
    invoke-virtual {p4}, Ll/xo5;->l()Z

    .line 270
    .line 271
    .line 272
    move-result p4

    .line 273
    if-eqz p4, :cond_f

    .line 274
    .line 275
    iget-object p4, p2, Ll/u1l0$c;->f:Ll/xo5;

    .line 276
    .line 277
    iget-object v3, p0, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 278
    .line 279
    if-nez v3, :cond_b

    .line 280
    .line 281
    new-instance v3, Landroid/graphics/Paint;

    .line 282
    .line 283
    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    .line 284
    .line 285
    .line 286
    iput-object v3, p0, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 287
    .line 288
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 289
    .line 290
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 291
    .line 292
    .line 293
    :cond_b
    iget-object v3, p0, Ll/u1l0$g;->d:Landroid/graphics/Paint;

    .line 294
    .line 295
    iget-object v4, p2, Ll/u1l0$c;->o:Landroid/graphics/Paint$Join;

    .line 296
    .line 297
    if-eqz v4, :cond_c

    .line 298
    .line 299
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 300
    .line 301
    .line 302
    :cond_c
    iget-object v4, p2, Ll/u1l0$c;->n:Landroid/graphics/Paint$Cap;

    .line 303
    .line 304
    if-eqz v4, :cond_d

    .line 305
    .line 306
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 307
    .line 308
    .line 309
    :cond_d
    iget v4, p2, Ll/u1l0$c;->p:F

    .line 310
    .line 311
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p4}, Ll/xo5;->h()Z

    .line 315
    .line 316
    .line 317
    move-result v4

    .line 318
    if-eqz v4, :cond_e

    .line 319
    .line 320
    invoke-virtual {p4}, Ll/xo5;->f()Landroid/graphics/Shader;

    .line 321
    .line 322
    .line 323
    move-result-object p4

    .line 324
    iget-object p5, p0, Ll/u1l0$g;->c:Landroid/graphics/Matrix;

    .line 325
    .line 326
    invoke-virtual {p4, p5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 330
    .line 331
    .line 332
    iget p4, p2, Ll/u1l0$c;->i:F

    .line 333
    .line 334
    mul-float/2addr p4, v2

    .line 335
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    .line 336
    .line 337
    .line 338
    move-result p4

    .line 339
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 340
    .line 341
    .line 342
    goto :goto_4

    .line 343
    :cond_e
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p4}, Ll/xo5;->e()I

    .line 350
    .line 351
    .line 352
    move-result p4

    .line 353
    iget p5, p2, Ll/u1l0$c;->i:F

    .line 354
    .line 355
    invoke-static {p4, p5}, Ll/u1l0;->a(IF)I

    .line 356
    .line 357
    .line 358
    move-result p4

    .line 359
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 360
    .line 361
    .line 362
    :goto_4
    invoke-virtual {v3, p6}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 363
    .line 364
    .line 365
    mul-float/2addr v0, p1

    .line 366
    iget p1, p2, Ll/u1l0$c;->g:F

    .line 367
    .line 368
    mul-float/2addr p1, v0

    .line 369
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 370
    .line 371
    .line 372
    iget-object p0, p0, Ll/u1l0$g;->b:Landroid/graphics/Path;

    .line 373
    .line 374
    invoke-virtual {p3, p0, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 375
    .line 376
    .line 377
    :cond_f
    :goto_5
    return-void
.end method

.method public final e(Landroid/graphics/Matrix;)F
    .locals 8

    .line 1
    const/4 p0, 0x4

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->mapVectors([F)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    aget v0, p0, p1

    .line 12
    .line 13
    float-to-double v0, v0

    .line 14
    const/4 v2, 0x1

    .line 15
    aget v3, p0, v2

    .line 16
    .line 17
    float-to-double v3, v3

    .line 18
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    double-to-float v0, v0

    .line 23
    const/4 v1, 0x2

    .line 24
    aget v3, p0, v1

    .line 25
    .line 26
    float-to-double v3, v3

    .line 27
    const/4 v5, 0x3

    .line 28
    aget v6, p0, v5

    .line 29
    .line 30
    float-to-double v6, v6

    .line 31
    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->hypot(DD)D

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    double-to-float v3, v3

    .line 36
    aget p1, p0, p1

    .line 37
    .line 38
    aget v2, p0, v2

    .line 39
    .line 40
    aget v1, p0, v1

    .line 41
    .line 42
    aget p0, p0, v5

    .line 43
    .line 44
    invoke-static {p1, v2, v1, p0}, Ll/u1l0$g;->a(FFFF)F

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/4 v0, 0x0

    .line 53
    cmpl-float v1, p1, v0

    .line 54
    .line 55
    if-lez v1, :cond_0

    .line 56
    .line 57
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    div-float/2addr p0, p1

    .line 62
    return p0

    .line 63
    :cond_0
    return v0

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/u1l0$d;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/u1l0$g;->o:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public g([I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$g;->h:Ll/u1l0$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u1l0$d;->b([I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAlpha()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/u1l0$g;->getRootAlpha()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr p0, v0

    .line 9
    return p0
.end method

.method public getRootAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$g;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public setAlpha(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x437f0000    # 255.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    float-to-int p1, p1

    .line 5
    invoke-virtual {p0, p1}, Ll/u1l0$g;->setRootAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setRootAlpha(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u1l0$g;->m:I

    .line 2
    .line 3
    return-void
.end method
