.class public final Ll/j2v0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.field public n:I

.field public o:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Ll/j2v0;->a:Ljava/lang/CharSequence;

    iput-object v0, p0, Ll/j2v0;->b:Landroid/graphics/Bitmap;

    iput-object v0, p0, Ll/j2v0;->c:Landroid/text/Layout$Alignment;

    iput-object v0, p0, Ll/j2v0;->d:Landroid/text/Layout$Alignment;

    const v0, -0x800001

    iput v0, p0, Ll/j2v0;->e:F

    const/high16 v1, -0x80000000

    iput v1, p0, Ll/j2v0;->f:I

    iput v1, p0, Ll/j2v0;->g:I

    iput v0, p0, Ll/j2v0;->h:F

    iput v1, p0, Ll/j2v0;->i:I

    iput v1, p0, Ll/j2v0;->j:I

    iput v0, p0, Ll/j2v0;->k:F

    iput v0, p0, Ll/j2v0;->l:F

    iput v0, p0, Ll/j2v0;->m:F

    iput v1, p0, Ll/j2v0;->n:I

    return-void
.end method

.method public synthetic constructor <init>(Ll/u4v0;Ll/b0v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p1, Ll/u4v0;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j2v0;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iget-object p2, p1, Ll/u4v0;->d:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    iput-object p2, p0, Ll/j2v0;->b:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object p2, p1, Ll/u4v0;->b:Landroid/text/Layout$Alignment;

    .line 13
    .line 14
    iput-object p2, p0, Ll/j2v0;->c:Landroid/text/Layout$Alignment;

    .line 15
    .line 16
    iget-object p2, p1, Ll/u4v0;->c:Landroid/text/Layout$Alignment;

    .line 17
    .line 18
    iput-object p2, p0, Ll/j2v0;->d:Landroid/text/Layout$Alignment;

    .line 19
    .line 20
    iget p2, p1, Ll/u4v0;->e:F

    .line 21
    .line 22
    iput p2, p0, Ll/j2v0;->e:F

    .line 23
    .line 24
    iget p2, p1, Ll/u4v0;->f:I

    .line 25
    .line 26
    iput p2, p0, Ll/j2v0;->f:I

    .line 27
    .line 28
    iget p2, p1, Ll/u4v0;->g:I

    .line 29
    .line 30
    iput p2, p0, Ll/j2v0;->g:I

    .line 31
    .line 32
    iget p2, p1, Ll/u4v0;->h:F

    .line 33
    .line 34
    iput p2, p0, Ll/j2v0;->h:F

    .line 35
    .line 36
    iget p2, p1, Ll/u4v0;->i:I

    .line 37
    .line 38
    iput p2, p0, Ll/j2v0;->i:I

    .line 39
    .line 40
    iget p2, p1, Ll/u4v0;->l:I

    .line 41
    .line 42
    iput p2, p0, Ll/j2v0;->j:I

    .line 43
    .line 44
    iget p2, p1, Ll/u4v0;->m:F

    .line 45
    .line 46
    iput p2, p0, Ll/j2v0;->k:F

    .line 47
    .line 48
    iget p2, p1, Ll/u4v0;->j:F

    .line 49
    .line 50
    iput p2, p0, Ll/j2v0;->l:F

    .line 51
    .line 52
    iget p2, p1, Ll/u4v0;->k:F

    .line 53
    .line 54
    iput p2, p0, Ll/j2v0;->m:F

    .line 55
    .line 56
    iget p2, p1, Ll/u4v0;->n:I

    .line 57
    .line 58
    iput p2, p0, Ll/j2v0;->n:I

    .line 59
    .line 60
    iget p1, p1, Ll/u4v0;->o:F

    .line 61
    .line 62
    iput p1, p0, Ll/j2v0;->o:F

    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget p0, p0, Ll/j2v0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget p0, p0, Ll/j2v0;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final c(Landroid/graphics/Bitmap;)Ll/j2v0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j2v0;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(F)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->m:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(FI)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->e:F

    .line 2
    .line 3
    iput p2, p0, Ll/j2v0;->f:I

    .line 4
    .line 5
    return-object p0
.end method

.method public final f(I)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Landroid/text/Layout$Alignment;)Ll/j2v0;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/j2v0;->d:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(F)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->h:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(I)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(F)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->o:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final k(F)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->l:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Ljava/lang/CharSequence;)Ll/j2v0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j2v0;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m(Landroid/text/Layout$Alignment;)Ll/j2v0;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/j2v0;->c:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(FI)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->k:F

    .line 2
    .line 3
    iput p2, p0, Ll/j2v0;->j:I

    .line 4
    .line 5
    return-object p0
.end method

.method public final o(I)Ll/j2v0;
    .locals 0

    .line 1
    iput p1, p0, Ll/j2v0;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()Ll/u4v0;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/u4v0;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/j2v0;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/j2v0;->c:Landroid/text/Layout$Alignment;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v0, Ll/j2v0;->d:Landroid/text/Layout$Alignment;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, v0, Ll/j2v0;->b:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget v5, v0, Ll/j2v0;->e:F

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget v6, v0, Ll/j2v0;->f:I

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget v7, v0, Ll/j2v0;->g:I

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget v8, v0, Ll/j2v0;->h:F

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget v9, v0, Ll/j2v0;->i:I

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget v10, v0, Ll/j2v0;->j:I

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget v11, v0, Ll/j2v0;->k:F

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget v12, v0, Ll/j2v0;->l:F

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget v13, v0, Ll/j2v0;->m:F

    .line 43
    .line 44
    iget v15, v0, Ll/j2v0;->n:I

    .line 45
    .line 46
    iget v0, v0, Ll/j2v0;->o:F

    .line 47
    .line 48
    const/16 v18, 0x0

    .line 49
    .line 50
    move/from16 v17, v0

    .line 51
    .line 52
    move-object v0, v14

    .line 53
    const/4 v14, 0x0

    .line 54
    move/from16 v16, v15

    .line 55
    .line 56
    const/high16 v15, -0x1000000

    .line 57
    .line 58
    invoke-direct/range {v0 .. v18}, Ll/u4v0;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFLl/o3v0;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public final q()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j2v0;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method
