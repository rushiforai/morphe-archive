.class public final Lbvn;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lsjn;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lsjn;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lsjn;-><init>(B)V

    sput-object v0, Lbvn;->k:Lsjn;

    return-void
.end method

.method public static t(Lizd;)Lavn;
    .registers 8

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    :goto_d
    add-int/lit8 v3, v1, -0x1

    if-lez v1, :cond_42

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Laik;->a:[Ljava/lang/String;

    if-nez v1, :cond_1b

    const-string v1, ""

    :cond_1b
    const/16 v4, 0x3a

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_40

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v6, v4, 0x2

    if-lt v5, v6, :cond_40

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lszb;->d(ILjava/lang/String;)Lszb;

    move-result-object v5

    if-eqz v5, :cond_40

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_40
    move v1, v3

    goto :goto_d

    :cond_42
    new-instance p0, Lavn;

    invoke-direct {p0, v0, v2}, Lavn;-><init>(ILjava/util/HashMap;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 3

    new-instance p0, Lavn;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lavn;-><init>(ILjava/util/HashMap;)V

    return-object p0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lbvn;->t(Lizd;)Lavn;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lbvn;->t(Lizd;)Lavn;

    move-result-object p0

    return-object p0
.end method
