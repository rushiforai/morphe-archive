.class public abstract enum Lmgp;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lggp;

.field public static final synthetic c:[Lmgp;

.field public static final synthetic d:Lh58;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lggp;

    const-string v1, "RAW"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lmgp;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lmgp;->b:Lggp;

    new-instance v1, Lfgp;

    const-string v4, "GZIP"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lmgp;-><init>(Ljava/lang/String;IB)V

    new-array v4, v5, [Lmgp;

    aput-object v0, v4, v2

    aput-object v1, v4, v3

    sput-object v4, Lmgp;->c:[Lmgp;

    new-instance v0, Lh58;

    invoke-direct {v0, v4}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v0, Lmgp;->d:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IB)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lmgp;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmgp;
    .registers 2

    const-class v0, Lmgp;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmgp;

    return-object p0
.end method

.method public static values()[Lmgp;
    .registers 1

    sget-object v0, Lmgp;->c:[Lmgp;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmgp;

    return-object v0
.end method


# virtual methods
.method public d(Lfxo;)Ljava/io/InputStream;
    .registers 2

    new-instance p0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {p0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object p0
.end method
