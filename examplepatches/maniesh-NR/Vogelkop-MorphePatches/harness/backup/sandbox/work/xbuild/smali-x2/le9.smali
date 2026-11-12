.class public final Lle9;
.super Ls43;
.source "SourceFile"

# interfaces
.implements Lmo7;


# static fields
.field public static final synthetic g:I


# instance fields
.field public final d:Loji;

.field public e:Landroid/net/Uri;

.field public final f:Le3j;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Loji;)V
    .registers 4

    invoke-direct {p0, p2}, Ls43;-><init>(Lumi;)V

    iput-object p3, p0, Lle9;->d:Loji;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-static {p1}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p1

    iput-object p1, p0, Lle9;->f:Le3j;

    new-instance p1, Landroid/net/Uri$Builder;

    invoke-direct {p1}, Landroid/net/Uri$Builder;-><init>()V

    const-string p2, "https"

    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string p2, "v1"

    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string p2, "flow.opera.com"

    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lle9;->e:Landroid/net/Uri;

    iget-object p1, p0, Lle9;->f:Le3j;

    if-eqz p1, :cond_37

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    :cond_37
    return-void
.end method

.method public static c(Lswl;Lcom/opera/api/Callback;)Lzd2;
    .registers 3

    new-instance v0, Lzd2;

    invoke-direct {v0, p0, p1}, Lzd2;-><init>(Lswl;Lcom/opera/api/Callback;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-static {v0, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object p1

    const/4 p2, 0x2

    invoke-static {p1, p2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :try_start_23
    const-string p1, "SHA-512"

    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    invoke-static {p0, p2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0
    :try_end_35
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_23 .. :try_end_35} :catch_36

    goto :goto_38

    :catch_36
    const-string p0, ""

    :goto_38
    const-string p1, "$"

    invoke-static {v0, p0, p1, p3}, Lp3p;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static e(Lorb;Ljava/util/ArrayList;)Lowl;
    .registers 8

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    const-string v0, "connecting_device"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "devices"

    invoke-virtual {p0, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object p0

    const/4 v2, 0x0

    move v3, v2

    :goto_12
    iget-object v4, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_40

    invoke-virtual {p0, v3}, Lvpb;->c(I)Lorb;

    move-result-object v4

    if-eqz v0, :cond_35

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_35

    new-instance v1, Lowl;

    invoke-direct {v1, v4}, Lowl;-><init>(Lorb;)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    :cond_35
    new-instance v5, Lpwl;

    invoke-direct {v5, v4, v2}, Lpwl;-><init>(Lorb;B)V

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_40
    return-object v1
.end method


# virtual methods
.method public final b()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lle9;->e:Landroid/net/Uri;

    return-object p0
.end method

.method public final o(Z)V
    .registers 4

    iget-object p1, p0, Lle9;->f:Le3j;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld3j;

    const/16 v0, 0x1a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object p1

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "v1"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    if-nez p1, :cond_25

    const-string p1, "flow.opera.com"

    goto :goto_29

    :cond_25
    iget-object p1, p1, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p1, Ljava/lang/String;

    :goto_29
    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lle9;->e:Landroid/net/Uri;

    return-void
.end method
