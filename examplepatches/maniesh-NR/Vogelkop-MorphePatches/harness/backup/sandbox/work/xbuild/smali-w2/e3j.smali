.class public final Le3j;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:La3j;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, La3j;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    sput-object v0, Le3j;->k:La3j;

    return-void
.end method

.method public static t(Landroid/content/Context;)Le3j;
    .registers 3

    sget-object v0, Lio7;->w:Lio7;

    sget-object v1, Le3j;->k:La3j;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Le3j;

    return-object p0
.end method

.method public static u(Lizd;)Ld3j;
    .registers 14

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1, v0}, Landroid/util/SparseArray;-><init>(I)V

    :goto_9
    add-int/lit8 v2, v0, -0x1

    const/4 v3, 0x0

    const-string v4, "Duplicate id"

    if-lez v0, :cond_33

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_2f

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_29

    invoke-virtual {v1, v0, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v0, v2

    goto :goto_9

    :cond_29
    const-string p0, "Bad pin"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_2f
    invoke-static {v4}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_33
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2, v0}, Landroid/util/SparseArray;-><init>(I)V

    :goto_3c
    add-int/lit8 v5, v0, -0x1

    if-lez v0, :cond_8f

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v6, Lizd;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-direct {v7, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v7}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v6}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {v6}, Lizd;->h()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Laik;->a:[Ljava/lang/String;

    const-string v8, ""

    if-nez v7, :cond_62

    move-object v7, v8

    :cond_62
    invoke-virtual {v6}, Lizd;->h()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_69

    move-object v8, v9

    :cond_69
    invoke-virtual {v6}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v9

    new-array v10, v9, [I

    const/4 v11, 0x0

    :goto_70
    if-ge v11, v9, :cond_7b

    invoke-virtual {v6}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v12

    aput v12, v10, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_70

    :cond_7b
    new-instance v6, Lb3j;

    invoke-direct {v6, v0, v7, v8, v10}, Lb3j;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_8b

    invoke-virtual {v2, v0, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v0, v5

    goto :goto_3c

    :cond_8b
    invoke-static {v4}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_8f
    new-instance p0, Ld3j;

    invoke-direct {p0, v1, v2}, Ld3j;-><init>(Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 4

    new-instance p0, Ld3j;

    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2, v1}, Landroid/util/SparseArray;-><init>(I)V

    invoke-direct {p0, v0, v2}, Ld3j;-><init>(Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Le3j;->u(Lizd;)Ld3j;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Le3j;->u(Lizd;)Ld3j;

    move-result-object p0

    return-object p0
.end method
