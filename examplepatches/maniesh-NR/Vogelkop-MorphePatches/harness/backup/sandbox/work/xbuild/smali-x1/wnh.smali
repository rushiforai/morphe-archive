.class public final Lwnh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:Ljava/lang/String;

.field public final f:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x18

    .line 143
    iput v0, p0, Lwnh;->a:I

    const/16 v0, 0x1000

    .line 144
    iput v0, p0, Lwnh;->f:I

    const-wide/16 v0, 0x0

    .line 145
    iput-wide v0, p0, Lwnh;->b:J

    const-wide/16 v0, 0x64

    .line 146
    iput-wide v0, p0, Lwnh;->c:J

    const-wide/16 v0, 0x3e8

    .line 147
    iput-wide v0, p0, Lwnh;->d:J

    .line 148
    const-string v0, ""

    iput-object v0, p0, Lwnh;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lizd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(I)V

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v0, :cond_1b

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_1b
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    if-lez v1, :cond_36

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    iput-wide v1, p0, Lwnh;->b:J

    goto :goto_3a

    :cond_36
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lwnh;->b:J

    :goto_3a
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    if-lez v1, :cond_51

    iput v0, p0, Lwnh;->a:I

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lwnh;->c:J

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lwnh;->d:J

    goto :goto_5d

    :cond_51
    or-int/lit8 v0, v0, 0x18

    iput v0, p0, Lwnh;->a:I

    const-wide/16 v0, 0x64

    iput-wide v0, p0, Lwnh;->c:J

    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lwnh;->d:J

    :goto_5d
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    const-string v1, ""

    if-lez v0, :cond_71

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Laik;->a:[Ljava/lang/String;

    if-eqz v0, :cond_6e

    move-object v1, v0

    :cond_6e
    iput-object v1, p0, Lwnh;->e:Ljava/lang/String;

    goto :goto_73

    :cond_71
    iput-object v1, p0, Lwnh;->e:Ljava/lang/String;

    :goto_73
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_80

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lwnh;->f:I

    goto :goto_84

    :cond_80
    const/16 v0, 0x1000

    iput v0, p0, Lwnh;->f:I

    :goto_84
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result p0

    if-lez p0, :cond_8d

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    :cond_8d
    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    iget p0, p0, Lwnh;->a:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final b(I)Z
    .registers 2

    iget p0, p0, Lwnh;->f:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method
