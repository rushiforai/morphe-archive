.class public final Lbqe;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lcqe;

.field public static final l:Lrqd;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcqe;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcqe;-><init>(Ll0c;Z)V

    sput-object v0, Lbqe;->k:Lcqe;

    new-instance v0, Lrqd;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lrqd;-><init>(B)V

    sput-object v0, Lbqe;->l:Lrqd;

    return-void
.end method

.method public static t(Lizd;)Lcqe;
    .registers 3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object p0

    const-string v0, ""

    if-nez p0, :cond_c

    move-object p0, v0

    :cond_c
    invoke-static {p0}, Ll0c;->a(Ljava/lang/String;)Ll0c;

    move-result-object v1

    if-nez v1, :cond_1d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_1d

    invoke-static {v0}, Ls49;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1d
    new-instance p0, Lcqe;

    const/4 v0, 0x0

    invoke-direct {p0, v1, v0}, Lcqe;-><init>(Ll0c;Z)V

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lbqe;->k:Lcqe;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lbqe;->t(Lizd;)Lcqe;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lbqe;->t(Lizd;)Lcqe;

    move-result-object p0

    return-object p0
.end method
