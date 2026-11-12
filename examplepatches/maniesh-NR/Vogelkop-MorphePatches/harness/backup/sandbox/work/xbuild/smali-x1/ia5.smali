.class public final Lia5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public final synthetic j:Lwjh;


# direct methods
.method public constructor <init>(Lwjh;II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lia5;->j:Lwjh;

    iput p2, p0, Lia5;->a:I

    iput p3, p0, Lia5;->b:I

    invoke-virtual {p0}, Lia5;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 14

    iget-object v0, p0, Lia5;->j:Lwjh;

    iget-object v1, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v1, [I

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, [I

    const v2, 0x7fffffff

    const/high16 v3, -0x80000000

    const/4 v4, 0x0

    iget v5, p0, Lia5;->a:I

    move v6, v3

    move v7, v6

    move v8, v4

    move v9, v5

    move v3, v2

    move v4, v3

    move v5, v7

    :goto_19
    iget v10, p0, Lia5;->b:I

    if-gt v9, v10, :cond_41

    aget v10, v1, v9

    aget v11, v0, v10

    add-int/2addr v8, v11

    shr-int/lit8 v11, v10, 0xa

    and-int/lit8 v11, v11, 0x1f

    shr-int/lit8 v12, v10, 0x5

    and-int/lit8 v12, v12, 0x1f

    and-int/lit8 v10, v10, 0x1f

    if-le v11, v5, :cond_2f

    move v5, v11

    :cond_2f
    if-ge v11, v2, :cond_32

    move v2, v11

    :cond_32
    if-le v12, v6, :cond_35

    move v6, v12

    :cond_35
    if-ge v12, v3, :cond_38

    move v3, v12

    :cond_38
    if-le v10, v7, :cond_3b

    move v7, v10

    :cond_3b
    if-ge v10, v4, :cond_3e

    move v4, v10

    :cond_3e
    add-int/lit8 v9, v9, 0x1

    goto :goto_19

    :cond_41
    iput v2, p0, Lia5;->d:I

    iput v5, p0, Lia5;->e:I

    iput v3, p0, Lia5;->f:I

    iput v6, p0, Lia5;->g:I

    iput v4, p0, Lia5;->h:I

    iput v7, p0, Lia5;->i:I

    iput v8, p0, Lia5;->c:I

    return-void
.end method

.method public final b()I
    .registers 4

    iget v0, p0, Lia5;->e:I

    iget v1, p0, Lia5;->d:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lia5;->g:I

    iget v2, p0, Lia5;->f:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v1, v0

    iget v0, p0, Lia5;->i:I

    iget p0, p0, Lia5;->h:I

    sub-int/2addr v0, p0

    add-int/lit8 v0, v0, 0x1

    mul-int/2addr v0, v1

    return v0
.end method
