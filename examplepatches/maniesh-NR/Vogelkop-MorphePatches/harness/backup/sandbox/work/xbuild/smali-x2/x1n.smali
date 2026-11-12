.class public final Lx1n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1n;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lx1n;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Luu1;)V
    .registers 2

    const/4 p1, 0x1

    iput-byte p1, p0, Lx1n;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(I)V
    .registers 6

    iget-byte p0, p0, Lx1n;->a:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_8c

    if-lez p1, :cond_12

    const p0, 0x7193bea0

    if-ge p1, p0, :cond_12

    const-string p0, "https://www.sport.cz/"

    invoke-static {p0, v0}, Llx3;->a(Ljava/lang/String;Z)V

    :cond_12
    return-void

    :pswitch_13
    if-lez p1, :cond_2e

    const p0, 0x71983340

    if-ge p1, p0, :cond_2e

    const-string p0, "https://www.karaoketexty.cz/"

    invoke-static {p0, v0}, Llx3;->a(Ljava/lang/String;Z)V

    const-string p0, "https://www.kupi.cz/"

    invoke-static {p0, v0}, Llx3;->a(Ljava/lang/String;Z)V

    const-string p0, "https://www.novinky.cz/"

    invoke-static {p0, v0}, Llx3;->a(Ljava/lang/String;Z)V

    const-string p0, "https://www.super.cz/"

    invoke-static {p0, v0}, Llx3;->a(Ljava/lang/String;Z)V

    :cond_2e
    return-void

    :pswitch_2f
    if-lez p1, :cond_39

    const p0, 0x71954540

    if-ge p1, p0, :cond_39

    invoke-static {}, LJ/N;->MFg$8iJw()V

    :cond_39
    return-void

    :pswitch_3a
    if-lez p1, :cond_7e

    const p0, 0x7199c1b0

    if-ge p1, p0, :cond_7e

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p0, Ls9g;->h:Ls9g;

    iget-object p0, p0, Ls9g;->c:Lvzk;

    invoke-virtual {p0}, Lvzk;->D()Ljava/util/HashMap;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_53
    :goto_53
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_7e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljag;

    const/4 v2, 0x0

    sget-object v3, Llag;->b:Llag;

    invoke-virtual {v1, v3, v2}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v1

    sget-object v2, Lkag;->d:Lkag;

    if-ne v1, v2, :cond_53

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Ls9g;->h:Ls9g;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, v3, p1, v0}, Ls9g;->b(Llag;Ljava/lang/String;Z)V

    goto :goto_53

    :cond_7e
    return-void

    :pswitch_7f
    if-lez p1, :cond_8b

    const p0, 0x7182de50

    if-ge p1, p0, :cond_8b

    sget-object p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {}, LJ/N;->Mq7hzS$4()V

    :cond_8b
    return-void

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_7f
        :pswitch_3a
        :pswitch_2f
        :pswitch_13
    .end packed-switch
.end method
