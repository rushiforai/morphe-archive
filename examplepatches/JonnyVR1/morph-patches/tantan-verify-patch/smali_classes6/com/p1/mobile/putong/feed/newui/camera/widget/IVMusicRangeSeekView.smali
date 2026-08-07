.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# static fields
.field public static final u:I

.field public static final v:I


# instance fields
.field public a:[Ljava/lang/Integer;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroid/graphics/Paint;

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:Landroid/graphics/RectF;

.field public m:Landroid/graphics/RectF;

.field public n:I

.field public o:Landroid/view/GestureDetector;

.field public p:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public q:Landroid/graphics/RectF;

.field public r:Landroid/graphics/Path;

.field public s:Landroid/graphics/RectF;

.field public t:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41b00000    # 22.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->u:I

    .line 8
    .line 9
    const/high16 v0, 0x41c80000    # 25.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->v:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct/range {p0 .. p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x20

    .line 7
    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/16 v1, 0x2c

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const/16 v1, 0x24

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const/16 v1, 0x38

    .line 25
    .line 26
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const/16 v1, 0x12

    .line 31
    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    const/16 v1, 0x1a

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    const/16 v1, 0x46

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    const/16 v1, 0x3a

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v12

    .line 54
    const/16 v1, 0x26

    .line 55
    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v13

    .line 60
    const/16 v1, 0x19

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v14

    .line 66
    const/16 v1, 0x2e

    .line 67
    .line 68
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v15

    .line 72
    const/16 v1, 0x22

    .line 73
    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v16

    .line 78
    const/16 v1, 0x2a

    .line 79
    .line 80
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v17

    .line 84
    const/16 v1, 0x30

    .line 85
    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v21

    .line 90
    const/16 v1, 0x40

    .line 91
    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v22

    .line 96
    const/16 v1, 0x28

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v23

    .line 102
    const/16 v1, 0x1e

    .line 103
    .line 104
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v24

    .line 108
    const/16 v1, 0x32

    .line 109
    .line 110
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v35

    .line 114
    move-object v6, v3

    .line 115
    move-object v9, v5

    .line 116
    move-object v10, v3

    .line 117
    move-object/from16 v18, v5

    .line 118
    .line 119
    move-object/from16 v19, v3

    .line 120
    .line 121
    move-object/from16 v20, v4

    .line 122
    .line 123
    move-object/from16 v25, v13

    .line 124
    .line 125
    move-object/from16 v26, v12

    .line 126
    .line 127
    move-object/from16 v27, v24

    .line 128
    .line 129
    move-object/from16 v28, v5

    .line 130
    .line 131
    move-object/from16 v29, v4

    .line 132
    .line 133
    move-object/from16 v30, v17

    .line 134
    .line 135
    move-object/from16 v31, v12

    .line 136
    .line 137
    move-object/from16 v32, v11

    .line 138
    .line 139
    move-object/from16 v33, v3

    .line 140
    .line 141
    move-object/from16 v34, v16

    .line 142
    .line 143
    filled-new-array/range {v2 .. v35}, [Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a:[Ljava/lang/Integer;

    .line 148
    .line 149
    const/high16 v1, 0x40000000    # 2.0f

    .line 150
    .line 151
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 156
    .line 157
    const/high16 v1, 0x40800000    # 4.0f

    .line 158
    .line 159
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d:I

    .line 164
    .line 165
    iget v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 166
    .line 167
    add-int/2addr v2, v1

    .line 168
    iput v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d()V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 36

    move-object/from16 v0, p0

    .line 174
    invoke-direct/range {p0 .. p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 v1, 0x20

    .line 175
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v1, 0x38

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v1, 0x46

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v1, 0x3a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v1, 0x2a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v1, 0x30

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const/16 v1, 0x40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v1, 0x32

    .line 176
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    move-object v6, v3

    move-object v9, v5

    move-object v10, v3

    move-object/from16 v18, v5

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v25, v13

    move-object/from16 v26, v12

    move-object/from16 v27, v24

    move-object/from16 v28, v5

    move-object/from16 v29, v4

    move-object/from16 v30, v17

    move-object/from16 v31, v12

    move-object/from16 v32, v11

    move-object/from16 v33, v3

    move-object/from16 v34, v16

    filled-new-array/range {v2 .. v35}, [Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a:[Ljava/lang/Integer;

    const/high16 v1, 0x40000000    # 2.0f

    .line 177
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    const/high16 v1, 0x40800000    # 4.0f

    .line 178
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d:I

    .line 179
    iget v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    add-int/2addr v2, v1

    iput v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 180
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 36

    move-object/from16 v0, p0

    .line 181
    invoke-direct/range {p0 .. p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v1, 0x20

    .line 182
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v1, 0x38

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v1, 0x46

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v1, 0x3a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v1, 0x2a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v1, 0x30

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const/16 v1, 0x40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v1, 0x32

    .line 183
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    move-object v6, v3

    move-object v9, v5

    move-object v10, v3

    move-object/from16 v18, v5

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v25, v13

    move-object/from16 v26, v12

    move-object/from16 v27, v24

    move-object/from16 v28, v5

    move-object/from16 v29, v4

    move-object/from16 v30, v17

    move-object/from16 v31, v12

    move-object/from16 v32, v11

    move-object/from16 v33, v3

    move-object/from16 v34, v16

    filled-new-array/range {v2 .. v35}, [Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a:[Ljava/lang/Integer;

    const/high16 v1, 0x40000000    # 2.0f

    .line 184
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    const/high16 v1, 0x40800000    # 4.0f

    .line 185
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d:I

    .line 186
    iget v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    add-int/2addr v2, v1

    iput v2, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 187
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 24
    .line 25
    mul-int/2addr p2, v0

    .line 26
    add-int/2addr p2, p4

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 28
    .line 29
    const/high16 v1, 0x41c00000    # 24.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    sub-int v2, p2, v2

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sget v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->u:I

    .line 47
    .line 48
    sub-int/2addr v2, v3

    .line 49
    add-int/lit8 v2, v2, -0x2

    .line 50
    .line 51
    int-to-float v2, v2

    .line 52
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 55
    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    add-int/2addr v2, p2

    .line 61
    int-to-float v2, v2

    .line 62
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    add-int/lit8 v2, v2, -0x2

    .line 71
    .line 72
    int-to-float v2, v2

    .line 73
    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 76
    .line 77
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    sub-int v1, p2, v1

    .line 82
    .line 83
    int-to-float v1, v1

    .line 84
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 87
    .line 88
    const/high16 v1, 0x3f800000    # 1.0f

    .line 89
    .line 90
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 91
    .line 92
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 93
    .line 94
    mul-int/2addr p3, v2

    .line 95
    add-int/2addr p3, p4

    .line 96
    int-to-float p3, p3

    .line 97
    iput p3, v0, Landroid/graphics/RectF;->right:F

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    add-int/lit8 p3, p3, 0x2

    .line 104
    .line 105
    int-to-float p3, p3

    .line 106
    iput p3, v0, Landroid/graphics/RectF;->bottom:F

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    sget p4, Ll/k9c0;->n:I

    .line 113
    .line 114
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    invoke-virtual {p5, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 122
    .line 123
    iget p4, p3, Landroid/graphics/RectF;->bottom:F

    .line 124
    .line 125
    iget v0, p3, Landroid/graphics/RectF;->top:F

    .line 126
    .line 127
    sub-float v2, p4, v0

    .line 128
    .line 129
    const/high16 v3, 0x40000000    # 2.0f

    .line 130
    .line 131
    div-float/2addr v2, v3

    .line 132
    sub-float/2addr p4, v0

    .line 133
    div-float/2addr p4, v3

    .line 134
    invoke-virtual {p1, p3, v2, p4, p5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 138
    .line 139
    if-nez p3, :cond_2

    .line 140
    .line 141
    new-instance p3, Landroid/graphics/Path;

    .line 142
    .line 143
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 144
    .line 145
    .line 146
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 147
    .line 148
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 149
    .line 150
    invoke-virtual {p3}, Landroid/graphics/Path;->reset()V

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 154
    .line 155
    int-to-float p4, p2

    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 157
    .line 158
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 159
    .line 160
    const/high16 v2, 0x40400000    # 3.0f

    .line 161
    .line 162
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    int-to-float v4, v4

    .line 167
    sub-float/2addr v0, v4

    .line 168
    invoke-virtual {p3, p4, v0}, Landroid/graphics/Path;->moveTo(FF)V

    .line 169
    .line 170
    .line 171
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 172
    .line 173
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result p4

    .line 177
    sub-int p4, p2, p4

    .line 178
    .line 179
    int-to-float p4, p4

    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 181
    .line 182
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 183
    .line 184
    invoke-virtual {p3, p4, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 185
    .line 186
    .line 187
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 188
    .line 189
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 190
    .line 191
    .line 192
    move-result p4

    .line 193
    add-int/2addr p4, p2

    .line 194
    int-to-float p4, p4

    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 196
    .line 197
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 198
    .line 199
    invoke-virtual {p3, p4, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 200
    .line 201
    .line 202
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 203
    .line 204
    invoke-virtual {p3}, Landroid/graphics/Path;->close()V

    .line 205
    .line 206
    .line 207
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 208
    .line 209
    invoke-virtual {p1, p3, p5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    const-string p3, "#33000000"

    .line 213
    .line 214
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result p3

    .line 218
    invoke-virtual {p5, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 219
    .line 220
    .line 221
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 222
    .line 223
    if-nez p3, :cond_3

    .line 224
    .line 225
    new-instance p3, Landroid/graphics/RectF;

    .line 226
    .line 227
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 228
    .line 229
    .line 230
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 231
    .line 232
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 233
    .line 234
    const/high16 p4, 0x40e00000    # 7.0f

    .line 235
    .line 236
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    sub-int v0, p2, v0

    .line 241
    .line 242
    int-to-float v0, v0

    .line 243
    iput v0, p3, Landroid/graphics/RectF;->left:F

    .line 244
    .line 245
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 246
    .line 247
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    int-to-float v0, v0

    .line 252
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 253
    .line 254
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    mul-float/2addr v3, v2

    .line 259
    const/high16 v2, 0x40800000    # 4.0f

    .line 260
    .line 261
    div-float/2addr v3, v2

    .line 262
    sub-float/2addr v0, v3

    .line 263
    iput v0, p3, Landroid/graphics/RectF;->top:F

    .line 264
    .line 265
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 266
    .line 267
    const/high16 v0, 0x40a00000    # 5.0f

    .line 268
    .line 269
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    sub-int v3, p2, v3

    .line 274
    .line 275
    int-to-float v3, v3

    .line 276
    iput v3, p3, Landroid/graphics/RectF;->right:F

    .line 277
    .line 278
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 279
    .line 280
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    int-to-float v3, v3

    .line 285
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 286
    .line 287
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    div-float/2addr v4, v2

    .line 292
    sub-float/2addr v3, v4

    .line 293
    iput v3, p3, Landroid/graphics/RectF;->bottom:F

    .line 294
    .line 295
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 296
    .line 297
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    int-to-float v2, v2

    .line 302
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    int-to-float v3, v3

    .line 307
    invoke-virtual {p1, p3, v2, v3, p5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 308
    .line 309
    .line 310
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 311
    .line 312
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    sub-int v2, p2, v2

    .line 317
    .line 318
    int-to-float v2, v2

    .line 319
    iput v2, p3, Landroid/graphics/RectF;->left:F

    .line 320
    .line 321
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 322
    .line 323
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    add-int/2addr v2, p2

    .line 328
    int-to-float v2, v2

    .line 329
    iput v2, p3, Landroid/graphics/RectF;->right:F

    .line 330
    .line 331
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 332
    .line 333
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    int-to-float v2, v2

    .line 338
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    int-to-float v3, v3

    .line 343
    invoke-virtual {p1, p3, v2, v3, p5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 344
    .line 345
    .line 346
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 347
    .line 348
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    add-int/2addr v0, p2

    .line 353
    int-to-float v0, v0

    .line 354
    iput v0, p3, Landroid/graphics/RectF;->left:F

    .line 355
    .line 356
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 357
    .line 358
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 359
    .line 360
    .line 361
    move-result p4

    .line 362
    add-int/2addr p2, p4

    .line 363
    int-to-float p2, p2

    .line 364
    iput p2, p3, Landroid/graphics/RectF;->right:F

    .line 365
    .line 366
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->q:Landroid/graphics/RectF;

    .line 367
    .line 368
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result p2

    .line 372
    int-to-float p2, p2

    .line 373
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 374
    .line 375
    .line 376
    move-result p3

    .line 377
    int-to-float p3, p3

    .line 378
    invoke-virtual {p1, p0, p2, p3, p5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 379
    .line 380
    .line 381
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V
    .locals 6

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    new-instance p3, Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 12
    .line 13
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 14
    .line 15
    const/high16 v0, 0x41400000    # 12.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 26
    .line 27
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 28
    .line 29
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 33
    .line 34
    const-string v0, "#ffffff"

    .line 35
    .line 36
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    new-instance p3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, "/"

    .line 58
    .line 59
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 82
    .line 83
    if-nez v1, :cond_1

    .line 84
    .line 85
    new-instance v1, Landroid/graphics/RectF;

    .line 86
    .line 87
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 91
    .line 92
    :cond_1
    const/high16 v1, 0x40a00000    # 5.0f

    .line 93
    .line 94
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 99
    .line 100
    mul-int/2addr v2, p2

    .line 101
    int-to-float v2, v2

    .line 102
    add-float/2addr v2, v0

    .line 103
    mul-int/lit8 v3, v1, 0x2

    .line 104
    .line 105
    int-to-float v3, v3

    .line 106
    add-float/2addr v2, v3

    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    int-to-float v4, v4

    .line 112
    cmpl-float v2, v2, v4

    .line 113
    .line 114
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 115
    .line 116
    if-lez v2, :cond_2

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    int-to-float v2, v2

    .line 123
    sub-float/2addr v2, v0

    .line 124
    sub-float/2addr v2, v3

    .line 125
    iput v2, v4, Landroid/graphics/RectF;->left:F

    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    int-to-float v2, v2

    .line 134
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 138
    .line 139
    mul-int v5, p2, v2

    .line 140
    .line 141
    add-int/2addr v5, p4

    .line 142
    int-to-float v5, v5

    .line 143
    iput v5, v4, Landroid/graphics/RectF;->left:F

    .line 144
    .line 145
    mul-int/2addr v2, p2

    .line 146
    int-to-float v2, v2

    .line 147
    add-float/2addr v2, v0

    .line 148
    add-float/2addr v2, v3

    .line 149
    int-to-float v0, p4

    .line 150
    add-float/2addr v2, v0

    .line 151
    iput v2, v4, Landroid/graphics/RectF;->right:F

    .line 152
    .line 153
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 154
    .line 155
    const/4 v2, 0x0

    .line 156
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 157
    .line 158
    sget v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->v:I

    .line 159
    .line 160
    int-to-float v3, v2

    .line 161
    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 162
    .line 163
    const-string v0, "#b3000000"

    .line 164
    .line 165
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-virtual {p5, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 173
    .line 174
    const/high16 v3, 0x40000000    # 2.0f

    .line 175
    .line 176
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    int-to-float v4, v4

    .line 181
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    int-to-float v3, v3

    .line 186
    invoke-virtual {p1, v0, v4, v3, p5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->s:Landroid/graphics/RectF;

    .line 190
    .line 191
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 192
    .line 193
    int-to-float v3, v1

    .line 194
    add-float/2addr v0, v3

    .line 195
    mul-int/lit8 v3, v2, 0x2

    .line 196
    .line 197
    div-int/lit8 v3, v3, 0x3

    .line 198
    .line 199
    int-to-float v3, v3

    .line 200
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 201
    .line 202
    invoke-virtual {p1, p3, v0, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 203
    .line 204
    .line 205
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 206
    .line 207
    if-nez p3, :cond_3

    .line 208
    .line 209
    new-instance p3, Landroid/graphics/Path;

    .line 210
    .line 211
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 212
    .line 213
    .line 214
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 215
    .line 216
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 217
    .line 218
    invoke-virtual {p3}, Landroid/graphics/Path;->reset()V

    .line 219
    .line 220
    .line 221
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 222
    .line 223
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 224
    .line 225
    mul-int/2addr v0, p2

    .line 226
    add-int/2addr v0, v1

    .line 227
    add-int/2addr v0, p4

    .line 228
    int-to-float v0, v0

    .line 229
    int-to-float v3, v2

    .line 230
    invoke-virtual {p3, v0, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 231
    .line 232
    .line 233
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 234
    .line 235
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 236
    .line 237
    mul-int/2addr v0, p2

    .line 238
    add-int/2addr v0, v1

    .line 239
    const/high16 v3, 0x41000000    # 8.0f

    .line 240
    .line 241
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    add-int/2addr v0, v3

    .line 246
    add-int/2addr v0, p4

    .line 247
    int-to-float v0, v0

    .line 248
    int-to-float v3, v2

    .line 249
    invoke-virtual {p3, v0, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 250
    .line 251
    .line 252
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 253
    .line 254
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 255
    .line 256
    mul-int/2addr p2, v0

    .line 257
    add-int/2addr p2, v1

    .line 258
    const/high16 v0, 0x40800000    # 4.0f

    .line 259
    .line 260
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    add-int/2addr p2, v1

    .line 265
    add-int/2addr p2, p4

    .line 266
    int-to-float p2, p2

    .line 267
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 268
    .line 269
    .line 270
    move-result p4

    .line 271
    add-int/2addr v2, p4

    .line 272
    int-to-float p4, v2

    .line 273
    invoke-virtual {p3, p2, p4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 274
    .line 275
    .line 276
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 277
    .line 278
    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    .line 279
    .line 280
    .line 281
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->r:Landroid/graphics/Path;

    .line 282
    .line 283
    invoke-virtual {p1, p0, p5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method public final c(I)Ljava/lang/String;
    .locals 4

    .line 1
    div-int/lit16 p1, p1, 0x3e8

    .line 2
    .line 3
    div-int/lit8 p0, p1, 0x3c

    .line 4
    .line 5
    rem-int/lit8 p1, p1, 0x3c

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    const/16 v2, 0xa

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    if-lt p0, v2, :cond_0

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :goto_1
    if-lt p1, v2, :cond_1

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_2

    .line 56
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_2
    const-string v0, "%s:%s"

    .line 69
    .line 70
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public final d()V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->o:Landroid/view/GestureDetector;

    .line 7
    .line 8
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 14
    .line 15
    const/high16 v1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 26
    .line 27
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 33
    .line 34
    const-string v1, "#ffffff"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    cmpl-float v4, v1, v3

    .line 67
    .line 68
    if-lez v4, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move v1, v3

    .line 72
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    sget v4, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->u:I

    .line 77
    .line 78
    sub-int/2addr v3, v4

    .line 79
    sget v4, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->v:I

    .line 80
    .line 81
    sub-int/2addr v3, v4

    .line 82
    div-int/lit8 v3, v3, 0x2

    .line 83
    .line 84
    add-int/2addr v3, v4

    .line 85
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 86
    .line 87
    int-to-float v4, v4

    .line 88
    int-to-float v3, v3

    .line 89
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 90
    .line 91
    invoke-virtual {p1, v0, v4, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 99
    .line 100
    sub-int/2addr v0, v4

    .line 101
    int-to-float v0, v0

    .line 102
    sub-float/2addr v0, v1

    .line 103
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->t:Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-virtual {p1, v2, v0, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 106
    .line 107
    .line 108
    float-to-int p1, v1

    .line 109
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 110
    .line 111
    mul-int/lit8 p0, p0, 0x2

    .line 112
    .line 113
    add-int/2addr p1, p0

    .line 114
    return p1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v2, 0x41200000    # 10.0f

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 20
    .line 21
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 22
    .line 23
    sub-float/2addr v3, v2

    .line 24
    cmpg-float v0, v0, v3

    .line 25
    .line 26
    if-ltz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 33
    .line 34
    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 35
    .line 36
    add-float/2addr v3, v2

    .line 37
    cmpl-float v0, v0, v3

    .line 38
    .line 39
    if-gtz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 46
    .line 47
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 48
    .line 49
    sub-float/2addr v3, v2

    .line 50
    cmpg-float v0, v0, v3

    .line 51
    .line 52
    if-ltz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->m:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 61
    .line 62
    add-float/2addr v3, v2

    .line 63
    cmpl-float v0, v0, v3

    .line 64
    .line 65
    if-gtz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 72
    .line 73
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 74
    .line 75
    sub-float/2addr v3, v2

    .line 76
    cmpg-float v0, v0, v3

    .line 77
    .line 78
    if-ltz v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 85
    .line 86
    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 87
    .line 88
    add-float/2addr v3, v2

    .line 89
    cmpl-float v0, v0, v3

    .line 90
    .line 91
    if-gtz v0, :cond_1

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 98
    .line 99
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 100
    .line 101
    sub-float/2addr v3, v2

    .line 102
    cmpg-float v0, v0, v3

    .line 103
    .line 104
    if-ltz v0, :cond_1

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 111
    .line 112
    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 113
    .line 114
    add-float/2addr v3, v2

    .line 115
    cmpl-float v0, v0, v3

    .line 116
    .line 117
    if-lez v0, :cond_2

    .line 118
    .line 119
    :cond_1
    return v1

    .line 120
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 131
    .line 132
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 133
    .line 134
    sub-float/2addr v3, v2

    .line 135
    cmpg-float v0, v0, v3

    .line 136
    .line 137
    if-ltz v0, :cond_3

    .line 138
    .line 139
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 144
    .line 145
    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 146
    .line 147
    add-float/2addr v3, v2

    .line 148
    cmpl-float v0, v0, v3

    .line 149
    .line 150
    if-gtz v0, :cond_3

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 157
    .line 158
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 159
    .line 160
    sub-float/2addr v3, v2

    .line 161
    cmpg-float v0, v0, v3

    .line 162
    .line 163
    if-ltz v0, :cond_3

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->l:Landroid/graphics/RectF;

    .line 170
    .line 171
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 172
    .line 173
    add-float/2addr v0, v2

    .line 174
    cmpl-float p1, p1, v0

    .line 175
    .line 176
    if-lez p1, :cond_4

    .line 177
    .line 178
    :cond_3
    return v1

    .line 179
    :cond_4
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 180
    .line 181
    if-nez p0, :cond_5

    .line 182
    .line 183
    return v1

    .line 184
    :cond_5
    const/4 p0, 0x1

    .line 185
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e(Landroid/graphics/Canvas;)I

    .line 5
    .line 6
    .line 7
    move-result v4

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    mul-int/lit8 v2, v4, 0x2

    .line 25
    .line 26
    sub-int/2addr v0, v2

    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 28
    .line 29
    div-int/2addr v0, v2

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->i:I

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sget v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->u:I

    .line 37
    .line 38
    sub-int/2addr v0, v2

    .line 39
    sget v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->v:I

    .line 40
    .line 41
    sub-int/2addr v0, v2

    .line 42
    div-int/lit8 v0, v0, 0x2

    .line 43
    .line 44
    add-int/2addr v0, v2

    .line 45
    move v2, v1

    .line 46
    move v3, v2

    .line 47
    :goto_0
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->i:I

    .line 48
    .line 49
    if-ge v2, v5, :cond_1

    .line 50
    .line 51
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 52
    .line 53
    mul-int/2addr v5, v3

    .line 54
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->c:I

    .line 55
    .line 56
    add-int/2addr v5, v6

    .line 57
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->d:I

    .line 58
    .line 59
    add-int/2addr v6, v5

    .line 60
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a:[Ljava/lang/Integer;

    .line 61
    .line 62
    array-length v8, v7

    .line 63
    if-lt v2, v8, :cond_0

    .line 64
    .line 65
    array-length v8, v7

    .line 66
    rem-int v8, v2, v8

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    move v8, v2

    .line 70
    :goto_1
    aget-object v7, v7, v8

    .line 71
    .line 72
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    div-int/lit8 v7, v7, 0x2

    .line 77
    .line 78
    int-to-float v7, v7

    .line 79
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    sub-int v7, v0, v7

    .line 84
    .line 85
    iget-object v9, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a:[Ljava/lang/Integer;

    .line 86
    .line 87
    aget-object v8, v9, v8

    .line 88
    .line 89
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    div-int/lit8 v8, v8, 0x2

    .line 94
    .line 95
    int-to-float v8, v8

    .line 96
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    add-int/2addr v8, v0

    .line 101
    iget-object v9, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 102
    .line 103
    new-instance v10, Landroid/graphics/RectF;

    .line 104
    .line 105
    add-int/2addr v5, v4

    .line 106
    int-to-float v5, v5

    .line 107
    int-to-float v7, v7

    .line 108
    add-int/2addr v6, v4

    .line 109
    int-to-float v6, v6

    .line 110
    int-to-float v8, v8

    .line 111
    invoke-direct {v10, v5, v7, v6, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    add-int/lit8 v3, v3, 0x1

    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 123
    .line 124
    const-string v2, "#ffffff"

    .line 125
    .line 126
    const/4 v3, 0x1

    .line 127
    if-nez v0, :cond_2

    .line 128
    .line 129
    new-instance v0, Landroid/graphics/Paint;

    .line 130
    .line 131
    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 132
    .line 133
    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 135
    .line 136
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 137
    .line 138
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 142
    .line 143
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 148
    .line 149
    .line 150
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 151
    .line 152
    if-eqz v0, :cond_6

    .line 153
    .line 154
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 155
    .line 156
    if-eqz v5, :cond_6

    .line 157
    .line 158
    int-to-float v6, v5

    .line 159
    int-to-float v7, v0

    .line 160
    div-float/2addr v6, v7

    .line 161
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->i:I

    .line 162
    .line 163
    int-to-float v8, v7

    .line 164
    mul-float/2addr v6, v8

    .line 165
    float-to-int v6, v6

    .line 166
    if-nez v6, :cond_3

    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_3
    move v3, v6

    .line 170
    :goto_2
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 171
    .line 172
    int-to-float v8, v6

    .line 173
    int-to-float v9, v0

    .line 174
    div-float/2addr v8, v9

    .line 175
    int-to-float v9, v7

    .line 176
    mul-float/2addr v8, v9

    .line 177
    float-to-int v8, v8

    .line 178
    sub-int v9, v7, v3

    .line 179
    .line 180
    if-ge v8, v9, :cond_4

    .line 181
    .line 182
    add-int/2addr v6, v5

    .line 183
    if-lt v6, v0, :cond_5

    .line 184
    .line 185
    :cond_4
    sub-int v8, v7, v3

    .line 186
    .line 187
    :cond_5
    add-int v0, v8, v3

    .line 188
    .line 189
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->e:I

    .line 190
    .line 191
    mul-int/2addr v3, v5

    .line 192
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->k:I

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_6
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->i:I

    .line 196
    .line 197
    move v8, v1

    .line 198
    :goto_3
    if-gez v8, :cond_7

    .line 199
    .line 200
    move v8, v1

    .line 201
    :cond_7
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->i:I

    .line 202
    .line 203
    if-le v0, v3, :cond_8

    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_8
    move v3, v0

    .line 207
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-ge v1, v0, :cond_a

    .line 214
    .line 215
    if-lt v1, v8, :cond_9

    .line 216
    .line 217
    if-ge v1, v3, :cond_9

    .line 218
    .line 219
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    sget v6, Ll/k9c0;->n:I

    .line 226
    .line 227
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 232
    .line 233
    .line 234
    goto :goto_5

    .line 235
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 236
    .line 237
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 242
    .line 243
    .line 244
    :goto_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Landroid/graphics/RectF;

    .line 251
    .line 252
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 253
    .line 254
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    check-cast v5, Landroid/graphics/RectF;

    .line 259
    .line 260
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b:Ljava/util/ArrayList;

    .line 265
    .line 266
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v6

    .line 270
    check-cast v6, Landroid/graphics/RectF;

    .line 271
    .line 272
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 273
    .line 274
    .line 275
    move-result v6

    .line 276
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 277
    .line 278
    invoke-virtual {p1, v0, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 279
    .line 280
    .line 281
    add-int/lit8 v1, v1, 0x1

    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_a
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 285
    .line 286
    move-object v0, p0

    .line 287
    move-object v1, p1

    .line 288
    move v2, v8

    .line 289
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->b(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V

    .line 290
    .line 291
    .line 292
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->f:Landroid/graphics/Paint;

    .line 293
    .line 294
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->a(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V

    .line 295
    .line 296
    .line 297
    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->n:I

    .line 12
    .line 13
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->n:I

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    if-eqz p1, :cond_5

    .line 17
    .line 18
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 19
    .line 20
    if-nez p4, :cond_1

    .line 21
    .line 22
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 23
    .line 24
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 25
    .line 26
    :cond_1
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 27
    .line 28
    int-to-float p4, p4

    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 30
    .line 31
    int-to-float v1, v0

    .line 32
    mul-float/2addr p3, v1

    .line 33
    int-to-float p1, p1

    .line 34
    div-float/2addr p3, p1

    .line 35
    sub-float/2addr p4, p3

    .line 36
    const/high16 p1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    rem-float p1, p4, p1

    .line 39
    .line 40
    float-to-double v1, p1

    .line 41
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 42
    .line 43
    cmpl-double p1, v1, v3

    .line 44
    .line 45
    if-lez p1, :cond_2

    .line 46
    .line 47
    float-to-int p1, p4

    .line 48
    add-int/lit8 p1, p1, 0x1

    .line 49
    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    float-to-int p1, p4

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 55
    .line 56
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 57
    .line 58
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 59
    .line 60
    add-int/2addr p1, p3

    .line 61
    if-le p1, v0, :cond_3

    .line 62
    .line 63
    sub-int/2addr v0, p3

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 65
    .line 66
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 67
    .line 68
    if-gez p1, :cond_4

    .line 69
    .line 70
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 71
    .line 72
    :cond_4
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setStartTime(I)V

    .line 75
    .line 76
    .line 77
    :cond_5
    return p2
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x3

    .line 13
    if-ne v0, v1, :cond_2

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->p:Ll/z20;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->p:Ll/z20;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 32
    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 34
    .line 35
    add-int v4, v2, v3

    .line 36
    .line 37
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 38
    .line 39
    if-le v4, v5, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    add-int v5, v2, v3

    .line 43
    .line 44
    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v0, v1, v2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->o:Landroid/view/GestureDetector;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public setListener(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->p:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public setMusicLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setStartTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->h:I

    .line 2
    .line 3
    return-void
.end method
