.class public final Ljlg;
.super Lsfe;
.source "SourceFile"


# instance fields
.field public final h:Lhlg;

.field public final i:Ljava/lang/Integer;

.field public final j:Z

.field public final k:[Lkotlin/ranges/IntRange;


# direct methods
.method public constructor <init>(Lhlg;Ljava/lang/Integer;Z[Lkotlin/ranges/IntRange;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljlg;->h:Lhlg;

    iput-object p2, p0, Ljlg;->i:Ljava/lang/Integer;

    iput-boolean p3, p0, Ljlg;->j:Z

    iput-object p4, p0, Ljlg;->k:[Lkotlin/ranges/IntRange;

    return-void
.end method


# virtual methods
.method public final E0()Lsfe;
    .registers 8

    iget-object v0, p0, Ljlg;->h:Lhlg;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    iget-boolean v1, p0, Ljlg;->j:Z

    iget-object v2, p0, Ljlg;->k:[Lkotlin/ranges/IntRange;

    if-eqz v0, :cond_2a

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2a

    array-length p0, v2

    const/4 v0, 0x0

    move v4, v0

    :goto_12
    if-ge v4, p0, :cond_21

    aget-object v5, v2, v4

    iget v6, v5, Lkotlin/ranges/a;->a:I

    iget v5, v5, Lkotlin/ranges/a;->b:I

    if-ltz v5, :cond_1e

    if-lez v6, :cond_22

    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_21
    move v3, v0

    :cond_22
    if-eq v3, v1, :cond_27

    sget-object p0, Lglg;->j:Lglg;

    return-object p0

    :cond_27
    sget-object p0, Lglg;->i:Lglg;

    return-object p0

    :cond_2a
    new-instance v0, Ljlg;

    sget-object v3, Lhlg;->a:Lhlg;

    iget-object p0, p0, Ljlg;->i:Ljava/lang/Integer;

    invoke-direct {v0, v3, p0, v1, v2}, Ljlg;-><init>(Lhlg;Ljava/lang/Integer;Z[Lkotlin/ranges/IntRange;)V

    return-object v0
.end method

.method public final P(Lsfe;)Z
    .registers 7

    const/4 v0, 0x1

    if-eq p0, p1, :cond_3f

    instance-of v1, p1, Ljlg;

    const/4 v2, 0x0

    if-eqz v1, :cond_3e

    sget-object v1, Lhlg;->a:Lhlg;

    iget-object v3, p0, Ljlg;->h:Lhlg;

    if-eq v3, v1, :cond_14

    sget-object v4, Lhlg;->b:Lhlg;

    if-eq v3, v4, :cond_14

    move v3, v2

    goto :goto_15

    :cond_14
    move v3, v0

    :goto_15
    check-cast p1, Ljlg;

    iget-object v4, p1, Ljlg;->h:Lhlg;

    if-eq v4, v1, :cond_21

    sget-object v1, Lhlg;->b:Lhlg;

    if-eq v4, v1, :cond_21

    move v1, v2

    goto :goto_22

    :cond_21
    move v1, v0

    :goto_22
    if-ne v3, v1, :cond_3e

    iget-object v1, p0, Ljlg;->i:Ljava/lang/Integer;

    iget-object v3, p1, Ljlg;->i:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    iget-boolean v1, p0, Ljlg;->j:Z

    iget-boolean v3, p1, Ljlg;->j:Z

    if-ne v1, v3, :cond_3e

    iget-object p0, p0, Ljlg;->k:[Lkotlin/ranges/IntRange;

    iget-object p1, p1, Ljlg;->k:[Lkotlin/ranges/IntRange;

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f

    :cond_3e
    return v2

    :cond_3f
    return v0
.end method

.method public final l0(I)Z
    .registers 9

    iget-object v0, p0, Ljlg;->h:Lhlg;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_e

    if-eq v0, v2, :cond_e

    move p1, v1

    goto :goto_12

    :cond_e
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    :goto_12
    iget-object v0, p0, Ljlg;->i:Ljava/lang/Integer;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    rem-int/2addr p1, v0

    :cond_1b
    iget-object v0, p0, Ljlg;->k:[Lkotlin/ranges/IntRange;

    array-length v3, v0

    move v4, v1

    :goto_1f
    if-ge v4, v3, :cond_30

    aget-object v5, v0, v4

    iget v6, v5, Lkotlin/ranges/a;->a:I

    iget v5, v5, Lkotlin/ranges/a;->b:I

    if-gt p1, v5, :cond_2d

    if-gt v6, p1, :cond_2d

    move p1, v2

    goto :goto_31

    :cond_2d
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    :cond_30
    move p1, v1

    :goto_31
    iget-boolean p0, p0, Ljlg;->j:Z

    if-eq p1, p0, :cond_36

    return v2

    :cond_36
    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Ljlg;->h:Lhlg;

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ljlg;->i:Ljava/lang/Integer;

    if-eqz v1, :cond_24

    const-string v2, " % "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_24
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Ljlg;->j:Z

    if-eqz v1, :cond_32

    const/16 v1, 0x21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_32
    const-string v1, "= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ljlg;->k:[Lkotlin/ranges/IntRange;

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x1

    move v4, v2

    :goto_3d
    if-ge v4, v1, :cond_5f

    aget-object v5, p0, v4

    if-nez v3, :cond_48

    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_48
    iget v3, v5, Lkotlin/ranges/a;->a:I

    iget v6, v5, Lkotlin/ranges/a;->b:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget v3, v5, Lkotlin/ranges/a;->a:I

    if-eq v3, v6, :cond_5b

    const-string v3, ".."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_5b
    add-int/lit8 v4, v4, 0x1

    move v3, v2

    goto :goto_3d

    :cond_5f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
