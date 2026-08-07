.class public Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;,
        Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:Ljava/lang/StringBuilder;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Paint;

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Typeface;

.field public i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:[Landroid/graphics/PointF;

.field public r:Ll/x20;

.field public s:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "VerifyCodeView"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->a:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/a9c0;->j:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 23
    .line 24
    const-string v0, "#3d000000"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->k:I

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/a9c0;->j:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->l:I

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 46
    .line 47
    const/high16 v0, 0x40400000    # 3.0f

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 60
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 61
    const-string v0, "VerifyCodeView"

    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->a:Ljava/lang/String;

    .line 62
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Ll/a9c0;->j:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 64
    const-string v0, "#3d000000"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->k:I

    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Ll/a9c0;->j:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->l:I

    const/4 v0, 0x4

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    const/high16 v0, 0x40400000    # 3.0f

    .line 67
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 68
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 69
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    const-string p3, "VerifyCodeView"

    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->a:Ljava/lang/String;

    .line 71
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ll/a9c0;->j:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 73
    const-string p3, "#3d000000"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->k:I

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ll/a9c0;->j:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->l:I

    const/4 p3, 0x4

    .line 75
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    const/high16 p3, 0x40400000    # 3.0f

    .line 76
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 79
    const-string p3, "VerifyCodeView"

    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->a:Ljava/lang/String;

    .line 80
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget p4, Ll/a9c0;->j:I

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 82
    const-string p3, "#3d000000"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->k:I

    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget p4, Ll/a9c0;->j:I

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->l:I

    const/4 p3, 0x4

    .line 84
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    const/high16 p3, 0x40400000    # 3.0f

    .line 85
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 86
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 8

    .line 1
    new-array v0, p1, [Landroid/graphics/PointF;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->q:[Landroid/graphics/PointF;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    :goto_0
    if-gt v0, p1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->q:[Landroid/graphics/PointF;

    .line 9
    .line 10
    add-int/lit8 v2, v0, -0x1

    .line 11
    .line 12
    new-instance v3, Landroid/graphics/PointF;

    .line 13
    .line 14
    iget v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->n:I

    .line 15
    .line 16
    mul-int v5, v2, v4

    .line 17
    .line 18
    iget v6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->o:I

    .line 19
    .line 20
    mul-int v7, v2, v6

    .line 21
    .line 22
    add-int/2addr v5, v7

    .line 23
    int-to-float v5, v5

    .line 24
    mul-int/2addr v4, v2

    .line 25
    mul-int/2addr v6, v0

    .line 26
    add-int/2addr v4, v6

    .line 27
    int-to-float v4, v4

    .line 28
    invoke-direct {v3, v5, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 29
    .line 30
    .line 31
    aput-object v3, v1, v2

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c:I

    .line 20
    .line 21
    div-int/lit8 v3, v3, 0x2

    .line 22
    .line 23
    iget v4, v2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 24
    .line 25
    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 26
    .line 27
    sub-int v2, v4, v2

    .line 28
    .line 29
    div-int/lit8 v2, v2, 0x2

    .line 30
    .line 31
    add-int/2addr v3, v2

    .line 32
    sub-int/2addr v3, v4

    .line 33
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 34
    .line 35
    add-int/2addr v2, v3

    .line 36
    iput v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->s:I

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    move v6, v2

    .line 40
    :goto_0
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 41
    .line 42
    if-ge v6, v2, :cond_4

    .line 43
    .line 44
    if-le v1, v6, :cond_1

    .line 45
    .line 46
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    add-int/lit8 v7, v6, 0x1

    .line 53
    .line 54
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->q:[Landroid/graphics/PointF;

    .line 55
    .line 56
    aget-object v2, v2, v6

    .line 57
    .line 58
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 59
    .line 60
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->o:I

    .line 61
    .line 62
    div-int/lit8 v4, v4, 0x2

    .line 63
    .line 64
    int-to-float v4, v4

    .line 65
    sub-float v8, v2, v4

    .line 66
    .line 67
    add-int/lit8 v2, v3, -0xa

    .line 68
    .line 69
    int-to-float v9, v2

    .line 70
    iget-object v10, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 71
    .line 72
    move-object/from16 v4, p1

    .line 73
    .line 74
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-ne v6, v2, :cond_2

    .line 84
    .line 85
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->q:[Landroid/graphics/PointF;

    .line 86
    .line 87
    aget-object v2, v2, v6

    .line 88
    .line 89
    iget v12, v2, Landroid/graphics/PointF;->x:F

    .line 90
    .line 91
    iget v14, v2, Landroid/graphics/PointF;->y:F

    .line 92
    .line 93
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c:I

    .line 94
    .line 95
    int-to-float v15, v2

    .line 96
    const/high16 v2, 0x40000000    # 2.0f

    .line 97
    .line 98
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    int-to-float v4, v4

    .line 103
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    int-to-float v2, v2

    .line 108
    iget-object v5, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->f:Landroid/graphics/Paint;

    .line 109
    .line 110
    const/4 v13, 0x0

    .line 111
    move-object/from16 v11, p1

    .line 112
    .line 113
    move/from16 v17, v2

    .line 114
    .line 115
    move/from16 v16, v4

    .line 116
    .line 117
    move-object/from16 v18, v5

    .line 118
    .line 119
    invoke-virtual/range {v11 .. v18}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->e:Landroid/graphics/Paint;

    .line 129
    .line 130
    if-gt v6, v2, :cond_3

    .line 131
    .line 132
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->l:I

    .line 133
    .line 134
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->k:I

    .line 139
    .line 140
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    .line 142
    .line 143
    :goto_1
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->q:[Landroid/graphics/PointF;

    .line 144
    .line 145
    aget-object v2, v2, v6

    .line 146
    .line 147
    iget v4, v2, Landroid/graphics/PointF;->x:F

    .line 148
    .line 149
    iget v5, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 150
    .line 151
    div-int/lit8 v7, v5, 0x2

    .line 152
    .line 153
    int-to-float v7, v7

    .line 154
    add-float v12, v4, v7

    .line 155
    .line 156
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c:I

    .line 157
    .line 158
    div-int/lit8 v7, v5, 0x2

    .line 159
    .line 160
    sub-int v7, v4, v7

    .line 161
    .line 162
    int-to-float v13, v7

    .line 163
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 164
    .line 165
    div-int/lit8 v7, v5, 0x2

    .line 166
    .line 167
    int-to-float v7, v7

    .line 168
    sub-float v14, v2, v7

    .line 169
    .line 170
    div-int/lit8 v5, v5, 0x2

    .line 171
    .line 172
    sub-int/2addr v4, v5

    .line 173
    int-to-float v15, v4

    .line 174
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->e:Landroid/graphics/Paint;

    .line 175
    .line 176
    move-object/from16 v11, p1

    .line 177
    .line 178
    move-object/from16 v16, v2

    .line 179
    .line 180
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 181
    .line 182
    .line 183
    add-int/lit8 v6, v6, 0x1

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_4
    :goto_2
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "input_method"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final d(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 11
    .line 12
    :cond_0
    new-instance p1, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->e:Landroid/graphics/Paint;

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->e:Landroid/graphics/Paint;

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->p:I

    .line 26
    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->e:Landroid/graphics/Paint;

    .line 32
    .line 33
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->f:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->f:Landroid/graphics/Paint;

    .line 51
    .line 52
    const-string v0, "#14d2432e"

    .line 53
    .line 54
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->f:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 64
    .line 65
    .line 66
    new-instance p1, Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 72
    .line 73
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 79
    .line 80
    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 86
    .line 87
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public getNumberSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    iput-object p0, p1, Landroid/view/inputmethod/EditorInfo;->actionLabel:Ljava/lang/CharSequence;

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    iput p0, p1, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    iput p0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    .line 15
    .line 16
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->b(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 11
    .line 12
    :cond_0
    const/16 v0, 0x43

    .line 13
    .line 14
    if-ne p1, v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/lit8 v1, v1, -0x1

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v0, 0x7

    .line 59
    if-lt p1, v0, :cond_4

    .line 60
    .line 61
    const/16 v0, 0x10

    .line 62
    .line 63
    if-gt p1, v0, :cond_4

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 72
    .line 73
    if-ge v0, v1, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 76
    .line 77
    add-int/lit8 v1, p1, -0x7

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 102
    .line 103
    .line 104
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 111
    .line 112
    if-lt v0, v1, :cond_5

    .line 113
    .line 114
    const/4 v0, 0x4

    .line 115
    if-eq p1, v0, :cond_5

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->r:Ll/x20;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->r:Ll/x20;

    .line 126
    .line 127
    invoke-interface {v0}, Ll/x20;->call()V

    .line 128
    .line 129
    .line 130
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    return p0
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42400000    # 48.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    mul-int/lit8 p2, p2, 0x4

    .line 11
    .line 12
    const/high16 v0, 0x41800000    # 16.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    mul-int/lit8 v0, v0, 0x3

    .line 19
    .line 20
    add-int/2addr p2, v0

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->b:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c:I

    .line 28
    .line 29
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->b:I

    .line 30
    .line 31
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 32
    .line 33
    mul-int/lit8 v0, p2, 0x4

    .line 34
    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    div-int v0, p1, v0

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->n:I

    .line 40
    .line 41
    mul-int/lit8 p2, p2, 0x4

    .line 42
    .line 43
    add-int/lit8 p2, p2, -0x1

    .line 44
    .line 45
    div-int/2addr p1, p2

    .line 46
    mul-int/lit8 p1, p1, 0x3

    .line 47
    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->o:I

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 51
    .line 52
    const-string p2, "account"

    .line 53
    .line 54
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 55
    .line 56
    invoke-static {p1, p2, v0}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->g:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/16 p2, 0x1c

    .line 65
    .line 66
    invoke-static {p2}, Ll/qa00;->f(I)I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    int-to-float p2, p2

    .line 71
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->a(I)V

    .line 77
    .line 78
    .line 79
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->b:I

    .line 80
    .line 81
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c:I

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "input_method"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p1, p0, v0}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public setFont(Landroid/graphics/Typeface;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    return-void
.end method

.method public setFont(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->h:Landroid/graphics/Typeface;

    .line 18
    .line 19
    return-void
.end method

.method public setListener(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 2
    .line 3
    return-void
.end method

.method public setNumberSize(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->m:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const-string p0, "Text size must more than 1!"

    .line 8
    .line 9
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setOnCompleteAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->r:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-gt v0, v1, :cond_2

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->i:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->d:Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-ne p1, v1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->r:Ll/x20;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->r:Ll/x20;

    .line 57
    .line 58
    invoke-interface {p0}, Ll/x20;->call()V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void

    .line 62
    :cond_2
    const-string p0, "Code must less than 4 letters!"

    .line 63
    .line 64
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    const-string p0, "Code must not null!"

    .line 69
    .line 70
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public setTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->j:I

    .line 2
    .line 3
    return-void
.end method
