.class public final Lhzd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lhzd;


# instance fields
.field public final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhzd;

    invoke-direct {v0}, Lhzd;-><init>()V

    sput-object v0, Lhzd;->b:Lhzd;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lhzd;->a:Ljava/util/HashSet;

    return-void
.end method

.method public static a([B)Lbp;
    .registers 9

    new-instance v0, Lizd;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_94

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    if-eqz v1, :cond_8e

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    const-string v4, "Unexpected end of file while skipping bytes."

    if-lez v2, :cond_2c

    invoke-virtual {v0, v2}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v5

    if-eq v5, v2, :cond_2c

    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2c
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    if-lez v2, :cond_3e

    invoke-virtual {v0, v2}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v5

    if-eq v5, v2, :cond_3e

    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3e
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v2}, Ljava/util/HashMap;-><init>(I)V

    const/4 v5, 0x0

    :goto_48
    if-ge v5, v2, :cond_58

    invoke-virtual {v0}, Lizd;->h()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lizd;->h()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_48

    :cond_58
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v2

    const/4 v4, 0x6

    if-eq v2, v4, :cond_7c

    if-nez v2, :cond_76

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    new-instance v2, Lbp;

    new-instance v3, Lgzd;

    array-length v4, p0

    sub-int/2addr v4, v0

    invoke-direct {v3, p0, v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput v1, v2, Lbp;->a:I

    iput-object v3, v2, Lbp;->b:Ljava/lang/Object;

    return-object v2

    :cond_76
    const-string p0, "Incorrect response body format."

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_7c
    invoke-virtual {v0}, Lizd;->h()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Error message from server: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_8e
    const-string p0, "Cannot fulfill request."

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_94
    const-string p0, "Unrecognised response encoding version."

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3
.end method
