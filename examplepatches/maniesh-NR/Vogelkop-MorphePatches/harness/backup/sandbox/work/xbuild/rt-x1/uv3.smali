.class public final Luv3;
.super Ly08;
.source "SourceFile"


# instance fields
.field public a:J

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Lcom/opera/android/OperaApplication;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/OperaApplication;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luv3;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Luv3;->c:Lcom/opera/android/OperaApplication;

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 7

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Luv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p2, p1}, Lcom/opera/android/BrowserActivity;->g(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_40

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Luv3;->a:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x2ee

    cmp-long p1, p1, v0

    if-lez p1, :cond_40

    iget-object p0, p0, Luv3;->c:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_40

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-static {p1, p2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/16 v0, 0x15

    const/4 v1, 0x1

    const-wide/16 v2, 0x1

    invoke-virtual {p1, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_40
    return-void
.end method

.method public final G(Lb2l;)V
    .registers 3

    iget-object p0, p0, Luv3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->h0:Lkze;

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lhjf;->C()V

    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-object p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Luv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p2, p1}, Lcom/opera/android/BrowserActivity;->g(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_14

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Luv3;->a:J

    :cond_14
    return-void
.end method
