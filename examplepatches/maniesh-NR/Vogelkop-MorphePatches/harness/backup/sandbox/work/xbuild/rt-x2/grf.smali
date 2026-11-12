.class public final Lgrf;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Ls16;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ls16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lgrf;->k:Ls16;

    return-void
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Lfrf;

    invoke-direct {p0}, Lfrf;-><init>()V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lfrf;

    invoke-direct {p0, p1}, Lfrf;-><init>(Lizd;)V

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance p1, Lfrf;

    invoke-direct {p1, p0}, Lfrf;-><init>(Lizd;)V

    return-object p1
.end method
