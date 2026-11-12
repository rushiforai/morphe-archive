.class public final Lru3;
.super Lcx3;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lre7;)V
    .registers 4

    iput-object p1, p0, Lru3;->d:Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcx3;-><init>(Ldx3;Lre7;B)V

    return-void
.end method


# virtual methods
.method public final c(Lre7;Z)V
    .registers 10

    iget-object v0, p0, Lru3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v1, v2

    :cond_8
    iget v3, p1, Lre7;->b:I

    invoke-virtual {v1, v3}, Lk6l;->r(I)Lb2l;

    move-result-object v1

    if-eqz v1, :cond_62

    iget-object v3, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v3, :cond_15

    move-object v3, v2

    :cond_15
    iget-object v3, v3, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    move-object v3, v1

    check-cast v3, Ld7l;

    iget-object v4, v3, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->isLoading()Z

    move-result v4

    if-nez v4, :cond_62

    invoke-virtual {v3}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v3

    check-cast v3, Liuh;

    iget-object v4, v3, Liuh;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v4}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v5

    const/4 v6, 0x1

    if-gt v5, v6, :cond_62

    invoke-interface {v4}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v4

    if-ne v4, v6, :cond_5a

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v3

    invoke-interface {v3}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5a

    const-string v4, "about:blank"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    :cond_5a
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_5f

    move-object v2, v0

    :cond_5f
    invoke-virtual {v2, v1}, Lk6l;->k(Lb2l;)V

    :cond_62
    invoke-super {p0, p1, p2}, Lcx3;->c(Lre7;Z)V

    return-void
.end method

.method public final d(Lre7;ZLmej;)Lef7;
    .registers 12

    new-instance v0, Lef7;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Lru3;->d:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object v5, p0, Lsf7;->a:Lrf7;

    new-instance v6, Lk5o;

    invoke-direct {v6, v2}, Lk5o;-><init>(Lcom/opera/android/BrowserActivity;)V

    iget-object v7, v2, Lcom/opera/android/BrowserActivity;->o0:Lwjh;

    move-object v3, p1

    move v4, p2

    move-object v1, p3

    invoke-direct/range {v0 .. v7}, Lef7;-><init>(Lmej;Ldx3;Lre7;ZLrf7;Ljv0;Lwjh;)V

    return-object v0
.end method

.method public final e(Lre7;)Lvwh;
    .registers 6

    new-instance v0, Lpqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lru3;->d:Lcom/opera/android/BrowserActivity;

    iget-object v2, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v3, 0x0

    if-nez v2, :cond_d

    move-object v2, v3

    :cond_d
    iget p1, p1, Lre7;->b:I

    invoke-virtual {v2, p1}, Lk6l;->r(I)Lb2l;

    move-result-object p1

    iput-object p1, v0, Lpqh;->a:Ljava/lang/Object;

    if-nez p1, :cond_20

    iget-object p1, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p1, :cond_1c

    move-object v3, p1

    :cond_1c
    iget-object p1, v3, Lk6l;->o:Lb2l;

    iput-object p1, v0, Lpqh;->a:Ljava/lang/Object;

    :cond_20
    if-eqz p1, :cond_29

    new-instance p0, Lqu3;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lqu3;-><init>(Lpqh;B)V

    return-object p0

    :cond_29
    new-instance p1, Lva2;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lva2;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method
