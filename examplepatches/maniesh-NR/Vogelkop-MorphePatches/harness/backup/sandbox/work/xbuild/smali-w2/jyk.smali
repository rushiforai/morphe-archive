.class public final Ljyk;
.super Lzz2;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final synthetic e:Lmyk;


# direct methods
.method public constructor <init>(Lmyk;Lcom/opera/api/Callback;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ljyk;->d:B

    .line 46
    iput-object p1, p0, Ljyk;->e:Lmyk;

    .line 47
    invoke-direct {p0, p1, p2}, Lzz2;-><init>(Lmyk;Lcom/opera/api/Callback;)V

    .line 48
    iget-object p1, p1, Lmyk;->b:Ldb;

    new-instance p2, Lzzh;

    const/16 v0, 0x15

    invoke-direct {p2, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    new-instance p0, Leme;

    invoke-direct {p0, p1, p2}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    .line 51
    iget-object p1, p1, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_21

    .line 52
    invoke-virtual {p0}, Leme;->b()V

    goto :goto_25

    :cond_21
    const/4 p2, 0x0

    .line 53
    invoke-virtual {p1, p2, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    :goto_25
    return-void
.end method

.method public constructor <init>(Lmyk;Lixk;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ljyk;->d:B

    .line 38
    iput-object p1, p0, Ljyk;->e:Lmyk;

    .line 39
    invoke-direct {p0, p1, p2}, Lzz2;-><init>(Lmyk;Lcom/opera/api/Callback;)V

    .line 40
    iget-object p1, p1, Lmyk;->b:Ldb;

    new-instance p2, Lzzh;

    const/16 v1, 0x15

    invoke-direct {p2, p0, v1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    .line 41
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    new-instance p0, Leme;

    invoke-direct {p0, p1, p2}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    .line 43
    iget-object p1, p1, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_21

    .line 44
    invoke-virtual {p0}, Leme;->b()V

    goto :goto_24

    .line 45
    :cond_21
    invoke-virtual {p1, v0, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    :goto_24
    return-void
.end method

.method public constructor <init>(Lmyk;Lzzh;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Ljyk;->d:B

    iput-object p1, p0, Ljyk;->e:Lmyk;

    invoke-direct {p0, p1, p2}, Lzz2;-><init>(Lmyk;Lcom/opera/api/Callback;)V

    iget-object p1, p1, Lmyk;->b:Ldb;

    new-instance p2, Lzzh;

    const/16 v0, 0x15

    invoke-direct {p2, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Leme;

    invoke-direct {p0, p1, p2}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    iget-object p1, p1, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_21

    invoke-virtual {p0}, Leme;->b()V

    goto :goto_25

    :cond_21
    const/4 p2, 0x0

    invoke-virtual {p1, p2, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    :goto_25
    return-void
.end method


# virtual methods
.method public final d(Lcom/opera/android/oauth2/OperaAccessToken;)Lih4;
    .registers 11

    iget-byte v0, p0, Ljyk;->d:B

    iget-object v1, p0, Ljyk;->e:Lmyk;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_6e

    if-nez p1, :cond_10

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lzz2;->c(Ljava/lang/Boolean;)V

    goto :goto_29

    :cond_10
    iget-object v0, v1, Lmyk;->e:Ldi2;

    new-instance v1, Lqlk;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lzzh;

    const/16 v3, 0x18

    invoke-direct {v2, p0, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lci2;

    invoke-direct {p0, v0, v2, p1, v1}, Lci2;-><init>(Ldi2;Lzzh;Lcom/opera/android/oauth2/OperaAccessToken;Lqlk;)V

    move-object v2, p0

    :goto_29
    return-object v2

    :pswitch_2a
    if-nez p1, :cond_32

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lzz2;->c(Ljava/lang/Boolean;)V

    goto :goto_49

    :cond_32
    iget-object v0, v1, Lmyk;->e:Ldi2;

    new-instance v1, Lkyk;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lkyk;-><init>(Ljyk;B)V

    new-instance v2, Lkyk;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lkyk;-><init>(Ljyk;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lci2;

    invoke-direct {p0, v0, v2, p1, v1}, Lci2;-><init>(Ldi2;Lkyk;Lcom/opera/android/oauth2/OperaAccessToken;Lkyk;)V

    move-object v2, p0

    :goto_49
    return-object v2

    :pswitch_4a
    if-nez p1, :cond_52

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lzz2;->c(Ljava/lang/Boolean;)V

    goto :goto_6d

    :cond_52
    iget-object v4, v1, Lmyk;->e:Ldi2;

    new-instance v7, Lqlk;

    const/16 v0, 0x12

    invoke-direct {v7, p0, v0}, Lqlk;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lzzh;

    const/16 v0, 0x16

    invoke-direct {v5, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lci2;

    const/4 v8, 0x0

    move-object v6, p1

    invoke-direct/range {v3 .. v8}, Lci2;-><init>(Ldi2;Lzzh;Lcom/opera/android/oauth2/OperaAccessToken;Lqlk;B)V

    move-object v2, v3

    :goto_6d
    return-object v2

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_2a
    .end packed-switch
.end method
