.class public final Ltvg;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lhv5;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ltvg;->k:Lhv5;

    return-void
.end method

.method public static t(Landroid/content/Context;)Ltvg;
    .registers 3

    sget-object v0, Lio7;->y:Lio7;

    sget-object v1, Ltvg;->k:Lhv5;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Ltvg;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Lsvg;

    invoke-direct {p0}, Lsvg;-><init>()V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lsvg;

    invoke-direct {p0, p1}, Lsvg;-><init>(Lizd;)V

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_a
    new-instance p1, Lsvg;

    invoke-direct {p1, p0}, Lsvg;-><init>(Lizd;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_13

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p1

    :catchall_13
    move-exception p1

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p1
.end method
