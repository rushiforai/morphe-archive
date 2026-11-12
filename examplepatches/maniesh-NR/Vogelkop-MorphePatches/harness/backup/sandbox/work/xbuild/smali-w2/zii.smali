.class public final synthetic Lzii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:Liji;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Landroid/net/Uri;

.field public final synthetic e:Lumi;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Liji;Ljava/lang/String;ZLandroid/net/Uri;Lumi;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzii;->a:Liji;

    iput-object p2, p0, Lzii;->b:Ljava/lang/String;

    iput-boolean p3, p0, Lzii;->c:Z

    iput-object p4, p0, Lzii;->d:Landroid/net/Uri;

    iput-object p5, p0, Lzii;->e:Lumi;

    iput-boolean p6, p0, Lzii;->f:Z

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    check-cast p1, Ljava/util/Map;

    iget-object v3, p0, Lzii;->b:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lzii;->a:Liji;

    iget-object v2, p0, Lzii;->d:Landroid/net/Uri;

    iget-boolean v4, p0, Lzii;->f:Z

    const/4 v6, 0x0

    if-eqz v0, :cond_5e

    iget-boolean v0, p0, Lzii;->c:Z

    if-nez v0, :cond_19

    invoke-virtual {v1}, Liji;->P()V

    return-object v6

    :cond_19
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Liji;->q(Landroid/net/Uri;)Lfji;

    move-result-object v0

    const/4 v5, 0x1

    if-eqz v0, :cond_3b

    iget-object v7, v1, Liji;->e:Lfji;

    invoke-virtual {v7, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3b

    new-instance p0, Lwii;

    invoke-direct {p0, v1, v5}, Lwii;-><init>(Liji;B)V

    invoke-virtual {v1, v0, p0}, Liji;->k(Lfji;Lvwh;)V

    goto :goto_5e

    :cond_3b
    new-instance v0, Lyii;

    invoke-direct {v0, p1, v5}, Lyii;-><init>(Landroid/net/Uri;B)V

    iget-object p0, p0, Lzii;->e:Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v0, Lis6;

    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {p0, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    iget-object p1, v1, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p0, p1, v6}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-object v6

    :cond_5e
    :goto_5e
    new-instance v0, Lgg7;

    const/4 v5, 0x4

    invoke-direct/range {v0 .. v5}, Lgg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v1, v0}, Liji;->s(Lgg7;)V

    return-object v6
.end method
