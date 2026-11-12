.class public final Laz7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:[Lwkm;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 29

    sget-object v1, Lwkm;->B0:Lwkm;

    sget-object v2, Lwkm;->D0:Lwkm;

    sget-object v3, Lwkm;->E0:Lwkm;

    sget-object v4, Lwkm;->F0:Lwkm;

    sget-object v5, Lwkm;->H0:Lwkm;

    sget-object v6, Lwkm;->I0:Lwkm;

    sget-object v7, Lwkm;->J0:Lwkm;

    sget-object v8, Lwkm;->K0:Lwkm;

    sget-object v9, Lwkm;->L0:Lwkm;

    sget-object v10, Lwkm;->N0:Lwkm;

    sget-object v11, Lwkm;->O0:Lwkm;

    sget-object v12, Lwkm;->P0:Lwkm;

    sget-object v13, Lwkm;->S0:Lwkm;

    sget-object v14, Lwkm;->i2:Lwkm;

    sget-object v15, Lwkm;->Y4:Lwkm;

    sget-object v16, Lwkm;->Z4:Lwkm;

    sget-object v17, Lwkm;->a5:Lwkm;

    sget-object v18, Lwkm;->d5:Lwkm;

    sget-object v19, Lwkm;->e5:Lwkm;

    sget-object v20, Lwkm;->f5:Lwkm;

    sget-object v21, Lwkm;->g5:Lwkm;

    sget-object v22, Lwkm;->h5:Lwkm;

    sget-object v23, Lwkm;->i5:Lwkm;

    sget-object v24, Lwkm;->j5:Lwkm;

    sget-object v25, Lwkm;->k5:Lwkm;

    sget-object v26, Lwkm;->l5:Lwkm;

    sget-object v27, Lwkm;->m5:Lwkm;

    sget-object v28, Lwkm;->n5:Lwkm;

    filled-new-array/range {v1 .. v28}, [Lwkm;

    move-result-object v0

    sput-object v0, Laz7;->c:[Lwkm;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v4, v3

    :goto_c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_67

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    add-int/lit8 v5, v3, 0x1

    invoke-static {p1, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v6

    sget-object v7, Laz7;->c:[Lwkm;

    array-length v8, v7

    move v9, v1

    :goto_1f
    const/4 v10, 0x1

    if-ge v9, v8, :cond_2f

    aget-object v11, v7, v9

    iget-object v11, v11, Lwkm;->a:Lkotlin/ranges/IntRange;

    invoke-virtual {v11, v6}, Lkotlin/ranges/IntRange;->d(I)Z

    move-result v11

    if-nez v11, :cond_53

    add-int/lit8 v9, v9, 0x1

    goto :goto_1f

    :cond_2f
    if-eqz v4, :cond_55

    sget-object v4, Lwkm;->W1:Lwkm;

    iget-object v4, v4, Lwkm;->a:Lkotlin/ranges/IntRange;

    invoke-virtual {v4, v6}, Lkotlin/ranges/IntRange;->d(I)Z

    move-result v4

    if-nez v4, :cond_53

    sget-object v4, Lwkm;->b2:Lwkm;

    iget-object v4, v4, Lwkm;->a:Lkotlin/ranges/IntRange;

    invoke-virtual {v4, v6}, Lkotlin/ranges/IntRange;->d(I)Z

    move-result v4

    if-nez v4, :cond_53

    sget-object v4, Lwkm;->y5:Lwkm;

    iget-object v4, v4, Lwkm;->a:Lkotlin/ranges/IntRange;

    invoke-virtual {v4, v6}, Lkotlin/ranges/IntRange;->d(I)Z

    move-result v4

    if-nez v4, :cond_53

    const/16 v4, 0x200d

    if-ne v6, v4, :cond_55

    :cond_53
    move v4, v10

    goto :goto_56

    :cond_55
    move v4, v1

    :goto_56
    if-eqz v4, :cond_5d

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_5e

    :cond_5d
    const/4 v3, 0x0

    :goto_5e
    if-eqz v3, :cond_63

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_63
    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_c

    :cond_67
    iput-object v0, p0, Laz7;->a:Ljava/util/ArrayList;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move v2, v1

    :goto_6f
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_8e

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int/lit8 v4, v2, 0x1

    iget-object v5, p0, Laz7;->a:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8a

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/Appendable;

    :cond_8a
    add-int/lit8 v1, v1, 0x1

    move v2, v4

    goto :goto_6f

    :cond_8e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Laz7;->b:Ljava/lang/String;

    return-void
.end method
