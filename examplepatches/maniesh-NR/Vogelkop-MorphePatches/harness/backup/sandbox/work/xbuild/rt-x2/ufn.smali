.class public final Lufn;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lbxl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbxl;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lufn;->k:Lbxl;

    return-void
.end method

.method public static t(Landroid/content/Context;)Lufn;
    .registers 3

    sget-object v0, Lio7;->o:Lio7;

    sget-object v1, Lufn;->k:Lbxl;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lufn;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Ltfn;

    invoke-direct {p0}, Ltfn;-><init>()V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Ltfn;

    invoke-direct {p0, p1}, Ltfn;-><init>(Lizd;)V

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance p1, Ltfn;

    invoke-direct {p1, p0}, Ltfn;-><init>(Lizd;)V

    return-object p1
.end method
