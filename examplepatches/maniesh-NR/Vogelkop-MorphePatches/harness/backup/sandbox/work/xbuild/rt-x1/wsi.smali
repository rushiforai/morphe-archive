.class public final Lwsi;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final d:Lgrk;

.field public final e:Leu3;

.field public final f:Z


# direct methods
.method public constructor <init>(Lgrk;Leu3;)V
    .registers 4

    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Lwsi;->d:Lgrk;

    iput-object p2, p0, Lwsi;->e:Leu3;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwsi;->f:Z

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    iget-object p0, p0, Lwsi;->d:Lgrk;

    iget-object p0, p0, Lgrk;->b:Lmrk;

    iget-object p0, p0, Lmrk;->h:Liv7;

    iget-object p0, p0, Liv7;->f:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leri;

    invoke-interface {p0}, Leri;->cancel()V

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 7

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_36

    invoke-static {p1}, Lwqm;->A(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_36

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lwqm;->F(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_36

    invoke-static {p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result p2

    iget-object v0, p0, Lwsi;->d:Lgrk;

    iget-object v0, v0, Lgrk;->b:Lmrk;

    iget-object v0, v0, Lmrk;->h:Liv7;

    iget-object v0, v0, Liv7;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leri;

    new-instance v1, Ltn;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p1, v1, Ltn;->b:Ljava/lang/Object;

    iput-boolean p2, v1, Ltn;->a:Z

    iput-object p4, v1, Ltn;->c:Ljava/lang/Object;

    iput-object p0, v1, Ltn;->d:Ljava/lang/Object;

    invoke-interface {v0, p1, p3, v1}, Leri;->i(Ljava/lang/String;ZLtn;)V

    return-void

    :cond_36
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method
