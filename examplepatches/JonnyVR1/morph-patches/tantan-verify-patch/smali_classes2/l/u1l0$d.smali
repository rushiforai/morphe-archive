.class public Ll/u1l0$d;
.super Ll/u1l0$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Matrix;

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/u1l0$e;",
            ">;"
        }
    .end annotation
.end field

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public final j:Landroid/graphics/Matrix;

.field public k:I

.field public l:[I

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x0

    .line 170
    invoke-direct {p0, v0}, Ll/u1l0$e;-><init>(Ll/u1l0$a;)V

    .line 171
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 172
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 173
    iput v1, p0, Ll/u1l0$d;->c:F

    .line 174
    iput v1, p0, Ll/u1l0$d;->d:F

    .line 175
    iput v1, p0, Ll/u1l0$d;->e:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 176
    iput v2, p0, Ll/u1l0$d;->f:F

    .line 177
    iput v2, p0, Ll/u1l0$d;->g:F

    .line 178
    iput v1, p0, Ll/u1l0$d;->h:F

    .line 179
    iput v1, p0, Ll/u1l0$d;->i:F

    .line 180
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 181
    iput-object v0, p0, Ll/u1l0$d;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ll/u1l0$d;Ll/l01;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u1l0$d;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/u1l0$e;-><init>(Ll/u1l0$a;)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/graphics/Matrix;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Ll/u1l0$d;->a:Landroid/graphics/Matrix;

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput v1, p0, Ll/u1l0$d;->c:F

    .line 21
    .line 22
    iput v1, p0, Ll/u1l0$d;->d:F

    .line 23
    .line 24
    iput v1, p0, Ll/u1l0$d;->e:F

    .line 25
    .line 26
    const/high16 v2, 0x3f800000    # 1.0f

    .line 27
    .line 28
    iput v2, p0, Ll/u1l0$d;->f:F

    .line 29
    .line 30
    iput v2, p0, Ll/u1l0$d;->g:F

    .line 31
    .line 32
    iput v1, p0, Ll/u1l0$d;->h:F

    .line 33
    .line 34
    iput v1, p0, Ll/u1l0$d;->i:F

    .line 35
    .line 36
    new-instance v1, Landroid/graphics/Matrix;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 42
    .line 43
    iput-object v0, p0, Ll/u1l0$d;->m:Ljava/lang/String;

    .line 44
    .line 45
    iget v2, p1, Ll/u1l0$d;->c:F

    .line 46
    .line 47
    iput v2, p0, Ll/u1l0$d;->c:F

    .line 48
    .line 49
    iget v2, p1, Ll/u1l0$d;->d:F

    .line 50
    .line 51
    iput v2, p0, Ll/u1l0$d;->d:F

    .line 52
    .line 53
    iget v2, p1, Ll/u1l0$d;->e:F

    .line 54
    .line 55
    iput v2, p0, Ll/u1l0$d;->e:F

    .line 56
    .line 57
    iget v2, p1, Ll/u1l0$d;->f:F

    .line 58
    .line 59
    iput v2, p0, Ll/u1l0$d;->f:F

    .line 60
    .line 61
    iget v2, p1, Ll/u1l0$d;->g:F

    .line 62
    .line 63
    iput v2, p0, Ll/u1l0$d;->g:F

    .line 64
    .line 65
    iget v2, p1, Ll/u1l0$d;->h:F

    .line 66
    .line 67
    iput v2, p0, Ll/u1l0$d;->h:F

    .line 68
    .line 69
    iget v2, p1, Ll/u1l0$d;->i:F

    .line 70
    .line 71
    iput v2, p0, Ll/u1l0$d;->i:F

    .line 72
    .line 73
    iget-object v2, p1, Ll/u1l0$d;->l:[I

    .line 74
    .line 75
    iput-object v2, p0, Ll/u1l0$d;->l:[I

    .line 76
    .line 77
    iget-object v2, p1, Ll/u1l0$d;->m:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v2, p0, Ll/u1l0$d;->m:Ljava/lang/String;

    .line 80
    .line 81
    iget v3, p1, Ll/u1l0$d;->k:I

    .line 82
    .line 83
    iput v3, p0, Ll/u1l0$d;->k:I

    .line 84
    .line 85
    if-eqz v2, :cond_0

    .line 86
    .line 87
    invoke-virtual {p2, v2, p0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object v2, p1, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p1, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-ge v1, v2, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    instance-of v3, v2, Ll/u1l0$d;

    .line 109
    .line 110
    if-eqz v3, :cond_1

    .line 111
    .line 112
    check-cast v2, Ll/u1l0$d;

    .line 113
    .line 114
    iget-object v3, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 115
    .line 116
    new-instance v4, Ll/u1l0$d;

    .line 117
    .line 118
    invoke-direct {v4, v2, p2}, Ll/u1l0$d;-><init>(Ll/u1l0$d;Ll/l01;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_1
    instance-of v3, v2, Ll/u1l0$c;

    .line 126
    .line 127
    if-eqz v3, :cond_2

    .line 128
    .line 129
    new-instance v3, Ll/u1l0$c;

    .line 130
    .line 131
    check-cast v2, Ll/u1l0$c;

    .line 132
    .line 133
    invoke-direct {v3, v2}, Ll/u1l0$c;-><init>(Ll/u1l0$c;)V

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_2
    instance-of v3, v2, Ll/u1l0$b;

    .line 138
    .line 139
    if-eqz v3, :cond_4

    .line 140
    .line 141
    new-instance v3, Ll/u1l0$b;

    .line 142
    .line 143
    check-cast v2, Ll/u1l0$b;

    .line 144
    .line 145
    invoke-direct {v3, v2}, Ll/u1l0$b;-><init>(Ll/u1l0$b;)V

    .line 146
    .line 147
    .line 148
    :goto_1
    iget-object v2, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    iget-object v2, v3, Ll/u1l0$f;->b:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz v2, :cond_3

    .line 156
    .line 157
    invoke-virtual {p2, v2, v3}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    :cond_3
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_4
    const-string p0, "Unknown object in the tree!"

    .line 164
    .line 165
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :cond_5
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/u1l0$e;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/u1l0$e;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v0
.end method

.method public b([I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Ll/u1l0$d;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/u1l0$e;

    .line 18
    .line 19
    invoke-virtual {v2, p1}, Ll/u1l0$e;->b([I)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    or-int/2addr v1, v2

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return v1
.end method

.method public c(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 1

    .line 1
    sget-object v0, Ll/eo0;->b:[I

    .line 2
    .line 3
    invoke-static {p1, p3, p2, v0}, Ll/doj0;->k(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p4}, Ll/u1l0$d;->e(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 7
    .line 8
    iget v1, p0, Ll/u1l0$d;->d:F

    .line 9
    .line 10
    neg-float v1, v1

    .line 11
    iget v2, p0, Ll/u1l0$d;->e:F

    .line 12
    .line 13
    neg-float v2, v2

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 18
    .line 19
    iget v1, p0, Ll/u1l0$d;->f:F

    .line 20
    .line 21
    iget v2, p0, Ll/u1l0$d;->g:F

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 27
    .line 28
    iget v1, p0, Ll/u1l0$d;->c:F

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, v2, v2}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 35
    .line 36
    iget v1, p0, Ll/u1l0$d;->h:F

    .line 37
    .line 38
    iget v2, p0, Ll/u1l0$d;->d:F

    .line 39
    .line 40
    add-float/2addr v1, v2

    .line 41
    iget v2, p0, Ll/u1l0$d;->i:F

    .line 42
    .line 43
    iget p0, p0, Ll/u1l0$d;->e:F

    .line 44
    .line 45
    add-float/2addr v2, p0

    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final e(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/u1l0$d;->l:[I

    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    iget v1, p0, Ll/u1l0$d;->c:F

    .line 6
    .line 7
    const-string v2, "rotation"

    .line 8
    .line 9
    invoke-static {p1, p2, v2, v0, v1}, Ll/doj0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/u1l0$d;->c:F

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iget v1, p0, Ll/u1l0$d;->d:F

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/u1l0$d;->d:F

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    iget v1, p0, Ll/u1l0$d;->e:F

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Ll/u1l0$d;->e:F

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    iget v1, p0, Ll/u1l0$d;->f:F

    .line 35
    .line 36
    const-string v2, "scaleX"

    .line 37
    .line 38
    invoke-static {p1, p2, v2, v0, v1}, Ll/doj0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/u1l0$d;->f:F

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    iget v1, p0, Ll/u1l0$d;->g:F

    .line 46
    .line 47
    const-string v2, "scaleY"

    .line 48
    .line 49
    invoke-static {p1, p2, v2, v0, v1}, Ll/doj0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Ll/u1l0$d;->g:F

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    iget v1, p0, Ll/u1l0$d;->h:F

    .line 57
    .line 58
    const-string v2, "translateX"

    .line 59
    .line 60
    invoke-static {p1, p2, v2, v0, v1}, Ll/doj0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Ll/u1l0$d;->h:F

    .line 65
    .line 66
    const/4 v0, 0x7

    .line 67
    iget v1, p0, Ll/u1l0$d;->i:F

    .line 68
    .line 69
    const-string v2, "translateY"

    .line 70
    .line 71
    invoke-static {p1, p2, v2, v0, v1}, Ll/doj0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, p0, Ll/u1l0$d;->i:F

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_0

    .line 83
    .line 84
    iput-object p1, p0, Ll/u1l0$d;->m:Ljava/lang/String;

    .line 85
    .line 86
    :cond_0
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$d;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$d;->j:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPivotX()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public getPivotY()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public getRotation()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleX()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleY()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public getTranslateX()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getTranslateY()F
    .locals 0

    .line 1
    iget p0, p0, Ll/u1l0$d;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public setPivotX(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->d:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->d:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setPivotY(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->e:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->e:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setRotation(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->c:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->c:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setScaleX(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->f:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->f:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setScaleY(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->g:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->g:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setTranslateX(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->h:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->h:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setTranslateY(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u1l0$d;->i:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/u1l0$d;->i:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1l0$d;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
