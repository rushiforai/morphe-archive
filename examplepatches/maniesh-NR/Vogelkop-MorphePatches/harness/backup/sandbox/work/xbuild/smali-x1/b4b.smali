.class public final Lb4b;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lpza;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lpza;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lpza;-><init>(B)V

    sput-object v0, Lb4b;->k:Lpza;

    return-void
.end method

.method public static t(Lizd;)La4b;
    .registers 6

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_9
    add-int/lit8 v2, v0, -0x1

    if-lez v0, :cond_1f

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lz3b;

    invoke-direct {v4, v3, v0}, Lz3b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v2

    goto :goto_9

    :cond_1f
    new-instance p0, La4b;

    invoke-direct {p0, v1}, La4b;-><init>(Ljava/util/List;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 2

    new-instance p0, La4b;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, v0}, La4b;-><init>(Ljava/util/List;)V

    return-object p0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lb4b;->t(Lizd;)La4b;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lb4b;->t(Lizd;)La4b;

    move-result-object p0

    return-object p0
.end method
