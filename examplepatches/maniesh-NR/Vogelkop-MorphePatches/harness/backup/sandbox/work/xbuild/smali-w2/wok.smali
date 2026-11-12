.class public final Lwok;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Ljava/util/List;

.field public static final l:Ljava/util/List;

.field public static final m:La3j;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Lwok;->k:Ljava/util/List;

    sput-object v0, Lwok;->l:Ljava/util/List;

    new-instance v0, La3j;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    sput-object v0, Lwok;->m:La3j;

    return-void
.end method

.method public static t(Landroid/content/Context;)Lwok;
    .registers 3

    sget-object v0, Lio7;->t:Lio7;

    sget-object v1, Lwok;->m:La3j;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lwok;

    return-object p0
.end method

.method public static u(Lizd;)Lvok;
    .registers 9

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v2, Landroid/util/SparseLongArray;

    invoke-direct {v2, v0}, Landroid/util/SparseLongArray;-><init>(I)V

    :goto_d
    add-int/lit8 v3, v0, -0x1

    if-lez v0, :cond_1f

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v0, v4, v5}, Landroid/util/SparseLongArray;->append(IJ)V

    move v0, v3

    goto :goto_d

    :cond_1f
    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Laik;->a:[Ljava/lang/String;

    const-string v2, ""

    if-nez v0, :cond_2a

    move-object v0, v2

    :cond_2a
    const-string v3, "2810f58abaa5105b14f66e784fdbfae67a9a89b7b93790439f271d78db8dfe87"

    invoke-static {v0, v3}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-lez v0, :cond_4a

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_3a
    add-int/lit8 v4, v0, -0x1

    if-lez v0, :cond_4c

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_45

    move-object v0, v2

    :cond_45
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v4

    goto :goto_3a

    :cond_4a
    sget-object v3, Lwok;->k:Ljava/util/List;

    :cond_4c
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    move-object v4, v2

    move-object v2, v3

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_57
    add-int/lit8 v5, v0, -0x1

    if-lez v0, :cond_67

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_62

    move-object v0, v4

    :cond_62
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v5

    goto :goto_57

    :cond_67
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    sget-object v5, Lwok;->l:Ljava/util/List;

    const-string v6, "z4H7x328ttC64Xont1zbi30a8tFPhejSUNDlMXmgZdXzgnfzbOAOuTadbXN7fz7"

    if-lez v0, :cond_97

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_78

    move-object v0, v4

    :cond_78
    invoke-static {v0, v6}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-lez v0, :cond_97

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_87
    add-int/lit8 v7, v0, -0x1

    if-lez v0, :cond_97

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_92

    move-object v0, v4

    :cond_92
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v7

    goto :goto_87

    :cond_97
    move-object v4, v6

    new-instance v0, Lvok;

    invoke-direct/range {v0 .. v5}, Lvok;-><init>(ILjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 7

    new-instance v0, Lvok;

    new-instance p0, Landroid/util/SparseLongArray;

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Landroid/util/SparseLongArray;-><init>(I)V

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const-string v4, "z4H7x328ttC64Xont1zbi30a8tFPhejSUNDlMXmgZdXzgnfzbOAOuTadbXN7fz7"

    sget-object v5, Lwok;->l:Ljava/util/List;

    sget-object v2, Lwok;->k:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lvok;-><init>(ILjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lwok;->u(Lizd;)Lvok;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lwok;->u(Lizd;)Lvok;

    move-result-object p0

    return-object p0
.end method
