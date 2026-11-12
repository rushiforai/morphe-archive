.class public final Lk7k;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lj7k;

.field public static final l:Lio7;

.field public static final m:I

.field public static final n:La3j;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lj7k;

    sget-object v1, Lpn7;->b:Lon7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v1, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lj7k;-><init>(IIJ)V

    sput-object v0, Lk7k;->k:Lj7k;

    sget-object v0, Lio7;->H:Lio7;

    sput-object v0, Lk7k;->l:Lio7;

    const/16 v0, 0x11

    sput v0, Lk7k;->m:I

    new-instance v0, La3j;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    sput-object v0, Lk7k;->n:La3j;

    return-void
.end method

.method public static t(Lizd;)Lj7k;
    .registers 5

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v2

    if-lez v2, :cond_1b

    sget-object v2, Lpn7;->b:Lon7;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result p0

    sget-object v2, Lun7;->h:Lun7;

    invoke-static {p0, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    goto :goto_22

    :cond_1b
    sget-object p0, Lpn7;->b:Lon7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v2, 0x0

    :goto_22
    new-instance p0, Lj7k;

    invoke-direct {p0, v0, v1, v2, v3}, Lj7k;-><init>(IIJ)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lk7k;->k:Lj7k;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lk7k;->t(Lizd;)Lj7k;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lk7k;->t(Lizd;)Lj7k;

    move-result-object p0

    return-object p0
.end method
