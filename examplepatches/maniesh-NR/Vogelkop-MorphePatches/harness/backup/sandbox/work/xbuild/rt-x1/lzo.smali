.class public final Llzo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:La3p;

.field public final b:Lyjo;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lng2;


# direct methods
.method public constructor <init>(La3p;Lyjo;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llzo;->a:La3p;

    iput-object p2, p0, Llzo;->b:Lyjo;

    iput-object p3, p0, Llzo;->c:Ljava/lang/String;

    iput-object p4, p0, Llzo;->d:Ljava/lang/String;

    new-instance p1, Lng2;

    const/16 p2, 0x8

    invoke-direct {p1, p2}, Lng2;-><init>(B)V

    const/4 p2, 0x0

    iput-byte p2, p1, Lng2;->b:B

    iput-object p1, p0, Llzo;->e:Lng2;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    const-string v0, "window.operaBridge.notifyOnDestroy()"

    iget-object v1, p0, Llzo;->a:La3p;

    invoke-virtual {v1, v0}, La3p;->g(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, v1, La3p;->j:Lbxk;

    sget-object v2, Ld1p;->a:Lt5p;

    iget-object v2, v1, La3p;->e0:Lkgo;

    sget-object v3, Ld1p;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v2, v1, La3p;->o:Lj2p;

    const-wide/16 v3, 0xfa0

    if-eqz v2, :cond_1c

    invoke-virtual {v2, v3, v4}, Lf2p;->a(J)V

    :cond_1c
    iput-object v0, v1, La3p;->o:Lj2p;

    iget-object v2, v1, La3p;->p:Lj2p;

    if-eqz v2, :cond_25

    invoke-virtual {v2, v3, v4}, Lf2p;->a(J)V

    :cond_25
    iput-object v0, v1, La3p;->p:Lj2p;

    iget-object p0, p0, Llzo;->e:Lng2;

    const/4 v0, 0x5

    iput-byte v0, p0, Lng2;->b:B

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Llzo;->e:Lng2;

    iget-byte v1, v0, Lng2;->b:B

    const/4 v2, 0x2

    if-eq v1, v2, :cond_b

    const/4 v2, 0x3

    if-eq v1, v2, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Llzo;->a:La3p;

    iget-object v1, p0, La3p;->o:Lj2p;

    if-eqz v1, :cond_24

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v2, p0, La3p;->v:Ln2p;

    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v2, Lito;->a:[Lito;

    iget-object p0, p0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->d:Ln2p;

    if-eq p0, v2, :cond_24

    invoke-virtual {v1}, Landroid/webkit/WebView;->onPause()V

    :cond_24
    const/4 p0, 0x4

    iput-byte p0, v0, Lng2;->b:B

    return-void
.end method

.method public final c()V
    .registers 13

    iget-object v0, p0, Llzo;->e:Lng2;

    iget-byte v1, v0, Lng2;->b:B

    if-nez v1, :cond_87

    const/4 v1, 0x1

    iput-byte v1, v0, Lng2;->b:B

    iget-object v0, p0, Llzo;->a:La3p;

    iget-object v1, p0, Llzo;->c:Ljava/lang/String;

    iget-object v2, p0, Llzo;->d:Ljava/lang/String;

    iput-object v1, v0, La3p;->b0:Ljava/lang/String;

    iput-object v2, v0, La3p;->c0:Ljava/lang/String;

    iget-object p0, p0, Llzo;->b:Lyjo;

    iget-object v1, p0, Lyjo;->c:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, La3p;->a:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "https"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "appassets.androidplatform.net"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    iget-object v2, v0, La3p;->l:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    iget-object p0, p0, Lyjo;->a:Ljava/lang/String;

    invoke-virtual {v1, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    iput-object p0, v0, La3p;->F:Landroid/net/Uri;

    iget-object v1, v0, La3p;->g:Lp7p;

    if-eqz v1, :cond_7e

    iget-object v2, v1, Lp7p;->a:Lvoo;

    instance-of v3, v2, Lylp;

    const/4 v4, 0x0

    if-eqz v3, :cond_55

    check-cast v2, Lylp;

    goto :goto_56

    :cond_55
    move-object v2, v4

    :goto_56
    if-eqz v2, :cond_7e

    new-instance v5, Lcap;

    iget-object v6, v2, Lvoo;->c:Ljava/lang/String;

    iget-object v3, v2, Lvoo;->b:Lpro;

    iget-object v7, v3, Lpro;->a:Ljava/lang/String;

    iget-object v8, v2, Lvoo;->j:Ljava/lang/String;

    iget-object v9, v2, Lvoo;->l:Lfuo;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v2

    invoke-virtual {v2}, Lt5p;->a()Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v2

    iget-boolean v2, v2, Lt5p;->c:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct/range {v5 .. v11}, Lcap;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v1, v1, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v5, v4, v1}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_7e
    iget-object v0, v0, La3p;->o:Lj2p;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_87
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Llzo;->e:Lng2;

    iget-byte v1, v0, Lng2;->b:B

    const/4 v2, 0x1

    if-ne v1, v2, :cond_15

    const/4 v1, 0x2

    iput-byte v1, v0, Lng2;->b:B

    const/4 v0, 0x0

    iget-object p0, p0, Llzo;->a:La3p;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v2, p0, La3p;->I:Z

    invoke-virtual {p0}, La3p;->b()V

    :cond_15
    return-void
.end method
