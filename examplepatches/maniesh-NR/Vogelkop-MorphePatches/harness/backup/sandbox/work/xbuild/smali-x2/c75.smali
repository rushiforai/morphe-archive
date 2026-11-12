.class public final Lc75;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Ld75;

.field public static final l:Lio7;

.field public static final m:I

.field public static final n:Lyq4;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Ld75;

    const/4 v8, 0x0

    const/16 v9, 0xff

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v9}, Ld75;-><init>(Lo65;Lo65;Ljava/lang/String;ZZZZZI)V

    sput-object v0, Lc75;->k:Ld75;

    sget-object v0, Lio7;->D:Lio7;

    sput-object v0, Lc75;->l:Lio7;

    const/16 v0, 0x11

    sput v0, Lc75;->m:I

    new-instance v0, Lyq4;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lyq4;-><init>(B)V

    sput-object v0, Lc75;->n:Lyq4;

    return-void
.end method

.method public static t(Lizd;)Ld75;
    .registers 13

    :try_start_0
    const-string v0, ""

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    new-instance v2, Ld75;

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_f

    move-object v3, v0

    :cond_f
    invoke-static {v3}, Luup;->p(Ljava/lang/String;)Lo65;

    move-result-object v3

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1a

    move-object v4, v0

    :cond_1a
    invoke-static {v4}, Luup;->p(Ljava/lang/String;)Lo65;

    move-result-object v4

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_26

    move-object v5, v0

    goto :goto_27

    :cond_26
    move-object v5, p0

    :goto_27
    and-int/lit8 p0, v1, 0x1

    const/4 v0, 0x0

    const/4 v6, 0x1

    if-eqz p0, :cond_2f

    move p0, v6

    goto :goto_31

    :cond_2f
    move p0, v6

    move v6, v0

    :goto_31
    and-int/lit8 v7, v1, 0x2

    if-eqz v7, :cond_37

    move v7, p0

    goto :goto_38

    :cond_37
    move v7, v0

    :goto_38
    and-int/lit8 v8, v1, 0x4

    if-eqz v8, :cond_3e

    move v8, p0

    goto :goto_3f

    :cond_3e
    move v8, v0

    :goto_3f
    and-int/lit8 v9, v1, 0x8

    if-eqz v9, :cond_45

    move v9, p0

    goto :goto_46

    :cond_45
    move v9, v0

    :goto_46
    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_4c

    move v10, p0

    goto :goto_4d

    :cond_4c
    move v10, v0

    :goto_4d
    const/16 v11, 0x100

    invoke-direct/range {v2 .. v11}, Ld75;-><init>(Lo65;Lo65;Ljava/lang/String;ZZZZZI)V
    :try_end_52
    .catchall {:try_start_0 .. :try_end_52} :catchall_53

    return-object v2

    :catchall_53
    sget-object p0, Lc75;->k:Ld75;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lc75;->k:Ld75;

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lc75;->t(Lizd;)Ld75;

    move-result-object p0

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lc75;->t(Lizd;)Ld75;

    move-result-object p0

    return-object p0
.end method
