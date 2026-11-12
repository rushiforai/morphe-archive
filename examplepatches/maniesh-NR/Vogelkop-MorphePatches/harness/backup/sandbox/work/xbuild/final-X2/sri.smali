.class public final Lsri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpri;


# static fields
.field public static final d:Landroid/util/SparseArray;


# instance fields
.field public final a:Landroid/util/SparseIntArray;

.field public final b:Leu3;

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lsri;->d:Landroid/util/SparseArray;

    new-instance v1, Lrri;

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lrri;-><init>(IIZ)V

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    new-instance v1, Lrri;

    const/4 v5, 0x5

    invoke-direct {v1, v5, v4, v3}, Lrri;-><init>(IIZ)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Leu3;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lsri;->a:Landroid/util/SparseIntArray;

    iput-object p1, p0, Lsri;->b:Leu3;

    iput p2, p0, Lsri;->c:I

    return-void
.end method


# virtual methods
.method public final a(Ldri;I)Lcom/opera/android/suggestion/Suggestion;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v1, Ldri;->a:B

    sget-object v3, Lsri;->d:Landroid/util/SparseArray;

    sget-object v4, Lrri;->d:Lrri;

    invoke-virtual {v3, v2, v4}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrri;

    iget-object v4, v0, Lsri;->b:Leu3;

    invoke-virtual {v4}, Leu3;->getAsBoolean()Z

    move-result v4

    iget-object v5, v0, Lsri;->a:Landroid/util/SparseIntArray;

    if-eqz v4, :cond_1e

    iget-boolean v4, v3, Lrri;->c:Z

    if-eqz v4, :cond_2c

    :cond_1e
    iget v0, v0, Lsri;->c:I

    iget-byte v4, v3, Lrri;->b:B

    if-lt v0, v4, :cond_2c

    invoke-virtual {v5, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    iget v2, v3, Lrri;->a:I

    if-lt v0, v2, :cond_42

    :cond_2c
    iget-byte v0, v1, Ldri;->a:B

    if-eqz v0, :cond_42

    iget-object v7, v1, Ldri;->b:Ljava/lang/String;

    new-instance v6, Ldri;

    const-string v13, ""

    const/4 v12, 0x0

    const-string v8, ""

    const-string v9, ""

    const-string v10, ""

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v13}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    move-object v1, v6

    :cond_42
    iget-object v8, v1, Ldri;->b:Ljava/lang/String;

    iget-byte v0, v1, Ldri;->a:B

    invoke-virtual {v5, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v5, v0, v2}, Landroid/util/SparseIntArray;->put(II)V

    if-eqz v0, :cond_9e

    if-eq v0, v3, :cond_83

    const/4 v2, 0x2

    if-eq v0, v2, :cond_6b

    new-instance v6, Lcom/opera/android/suggestion/Suggestion;

    const/16 v7, 0x8

    const-string v9, ""

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, -0x1

    const/16 v17, 0x0

    move-object v10, v8

    move-object v14, v9

    move/from16 v13, p2

    invoke-direct/range {v6 .. v17}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v6

    :cond_6b
    iget-object v0, v1, Ldri;->c:Ljava/lang/String;

    new-instance v6, Lcom/opera/android/suggestion/Suggestion;

    const/16 v7, 0x13

    const-string v9, ""

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, -0x1

    const/16 v17, 0x0

    move-object v14, v9

    move/from16 v13, p2

    move-object v10, v8

    move-object v8, v0

    invoke-direct/range {v6 .. v17}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v6

    :cond_83
    iget-object v0, v1, Ldri;->c:Ljava/lang/String;

    iget-object v10, v1, Ldri;->e:Ljava/lang/String;

    iget-object v14, v1, Ldri;->f:Ljava/lang/String;

    iget-object v9, v1, Ldri;->d:Ljava/lang/String;

    iget v15, v1, Ldri;->g:I

    new-instance v6, Lcom/opera/android/suggestion/Suggestion;

    const/16 v7, 0x12

    const/4 v11, 0x0

    const/16 v16, -0x1

    const/16 v17, 0x0

    move/from16 v13, p2

    move-object v12, v8

    move-object v8, v0

    invoke-direct/range {v6 .. v17}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v6

    :cond_9e
    new-instance v6, Lcom/opera/android/suggestion/Suggestion;

    const/16 v7, 0x8

    const-string v9, ""

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, -0x1

    const/16 v17, 0x0

    move-object v10, v8

    move-object v14, v9

    move/from16 v13, p2

    invoke-direct/range {v6 .. v17}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v6
.end method
