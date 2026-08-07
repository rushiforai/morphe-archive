.class public final Ll/myb$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/myb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Landroid/graphics/Bitmap;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Landroid/text/Layout$Alignment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Landroid/text/Layout$Alignment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:F

.field public f:I

.field public g:I

.field public h:F

.field public i:I

.field public j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:Z

.field public o:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public p:I

.field public q:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 74
    iput-object v0, p0, Ll/myb$b;->a:Ljava/lang/CharSequence;

    .line 75
    iput-object v0, p0, Ll/myb$b;->b:Landroid/graphics/Bitmap;

    .line 76
    iput-object v0, p0, Ll/myb$b;->c:Landroid/text/Layout$Alignment;

    .line 77
    iput-object v0, p0, Ll/myb$b;->d:Landroid/text/Layout$Alignment;

    const v0, -0x800001

    .line 78
    iput v0, p0, Ll/myb$b;->e:F

    const/high16 v1, -0x80000000

    .line 79
    iput v1, p0, Ll/myb$b;->f:I

    .line 80
    iput v1, p0, Ll/myb$b;->g:I

    .line 81
    iput v0, p0, Ll/myb$b;->h:F

    .line 82
    iput v1, p0, Ll/myb$b;->i:I

    .line 83
    iput v1, p0, Ll/myb$b;->j:I

    .line 84
    iput v0, p0, Ll/myb$b;->k:F

    .line 85
    iput v0, p0, Ll/myb$b;->l:F

    .line 86
    iput v0, p0, Ll/myb$b;->m:F

    const/4 v0, 0x0

    .line 87
    iput-boolean v0, p0, Ll/myb$b;->n:Z

    const/high16 v0, -0x1000000

    .line 88
    iput v0, p0, Ll/myb$b;->o:I

    .line 89
    iput v1, p0, Ll/myb$b;->p:I

    return-void
.end method

.method public constructor <init>(Ll/myb;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/myb;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    iput-object v0, p0, Ll/myb$b;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iget-object v0, p1, Ll/myb;->d:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    iput-object v0, p0, Ll/myb$b;->b:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object v0, p1, Ll/myb;->b:Landroid/text/Layout$Alignment;

    .line 13
    .line 14
    iput-object v0, p0, Ll/myb$b;->c:Landroid/text/Layout$Alignment;

    .line 15
    .line 16
    iget-object v0, p1, Ll/myb;->c:Landroid/text/Layout$Alignment;

    .line 17
    .line 18
    iput-object v0, p0, Ll/myb$b;->d:Landroid/text/Layout$Alignment;

    .line 19
    .line 20
    iget v0, p1, Ll/myb;->e:F

    .line 21
    .line 22
    iput v0, p0, Ll/myb$b;->e:F

    .line 23
    .line 24
    iget v0, p1, Ll/myb;->f:I

    .line 25
    .line 26
    iput v0, p0, Ll/myb$b;->f:I

    .line 27
    .line 28
    iget v0, p1, Ll/myb;->g:I

    .line 29
    .line 30
    iput v0, p0, Ll/myb$b;->g:I

    .line 31
    .line 32
    iget v0, p1, Ll/myb;->h:F

    .line 33
    .line 34
    iput v0, p0, Ll/myb$b;->h:F

    .line 35
    .line 36
    iget v0, p1, Ll/myb;->i:I

    .line 37
    .line 38
    iput v0, p0, Ll/myb$b;->i:I

    .line 39
    .line 40
    iget v0, p1, Ll/myb;->n:I

    .line 41
    .line 42
    iput v0, p0, Ll/myb$b;->j:I

    .line 43
    .line 44
    iget v0, p1, Ll/myb;->o:F

    .line 45
    .line 46
    iput v0, p0, Ll/myb$b;->k:F

    .line 47
    .line 48
    iget v0, p1, Ll/myb;->j:F

    .line 49
    .line 50
    iput v0, p0, Ll/myb$b;->l:F

    .line 51
    .line 52
    iget v0, p1, Ll/myb;->k:F

    .line 53
    .line 54
    iput v0, p0, Ll/myb$b;->m:F

    .line 55
    .line 56
    iget-boolean v0, p1, Ll/myb;->l:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Ll/myb$b;->n:Z

    .line 59
    .line 60
    iget v0, p1, Ll/myb;->m:I

    .line 61
    .line 62
    iput v0, p0, Ll/myb$b;->o:I

    .line 63
    .line 64
    iget v0, p1, Ll/myb;->p:I

    .line 65
    .line 66
    iput v0, p0, Ll/myb$b;->p:I

    .line 67
    .line 68
    iget p1, p1, Ll/myb;->q:F

    .line 69
    .line 70
    iput p1, p0, Ll/myb$b;->q:F

    .line 71
    .line 72
    return-void
.end method

.method public synthetic constructor <init>(Ll/myb;Ll/myb$a;)V
    .locals 0

    .line 90
    invoke-direct {p0, p1}, Ll/myb$b;-><init>(Ll/myb;)V

    return-void
.end method


# virtual methods
.method public a()Ll/myb;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/myb;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/myb$b;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/myb$b;->c:Landroid/text/Layout$Alignment;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v0, Ll/myb$b;->d:Landroid/text/Layout$Alignment;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, v0, Ll/myb$b;->b:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget v5, v0, Ll/myb$b;->e:F

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget v6, v0, Ll/myb$b;->f:I

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget v7, v0, Ll/myb$b;->g:I

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget v8, v0, Ll/myb$b;->h:F

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget v9, v0, Ll/myb$b;->i:I

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget v10, v0, Ll/myb$b;->j:I

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget v11, v0, Ll/myb$b;->k:F

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget v12, v0, Ll/myb$b;->l:F

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget v13, v0, Ll/myb$b;->m:F

    .line 43
    .line 44
    move-object v15, v14

    .line 45
    iget-boolean v14, v0, Ll/myb$b;->n:Z

    .line 46
    .line 47
    move-object/from16 v16, v15

    .line 48
    .line 49
    iget v15, v0, Ll/myb$b;->o:I

    .line 50
    .line 51
    move-object/from16 v17, v1

    .line 52
    .line 53
    iget v1, v0, Ll/myb$b;->p:I

    .line 54
    .line 55
    iget v0, v0, Ll/myb$b;->q:F

    .line 56
    .line 57
    const/16 v18, 0x0

    .line 58
    .line 59
    move-object/from16 v19, v17

    .line 60
    .line 61
    move/from16 v17, v0

    .line 62
    .line 63
    move-object/from16 v0, v16

    .line 64
    .line 65
    move/from16 v16, v1

    .line 66
    .line 67
    move-object/from16 v1, v19

    .line 68
    .line 69
    invoke-direct/range {v0 .. v18}, Ll/myb;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFLl/myb$a;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method public b()Ll/myb$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/myb$b;->n:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public c()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget p0, p0, Ll/myb$b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget p0, p0, Ll/myb$b;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/myb$b;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Landroid/graphics/Bitmap;)Ll/myb$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/myb$b;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(F)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->m:F

    .line 2
    .line 3
    return-object p0
.end method

.method public h(FI)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->e:F

    .line 2
    .line 3
    iput p2, p0, Ll/myb$b;->f:I

    .line 4
    .line 5
    return-object p0
.end method

.method public i(I)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Landroid/text/Layout$Alignment;)Ll/myb$b;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/myb$b;->d:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(F)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->h:F

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(F)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->q:F

    .line 2
    .line 3
    return-object p0
.end method

.method public n(F)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->l:F

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/CharSequence;)Ll/myb$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/myb$b;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Landroid/text/Layout$Alignment;)Ll/myb$b;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/myb$b;->c:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(FI)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->k:F

    .line 2
    .line 3
    iput p2, p0, Ll/myb$b;->j:I

    .line 4
    .line 5
    return-object p0
.end method

.method public r(I)Ll/myb$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/myb$b;->p:I

    .line 2
    .line 3
    return-object p0
.end method

.method public s(I)Ll/myb$b;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/myb$b;->o:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/myb$b;->n:Z

    .line 5
    .line 6
    return-object p0
.end method
