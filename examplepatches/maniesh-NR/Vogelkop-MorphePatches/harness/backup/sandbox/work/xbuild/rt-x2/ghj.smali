.class public final Lghj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldb;

.field public final b:Lyv3;

.field public final c:Lyv3;

.field public final d:Ljava/util/ArrayList;

.field public e:Lfhj;


# direct methods
.method public constructor <init>(Ldb;Lyv3;Lyv3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lghj;->a:Ldb;

    iput-object p2, p0, Lghj;->b:Lyv3;

    iput-object p3, p0, Lghj;->c:Lyv3;

    new-instance p2, Lnj2;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lnj2;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lghj;->d:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ldb;->a(Lcb;)V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lghj;->e:Lfhj;

    if-eqz v0, :cond_1a

    iget-object v0, v0, Lfhj;->a:Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-virtual {v0}, Lcom/opera/android/oauth2/OperaAccessToken;->a()Z

    move-result v1

    if-nez v1, :cond_17

    new-instance p0, Ljsl;

    iget-object v0, v0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-direct {p0, v0}, Ljsl;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_17
    const/4 v0, 0x0

    iput-object v0, p0, Lghj;->e:Lfhj;

    :cond_1a
    iget-object v0, p0, Lghj;->a:Ldb;

    iget-object v1, v0, Ldb;->a:Lbb;

    iget-boolean v1, v1, Lbb;->f:Z

    if-nez v1, :cond_28

    iget-object p0, p0, Lghj;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_28
    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    if-eqz v1, :cond_40

    new-instance v1, Lmgh;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p0, :cond_3c

    invoke-virtual {v1}, Lmgh;->b()V

    return-void

    :cond_3c
    invoke-virtual {p0, v2, v1}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    return-void

    :cond_40
    iget-object v0, p0, Lghj;->b:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Lghj;->c:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    new-instance v1, Lmb;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    return-void

    :cond_60
    sget-object p0, Lhsl;->a:Lhsl;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lghj;->e:Lfhj;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, v0, Lfhj;->a:Lcom/opera/android/oauth2/OperaAccessToken;

    if-eqz v0, :cond_c

    iget-object v0, v0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iput-object v1, p0, Lghj;->e:Lfhj;

    :cond_15
    iget-object v0, p0, Lghj;->a:Ldb;

    iget-object v2, v0, Ldb;->a:Lbb;

    iget-boolean v2, v2, Lbb;->f:Z

    if-eqz v2, :cond_6c

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v2

    if-eqz v2, :cond_43

    iget-object p0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz p0, :cond_6c

    invoke-virtual {p0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->e:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    iget-object v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    if-eqz v0, :cond_3d

    iget-object v0, v0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    iput-object v1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    :cond_3d
    iget-wide v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->MKrLKVPe(JLjava/lang/Object;)V

    return-void

    :cond_43
    iget-object v0, p0, Lghj;->b:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object p0, p0, Lghj;->c:Lyv3;

    invoke-virtual {p0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    iget-object v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    if-eqz v0, :cond_67

    iget-object v0, v0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_67

    iput-object v1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    :cond_67
    iget-wide v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->MKrLKVPe(JLjava/lang/Object;)V

    :cond_6c
    return-void
.end method
