.class public final Ltjm;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lv3m;

.field public final d:Lk6l;

.field public final e:I

.field public f:Z


# direct methods
.method public constructor <init>(Lo4m;Lv3m;Lk6l;I)V
    .registers 6

    const/16 v0, 0x18

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ltjm;->c:Lv3m;

    iput-object p3, p0, Ltjm;->d:Lk6l;

    iput p4, p0, Ltjm;->e:I

    return-void
.end method

.method public static I0(Lv3m;Lb2l;)Z
    .registers 2

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_6e

    if-eqz p1, :cond_6e

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->A(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->c(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->r()Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6e

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_70

    :cond_6e
    const/4 p0, 0x0

    return p0

    :cond_70
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final H0()Z
    .registers 2

    iget-object v0, p0, Ltjm;->c:Lv3m;

    iget-object v0, v0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-boolean p0, p0, Ltjm;->f:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final J0(Z)V
    .registers 3

    iget-boolean v0, p0, Ltjm;->f:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Ltjm;->f:Z

    iget-object v0, p0, Ltjm;->d:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_21

    invoke-static {v0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    if-eqz v0, :cond_21

    if-eqz p1, :cond_1e

    iget p1, p0, Ltjm;->e:I

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    iput p1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->O:I

    :cond_21
    invoke-virtual {p0}, Ln1;->v0()V

    return-void
.end method
