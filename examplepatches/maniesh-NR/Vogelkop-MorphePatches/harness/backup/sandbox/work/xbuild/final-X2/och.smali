.class public final Loch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1n;


# instance fields
.field public final synthetic a:B

.field public final b:Lwv1;


# direct methods
.method public synthetic constructor <init>(Lwv1;B)V
    .registers 3

    iput-byte p2, p0, Loch;->a:B

    iput-object p1, p0, Loch;->b:Lwv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(I)V
    .registers 6

    iget-byte v0, p0, Loch;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Loch;->b:Lwv1;

    packed-switch v0, :pswitch_data_86

    if-lez p1, :cond_1d

    const v0, 0x71b256a8

    if-ge p1, v0, :cond_1d

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/PushedContentHandler;

    sget-object p1, Lio7;->s:Lio7;

    invoke-virtual {p0, p1}, Lcom/opera/android/PushedContentHandler;->g(Lio7;)V

    :cond_1d
    return-void

    :pswitch_1e
    iget-object p0, p0, Lwv1;->b:Lb6h;

    if-lez p1, :cond_4c

    const v0, 0x719b5bd8

    if-ge p1, v0, :cond_4c

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    invoke-virtual {p1}, Ldb;->f()Z

    move-result p1

    if-eqz p1, :cond_4c

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    invoke-virtual {p1}, Ldb;->d()Z

    move-result p1

    if-nez p1, :cond_4c

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz p0, :cond_4c

    invoke-virtual {p0, v2}, Lcom/opera/android/oauth2/OAuth2Account;->e(Z)V

    :cond_4c
    return-void

    :pswitch_4d
    if-lez p1, :cond_73

    const v0, 0x7196b088

    if-ge p1, v0, :cond_73

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lglh;

    iget-object p1, p0, Lglh;->d:Lqie;

    iget-object v0, p0, Lglh;->c:Lumi;

    new-instance v2, Lpjg;

    const/16 v3, 0xf

    invoke-direct {v2, p0, v3}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v0, Loml;

    invoke-direct {v0, p0}, Loml;-><init>(Lnml;)V

    invoke-virtual {p1, v0, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_73
    return-void

    :pswitch_74
    if-eqz p1, :cond_84

    invoke-static {}, LJ/N;->M$R3b7KP()V

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/PushedContentHandler;

    invoke-virtual {p0, v2, v1}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_84
    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_74
        :pswitch_4d
        :pswitch_1e
    .end packed-switch
.end method
