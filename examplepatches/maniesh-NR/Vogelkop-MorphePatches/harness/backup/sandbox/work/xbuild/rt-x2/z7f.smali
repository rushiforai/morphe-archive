.class public final Lz7f;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lrqd;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrqd;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lrqd;-><init>(B)V

    sput-object v0, Lz7f;->k:Lrqd;

    return-void
.end method


# virtual methods
.method public final bridge synthetic h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lx7f;->a:Lx7f;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    :try_start_0
    invoke-static {p1}, Lipe;->V(Lizd;)Lv7f;

    move-result-object p0
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_5

    return-object p0

    :catchall_5
    move-exception p0

    new-instance p1, Lw7f;

    invoke-direct {p1, p0}, Lw7f;-><init>(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_a
    invoke-static {p0}, Lipe;->V(Lizd;)Lv7f;

    move-result-object p0
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_f

    return-object p0

    :catchall_f
    move-exception p0

    new-instance p1, Lw7f;

    invoke-direct {p1, p0}, Lw7f;-><init>(Ljava/lang/Throwable;)V

    return-object p1
.end method
