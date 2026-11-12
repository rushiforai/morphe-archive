.class public final Lgy;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lrbe;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrbe;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lrbe;-><init>(B)V

    sput-object v0, Lgy;->k:Lrbe;

    return-void
.end method

.method public static t(Lizd;)Ley;
    .registers 10

    invoke-virtual {p0}, Lizd;->k()J

    move-result-wide v1

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v4

    if-lez v4, :cond_55

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(I)V

    :goto_2b
    add-int/lit8 v6, v4, -0x1

    if-lez v4, :cond_52

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v4

    const/16 v7, 0x42

    if-eq v4, v7, :cond_4b

    const/16 v7, 0x44

    if-eq v4, v7, :cond_45

    const/16 v7, 0x53

    if-ne v4, v7, :cond_50

    sget-object v4, Lfy;->b:Lfy;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_50

    :cond_45
    sget-object v4, Lfy;->c:Lfy;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_50

    :cond_4b
    sget-object v4, Lfy;->a:Lfy;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_50
    :goto_50
    move v4, v6

    goto :goto_2b

    :cond_52
    :goto_52
    move p0, v0

    move-object v6, v5

    goto :goto_58

    :cond_55
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_52

    :goto_58
    new-instance v0, Ley;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    int-to-long v7, p0

    invoke-virtual {v4, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    invoke-direct/range {v0 .. v6}, Ley;-><init>(JIJLjava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 8

    new-instance v0, Ley;

    const-wide/32 v4, 0x5265c00

    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const-wide/16 v1, 0x23

    const/4 v3, 0x2

    invoke-direct/range {v0 .. v6}, Ley;-><init>(JIJLjava/util/List;)V

    return-object v0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lgy;->t(Lizd;)Ley;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lgy;->t(Lizd;)Ley;

    move-result-object p0

    return-object p0
.end method
