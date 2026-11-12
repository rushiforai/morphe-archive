.class public final Lrwn;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lioj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lioj;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lioj;-><init>(B)V

    sput-object v0, Lrwn;->k:Lioj;

    return-void
.end method

.method public static t(Lizd;)Lqwn;
    .registers 5

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(I)V

    :goto_9
    add-int/lit8 v2, v0, -0x1

    if-lez v0, :cond_16

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move v0, v2

    goto :goto_9

    :cond_16
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, v0}, Ljava/util/HashSet;-><init>(I)V

    :goto_1f
    add-int/lit8 v3, v0, -0x1

    if-lez v0, :cond_2c

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move v0, v3

    goto :goto_1f

    :cond_2c
    new-instance p0, Lqwn;

    invoke-direct {p0, v2, v1}, Lqwn;-><init>(Ljava/util/HashSet;Ljava/util/HashSet;)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 2

    new-instance p0, Lqwn;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lqwn;-><init>(Ljava/util/HashSet;Ljava/util/HashSet;)V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lrwn;->t(Lizd;)Lqwn;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lrwn;->t(Lizd;)Lqwn;

    move-result-object p0

    return-object p0
.end method
