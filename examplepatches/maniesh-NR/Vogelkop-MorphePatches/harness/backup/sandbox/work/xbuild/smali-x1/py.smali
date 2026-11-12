.class public final Lpy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lbi;

.field public final b:Landroid/net/Uri$Builder;

.field public final c:Loy;

.field public final d:Lry;

.field public final synthetic e:Li5o;

.field public final synthetic f:Li5o;

.field public final synthetic g:B

.field public final synthetic h:Li5o;


# direct methods
.method public constructor <init>(Li5o;Landroid/net/Uri$Builder;Loy;Lry;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpy;->f:Li5o;

    iput-object p1, p0, Lpy;->e:Li5o;

    iput-object p2, p0, Lpy;->b:Landroid/net/Uri$Builder;

    iput-object p3, p0, Lpy;->c:Loy;

    new-instance p1, Lbi;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lpy;->a:Lbi;

    iput-object p4, p0, Lpy;->d:Lry;

    return-void
.end method

.method public constructor <init>(Li5o;Landroid/net/Uri$Builder;Lqy;Lbi;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lpy;->g:B

    .line 28
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpy;->h:Li5o;

    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lpy;-><init>(Li5o;Landroid/net/Uri$Builder;Loy;Lry;)V

    return-void
.end method

.method public constructor <init>(Li5o;Landroid/net/Uri$Builder;Lqy;Lzx;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lpy;->g:B

    .line 26
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpy;->h:Li5o;

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lpy;-><init>(Li5o;Landroid/net/Uri$Builder;Loy;Lry;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lpy;->f:Li5o;

    iget-object v1, v0, Li5o;->h:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Laik;->a:[Ljava/lang/String;

    if-nez v1, :cond_12

    const-string v1, ""

    :cond_12
    iget-object v2, p0, Lpy;->a:Lbi;

    const-string v3, "gaid"

    invoke-virtual {v2, v3, v1}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Li5o;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lyi4;->m(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_26

    const-string v0, "false"

    goto :goto_28

    :cond_26
    const-string v0, "true"

    :goto_28
    const-string v1, "adoptout"

    invoke-virtual {v2, v1, v0}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lpy;->b()V

    return-void
.end method

.method public final b()V
    .registers 11

    iget-object v0, p0, Lpy;->e:Li5o;

    iget-object v1, v0, Li5o;->k:Ljava/lang/Object;

    check-cast v1, Lnz;

    iget-object v2, p0, Lpy;->b:Landroid/net/Uri$Builder;

    if-nez v1, :cond_1f

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lpy;->c:Loy;

    invoke-virtual {v1}, Loy;->a()Ltn;

    move-result-object v1

    iget-object p0, p0, Lpy;->d:Lry;

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Lry;->a(Ljava/lang/String;Ljava/lang/String;Ltn;)V

    return-void

    :cond_1f
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lpy;->a:Lbi;

    const-string v5, "osintver"

    invoke-virtual {v4, v5, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "hasmytarget"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v3, v6}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "hasrtb"

    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v3, v6}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "adpos0"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "os"

    const-string v7, "android"

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "osver"

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "product"

    const-string v7, "opera"

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "pkgver"

    iget-object v7, v1, Lnz;->f:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "pkgname"

    iget-object v7, v1, Lnz;->e:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "manufacturer"

    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "model"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v7, v1, Lnz;->a:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const-string v7, "memory"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, v1, Lnz;->b:Z

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    const-string v7, "hasgp"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, v1, Lnz;->c:Z

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    const-string v7, "hasfb"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "language"

    iget-object v7, v1, Lnz;->d:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget v3, v1, Lnz;->g:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v7, "pkgintver"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget v3, v1, Lnz;->i:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v7, "instime"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "inspkgver"

    iget-object v7, v1, Lnz;->j:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "operator"

    iget-object v7, v1, Lnz;->k:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "country"

    iget-object v7, v1, Lnz;->l:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "features"

    iget-object v7, v1, Lnz;->m:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "channel"

    iget-object v7, v1, Lnz;->n:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "opid"

    iget-object v7, v1, Lnz;->o:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "insreferrer"

    iget-object v7, v1, Lnz;->p:Ljava/lang/String;

    invoke-virtual {v4, v3, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-byte v3, v1, Lnz;->q:B

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v7, "newscolumns"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v1, Lnz;->h:Ljava/lang/String;

    if-eqz v1, :cond_fd

    const-string v3, "installer_package"

    invoke-virtual {v4, v3, v1}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_fd
    iget-object v1, v0, Li5o;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v3, v0, Li5o;->g:Ljava/lang/Object;

    check-cast v3, Lvx;

    invoke-static {}, Lsle;->c()I

    move-result v7

    const/4 v8, 0x2

    if-eq v7, v8, :cond_11d

    const/4 v9, 0x3

    if-eq v7, v9, :cond_11e

    const/4 v8, 0x4

    if-eq v7, v8, :cond_11b

    const/4 v9, 0x5

    if-eq v7, v9, :cond_11e

    const/16 v8, 0x8

    if-eq v7, v8, :cond_11b

    move v8, v5

    goto :goto_11e

    :cond_11b
    move v8, v9

    goto :goto_11e

    :cond_11d
    move v8, v6

    :cond_11e
    :goto_11e
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "net"

    invoke-virtual {v4, v8, v7}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lvx;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_138

    const-string v7, "ip_country"

    invoke-virtual {v4, v7, v3}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_138
    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v1

    invoke-virtual {v1}, Lv1;->x()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Laik;->a:[Ljava/lang/String;

    const-string v3, "abgroup"

    invoke-virtual {v4, v3, v1}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lhy;

    iget-object v0, v0, Li5o;->b:Ljava/lang/Object;

    check-cast v0, Ljy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v3, Lwx;

    invoke-direct {v3, p0, v1, v6}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v0, v1, v3, v5}, Lhy;-><init>(Lt9f;Ljava/lang/String;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Lg3k;->g()V

    return-void
.end method

.method public final run()V
    .registers 8

    iget-byte v0, p0, Lpy;->g:B

    iget-object v1, p0, Lpy;->a:Lbi;

    iget-object v2, p0, Lpy;->h:Li5o;

    packed-switch v0, :pswitch_data_6e

    iget-object v0, v2, Li5o;->n:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v3, "newsProvider"

    invoke-virtual {v1, v3, v0}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v2, Li5o;->m:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v3, "newsLanguageCode"

    invoke-virtual {v1, v3, v0}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v2, Li5o;->l:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v3, "zz"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    iget-object v0, v2, Li5o;->l:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v2, "newsCountryCode"

    invoke-virtual {v1, v2, v0}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_30
    invoke-virtual {p0}, Lpy;->a()V

    return-void

    :pswitch_34
    iget-object v0, v2, Li5o;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->f0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lete;

    iget-object v0, v0, Lete;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v2, "last_session"

    const-wide/16 v3, -0x1

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    cmp-long v0, v5, v3

    if-eqz v0, :cond_6a

    const-wide/16 v2, 0x3e8

    div-long/2addr v5, v2

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v2, "last_news_session_time"

    invoke-virtual {v1, v2, v0}, Lbi;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6a
    invoke-virtual {p0}, Lpy;->a()V

    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method
