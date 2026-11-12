.class public final Lp3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt3g;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lq3g;Ltu;)V
    .registers 5

    new-instance v0, Ls2g;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, p2, v1}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final b(Ls3g;Lve9;)V
    .registers 9

    iget-object v0, p1, Ls3g;->b:Ljava/lang/String;

    iget-object v1, p1, Ls3g;->c:Ljava/lang/String;

    iget-object v2, p1, Ls3g;->d:Ljava/lang/String;

    iget-object v3, p1, Ls3g;->e:Ljava/lang/String;

    new-instance v5, Lo8f;

    const/4 p0, 0x7

    invoke-direct {v5, p2, p0}, Lo8f;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, LJ/N;->MLjUywYX(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;)V

    return-void
.end method

.method public final c(Ls3g;Lsu;)V
    .registers 9

    iget-object v1, p1, Ls3g;->b:Ljava/lang/String;

    new-instance v2, Lorg/chromium/url/GURL;

    iget-object p0, p1, Ls3g;->c:Ljava/lang/String;

    invoke-direct {v2, p0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v4, Leof;

    const/4 p0, 0x3

    invoke-direct {v4, p2, p1, p0}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x3

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, LJ/N;->Mlf2hgTY(ILjava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final d(Lr3g;Lhu5;)V
    .registers 9

    invoke-interface {p1}, Lr3g;->o()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/chromium/url/GURL;

    invoke-interface {p1}, Lr3g;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v4, Leof;

    invoke-direct {v4, p2, p0, p1}, Leof;-><init>(Lhu5;Lp3g;Lr3g;)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x3

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, LJ/N;->Mlf2hgTY(ILjava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 8

    check-cast p1, Ls3g;

    iget-object p0, p1, Ls3g;->a:Ljava/lang/String;

    if-nez p0, :cond_c

    new-instance p0, Lcd6;

    invoke-direct {p0}, Lcd6;-><init>()V

    return-void

    :cond_c
    iget-object v1, p1, Ls3g;->b:Ljava/lang/String;

    new-instance v2, Lorg/chromium/url/GURL;

    iget-object p0, p1, Ls3g;->c:Ljava/lang/String;

    invoke-direct {v2, p0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v4, Lo8f;

    const/16 p0, 0x8

    invoke-direct {v4, p1, p0}, Lo8f;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x3

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, LJ/N;->Mlf2hgTY(ILjava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
