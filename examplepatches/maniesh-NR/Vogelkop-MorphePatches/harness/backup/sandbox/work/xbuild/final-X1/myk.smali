.class public final Lmyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwl;


# instance fields
.field public final a:Lbf9;

.field public final b:Ldb;

.field public final c:Lzwk;

.field public final d:Lumi;

.field public final e:Ldi2;

.field public final f:Lj4c;

.field public final g:Lt1;

.field public final h:Ljava/util/HashMap;

.field public i:Llyk;

.field public j:Lr72;


# direct methods
.method public constructor <init>(Lbf9;Ldb;Lzwk;Lumi;Lj4c;Lt1;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmyk;->h:Ljava/util/HashMap;

    iput-object p1, p0, Lmyk;->a:Lbf9;

    iput-object p2, p0, Lmyk;->b:Ldb;

    iput-object p3, p0, Lmyk;->c:Lzwk;

    iput-object p4, p0, Lmyk;->d:Lumi;

    new-instance p1, Ldi2;

    new-instance p3, Lpi;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Lpi;-><init>(B)V

    invoke-direct {p1, p4, p3}, Ldi2;-><init>(Lumi;Lpi;)V

    iput-object p1, p0, Lmyk;->e:Ldi2;

    iput-object p5, p0, Lmyk;->f:Lj4c;

    iput-object p6, p0, Lmyk;->g:Lt1;

    new-instance p1, Lnj2;

    const/4 p3, 0x7

    invoke-direct {p1, p0, p3}, Lnj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Ldb;->a(Lcb;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lmyk;->f:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "bp"

    invoke-static {p0, v0}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method

.method public final b()Lbpd;
    .registers 6

    iget-object v0, p0, Lmyk;->f:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "bp"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_24

    iget-object v1, p0, Lmyk;->g:Lt1;

    invoke-virtual {v1}, Lt1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc36;

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Lc36;->b([B)[B

    move-result-object v0

    if-nez v0, :cond_26

    :cond_24
    move-object v1, v2

    goto :goto_2b

    :cond_26
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    :goto_2b
    if-eqz v1, :cond_33

    new-instance p0, Lbpd;

    invoke-direct {p0, v1}, Lbpd;-><init>(Ljava/lang/String;)V

    return-object p0

    :cond_33
    iget-object p0, p0, Lmyk;->b:Ldb;

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz p0, :cond_41

    iget-wide v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v3, 0x0

    cmp-long p0, v0, v3

    if-nez p0, :cond_43

    :cond_41
    move-object p0, v2

    goto :goto_49

    :cond_43
    invoke-static {v0, v1}, LJ/N;->Mv_cyjCV(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [B

    :goto_49
    if-eqz p0, :cond_51

    new-instance v0, Lbpd;

    invoke-direct {v0, p0}, Lbpd;-><init>([B)V

    return-object v0

    :cond_51
    return-object v2
.end method

.method public final c(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lmyk;->g:Lt1;

    invoke-virtual {v0}, Lt1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-virtual {v0, p1}, Lc36;->d([B)[B

    move-result-object p1

    if-nez p1, :cond_16

    invoke-virtual {p0}, Lmyk;->a()V

    return-void

    :cond_16
    const/4 v0, 0x2

    invoke-static {p1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lmyk;->f:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "bp"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Runnable;Lcom/opera/api/Callback;)Lih4;
    .registers 8

    iget-object v0, p0, Lmyk;->b:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_10

    const-string p0, "Already signed in"

    invoke-interface {p6, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lbf9;->A:Lbxl;

    return-object p0

    :cond_10
    iget-object v0, p0, Lmyk;->i:Llyk;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Llyk;->cancel()V

    :cond_17
    new-instance v0, Llyk;

    invoke-direct {v0, p0, p5, p6, p3}, Llyk;-><init>(Lmyk;Ljava/lang/Runnable;Lcom/opera/api/Callback;Ljava/lang/String;)V

    iput-object v0, p0, Lmyk;->i:Llyk;

    move-object p5, p3

    move-object p3, p4

    move-object p4, p2

    move-object p2, p1

    iget-object p1, p0, Lmyk;->b:Ldb;

    const/4 p6, 0x0

    invoke-virtual/range {p1 .. p6}, Ldb;->i(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lmyk;->i:Llyk;

    return-object p0
.end method
