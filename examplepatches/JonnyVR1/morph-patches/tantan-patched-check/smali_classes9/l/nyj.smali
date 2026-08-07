.class public Ll/nyj;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/nyj;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 1

    .line 1
    const-string p0, "giftSetId"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftSuitEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;->showDialog()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/qyj;

    .line 24
    .line 25
    const/16 p3, 0xc8

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-direct {p2, p3, v0, p0}, Ll/qyj;-><init>(IZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
