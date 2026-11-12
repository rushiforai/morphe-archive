.class public final Lcom/opera/android/browser/chromium/TurboDelegate;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;
.implements Lagg;
.implements Lmo7;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lxi5;

.field public final c:Ldj9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lxi5;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->b:Lxi5;

    invoke-static {p0}, LJ/N;->MnCRwinB(Ljava/lang/Object;)V

    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifier;->addConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 p2, 0x1

    invoke-static {p2}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    invoke-static {}, Lsle;->c()I

    move-result v0

    const/4 v1, 0x3

    const-string v2, ""

    if-eq v0, v1, :cond_27

    const/4 v1, 0x4

    if-eq v0, v1, :cond_27

    const/4 v1, 0x5

    if-eq v0, v1, :cond_27

    const/16 v1, 0x8

    if-eq v0, v1, :cond_27

    move-object v0, v2

    move-object v1, v0

    goto :goto_2f

    :cond_27
    invoke-static {p1}, Li0l;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Li0l;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    :goto_2f
    if-eqz v0, :cond_35

    if-eqz v1, :cond_35

    move-object v2, v0

    goto :goto_36

    :cond_35
    move-object v1, v2

    :goto_36
    invoke-static {v2, v1}, LJ/N;->M_7qVdm3(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/TurboDelegate;->b()V

    invoke-static {p1}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->c:Ldj9;

    invoke-static {p1}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Li0l;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "ru"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5c

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5c

    invoke-virtual {v0, p0}, Lno7;->g(Lmo7;)V

    goto :goto_5f

    :cond_5c
    invoke-static {p2}, LJ/N;->M4ZjTA3h(Z)V

    :goto_5f
    new-instance p1, Lcbl;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lcak;->d:Lavj;

    const/4 p2, 0x2

    invoke-static {p2, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    sget-object p1, Lcom/opera/android/browser/obml/Platform;->e:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/TurboDelegate;->b()V

    invoke-static {}, LJ/N;->MdrkO_AS()V

    return-void
.end method

.method public final b()V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->a:Landroid/content/Context;

    invoke-static {p0}, Lpyn;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "phone_ua"

    invoke-static {v1, v0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_14

    const-string p0, "t"

    goto :goto_16

    :cond_14
    const-string p0, "m"

    :goto_16
    const-string v0, "form_factor"

    invoke-static {v0, p0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string p0, "language"

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string p0, "General"

    const-string v0, "Campaign"

    invoke-static {p0, v0}, LJ/N;->MQ$xB7I2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_35

    const-string v0, "campaign"

    invoke-static {v0, p0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_35
    const-string p0, "release_channel"

    const-string v0, "b"

    invoke-static {p0, v0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string p0, "distribution_source"

    const-string v0, "u"

    invoke-static {p0, v0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final o(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->c:Ldj9;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object p1, p0, Lcj9;->a:Ljava/lang/String;

    const-string v0, "ru"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1c

    iget-object p0, p0, Lcj9;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    const/4 p0, 0x0

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x1

    :goto_1d
    invoke-static {p0}, LJ/N;->M4ZjTA3h(Z)V

    return-void
.end method

.method public final onConnectionTypeChanged(I)V
    .registers 4

    invoke-static {}, Lsle;->c()I

    move-result p1

    const/4 v0, 0x3

    const-string v1, ""

    if-eq p1, v0, :cond_16

    const/4 v0, 0x4

    if-eq p1, v0, :cond_16

    const/4 v0, 0x5

    if-eq p1, v0, :cond_16

    const/16 v0, 0x8

    if-eq p1, v0, :cond_16

    move-object p0, v1

    move-object p1, p0

    goto :goto_20

    :cond_16
    iget-object p0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->a:Landroid/content/Context;

    invoke-static {p0}, Li0l;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Li0l;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    :goto_20
    if-eqz p1, :cond_26

    if-eqz p0, :cond_26

    move-object v1, p1

    goto :goto_27

    :cond_26
    move-object p0, v1

    :goto_27
    invoke-static {v1, p0}, LJ/N;->M_7qVdm3(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final onTurboStatistics(JJ)V
    .registers 5

    iget-object p0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->b:Lxi5;

    invoke-virtual {p0, p1, p2, p3, p4}, Lxi5;->i(JJ)V

    return-void
.end method
