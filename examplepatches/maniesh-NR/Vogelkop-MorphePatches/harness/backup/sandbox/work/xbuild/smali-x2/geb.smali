.class public final Lgeb;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lpza;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lpza;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lpza;-><init>(B)V

    sput-object v0, Lgeb;->k:Lpza;

    return-void
.end method

.method public static t(Lizd;)Lfeb;
    .registers 5

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1, v0}, Landroid/util/SparseArray;-><init>(I)V

    :goto_c
    add-int/lit8 v2, v0, -0x1

    if-lez v0, :cond_2a

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v3

    if-gez v3, :cond_23

    invoke-static {p0}, Lgeb;->u(Lizd;)Ljava/util/HashSet;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v0, v2

    goto :goto_c

    :cond_23
    const-string p0, "Duplicate category_id"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2a
    invoke-static {p0}, Lgeb;->u(Lizd;)Ljava/util/HashSet;

    move-result-object p0

    new-instance v0, Lfeb;

    invoke-direct {v0, v1, p0}, Lfeb;-><init>(Landroid/util/SparseArray;Ljava/util/Set;)V

    return-object v0
.end method

.method public static u(Lizd;)Ljava/util/HashSet;
    .registers 6

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    :goto_9
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_32

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    if-eqz v1, :cond_2c

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    move v1, v2

    goto :goto_9

    :cond_26
    const-string p0, "Duplicate keyword"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_2c
    const-string p0, "Keyword string expected"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_32
    return-object v0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 3

    new-instance p0, Lfeb;

    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-direct {p0, v0, v1}, Lfeb;-><init>(Landroid/util/SparseArray;Ljava/util/Set;)V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lgeb;->t(Lizd;)Lfeb;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lgeb;->t(Lizd;)Lfeb;

    move-result-object p0

    return-object p0
.end method
