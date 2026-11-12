.class public final Ldj9;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lj06;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lj06;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lj06;-><init>(B)V

    sput-object v0, Ldj9;->k:Lj06;

    return-void
.end method

.method public static t(Landroid/content/Context;)Ldj9;
    .registers 3

    sget-object v0, Lio7;->f:Lio7;

    sget-object v1, Ldj9;->k:Lj06;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Ldj9;

    return-object p0
.end method

.method public static u(Lizd;)Lcj9;
    .registers 9

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_c

    move-object v4, v1

    goto :goto_d

    :cond_c
    move-object v4, v0

    :goto_d
    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    move-object v5, v1

    goto :goto_16

    :cond_15
    move-object v5, v0

    :goto_16
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    const/4 v2, 0x0

    if-lez v0, :cond_2a

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_28

    move-object v0, v1

    :cond_28
    move-object v6, v0

    goto :goto_2b

    :cond_2a
    move-object v6, v2

    :goto_2b
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_3a

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_38

    move-object v1, p0

    :cond_38
    move-object v7, v1

    goto :goto_3b

    :cond_3a
    move-object v7, v2

    :goto_3b
    new-instance v2, Lcj9;

    invoke-direct/range {v2 .. v7}, Lcj9;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 7

    new-instance v0, Lcj9;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcj9;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Ldj9;->u(Lizd;)Lcj9;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Ldj9;->u(Lizd;)Lcj9;

    move-result-object p0

    return-object p0
.end method
