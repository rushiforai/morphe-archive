.class public final Ltfn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:I

.field public final c:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 60
    iput-wide v0, p0, Ltfn;->a:J

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Ltfn;->b:I

    const/4 v0, 0x0

    .line 62
    iput-object v0, p0, Ltfn;->c:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lizd;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lizd;->k()J

    move-result-wide v0

    iput-wide v0, p0, Ltfn;->a:J

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ltfn;->b:I

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_37

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Ltfn;->c:[Ljava/lang/String;

    const/4 v1, 0x0

    :goto_1e
    if-ge v1, v0, :cond_36

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ltfn;->c:[Ljava/lang/String;

    if-eqz v2, :cond_2f

    const-string v4, "sha256/"

    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_31

    :cond_2f
    const-string v2, ""

    :goto_31
    aput-object v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    :cond_36
    return-void

    :cond_37
    const/4 p1, 0x0

    iput-object p1, p0, Ltfn;->c:[Ljava/lang/String;

    return-void
.end method
