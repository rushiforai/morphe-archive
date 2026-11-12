.class public final Lcxc;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Luac;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luac;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Luac;-><init>(B)V

    sput-object v0, Lcxc;->k:Luac;

    return-void
.end method

.method public static t(Landroid/content/Context;)Lcxc;
    .registers 3

    sget-object v0, Lio7;->x:Lio7;

    sget-object v1, Lcxc;->k:Luac;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lcxc;

    return-object p0
.end method

.method public static u(Lizd;)Lbxc;
    .registers 6

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2, v1}, Landroid/util/SparseArray;-><init>(I)V

    :goto_10
    add-int/lit8 v3, v1, -0x1

    if-lez v1, :cond_2e

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_27

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v1, v3

    goto :goto_10

    :cond_27
    const-string p0, "Duplicate id"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    new-instance p0, Lbxc;

    invoke-direct {p0, v0, v2}, Lbxc;-><init>(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 3

    new-instance p0, Lbxc;

    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    const-string v1, ""

    invoke-direct {p0, v1, v0}, Lbxc;-><init>(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lcxc;->u(Lizd;)Lbxc;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lcxc;->u(Lizd;)Lbxc;

    move-result-object p0

    return-object p0
.end method
