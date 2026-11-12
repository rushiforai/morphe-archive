.class public abstract Lzb5;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lywh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqtm;)V
    .registers 4

    invoke-direct {p0, p1, p3, p3}, Lr22;-><init>(Landroid/content/Context;Lqtm;Ld93;)V

    iput-object p2, p0, Lzb5;->e:Lywh;

    return-void
.end method


# virtual methods
.method public final c()Landroid/net/Uri$Builder;
    .registers 6

    invoke-static {}, Lc26;->q()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lr22;->d:Ljava/lang/Object;

    iget-object p0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast p0, Ld93;

    iget-object p0, p0, Ld93;->a:Lyla;

    iget-object v0, p0, Lyla;->a:Ljava/net/URL;

    iget-object p0, p0, Lyla;->e:Ll0c;

    if-eqz p0, :cond_17

    iget-object v1, p0, Ll0c;->a:Ljava/lang/String;

    iget-object p0, p0, Ll0c;->b:Ljava/lang/String;

    goto :goto_1a

    :cond_17
    const-string v1, ""

    move-object p0, v1

    :goto_1a
    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "v1/localnews"

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "product"

    const-string v4, "opera"

    invoke-virtual {v0, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "country"

    invoke-virtual {v0, v3, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "language"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-object v2
.end method
