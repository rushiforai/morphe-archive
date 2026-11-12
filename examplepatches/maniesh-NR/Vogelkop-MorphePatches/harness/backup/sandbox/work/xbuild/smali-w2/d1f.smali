.class public final Ld1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/os/Bundle;

.field public b:Landroidx/core/graphics/drawable/IconCompat;

.field public final c:[Lith;

.field public final d:Z

.field public final e:Z

.field public final f:I

.field public final g:Z

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:Ljava/lang/CharSequence;

.field public final l:Landroid/app/PendingIntent;

.field public final m:Z


# direct methods
.method public constructor <init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lith;ZIZZIIZ)V
    .registers 15

    const/4 v0, 0x0

    if-nez p1, :cond_5

    :goto_3
    move-object p1, v0

    goto :goto_c

    .line 66
    :cond_5
    const-string v1, ""

    invoke-static {v0, v1, p1}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v0

    goto :goto_3

    :goto_c
    invoke-direct/range {p0 .. p12}, Ld1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lith;ZIZZIIZ)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Landroid/app/PendingIntent;)V
    .registers 19

    move/from16 v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_7

    :goto_5
    move-object v3, v1

    goto :goto_e

    .line 67
    :cond_7
    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v1

    goto :goto_5

    .line 68
    :goto_e
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v2, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v2 .. v14}, Ld1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lith;ZIZZIIZ)V

    return-void
.end method

.method public constructor <init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lith;ZIZZIIZ)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ld1f;->e:Z

    iput-object p1, p0, Ld1f;->b:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz p1, :cond_20

    iget v0, p1, Landroidx/core/graphics/drawable/IconCompat;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    iget-object v0, p1, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-virtual {v0}, Landroid/graphics/drawable/Icon;->getType()I

    move-result v0

    :cond_17
    const/4 v1, 0x2

    if-ne v0, v1, :cond_20

    invoke-virtual {p1}, Landroidx/core/graphics/drawable/IconCompat;->e()I

    move-result p1

    iput p1, p0, Ld1f;->j:I

    :cond_20
    invoke-static {p2}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Ld1f;->k:Ljava/lang/CharSequence;

    iput-object p3, p0, Ld1f;->l:Landroid/app/PendingIntent;

    if-nez p4, :cond_2f

    new-instance p4, Landroid/os/Bundle;

    invoke-direct {p4}, Landroid/os/Bundle;-><init>()V

    :cond_2f
    iput-object p4, p0, Ld1f;->a:Landroid/os/Bundle;

    iput-object p5, p0, Ld1f;->c:[Lith;

    iput-boolean p6, p0, Ld1f;->d:Z

    iput p7, p0, Ld1f;->f:I

    iput-boolean p8, p0, Ld1f;->e:Z

    iput-boolean p9, p0, Ld1f;->g:Z

    iput p10, p0, Ld1f;->h:I

    iput p11, p0, Ld1f;->i:I

    iput-boolean p12, p0, Ld1f;->m:Z

    return-void
.end method
