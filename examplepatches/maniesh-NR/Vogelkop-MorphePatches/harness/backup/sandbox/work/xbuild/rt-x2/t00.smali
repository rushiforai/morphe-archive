.class public final synthetic Lt00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lt00;->a:B

    iput-object p1, p0, Lt00;->b:Ljava/lang/Object;

    iput-object p2, p0, Lt00;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 5

    iget-byte v0, p0, Lt00;->a:B

    iget-object v1, p0, Lt00;->c:Ljava/lang/Object;

    iget-object p0, p0, Lt00;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_60

    check-cast p0, Ljava/lang/String;

    check-cast v1, Lmqk;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_16

    invoke-virtual {v1}, Lmqk;->e()V

    :cond_16
    return-void

    :pswitch_17
    check-cast p0, Lpsi;

    check-cast v1, Ls4f;

    iget-object p0, p0, Lpsi;->s:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_26

    invoke-virtual {v1}, Ls4f;->invoke()Ljava/lang/Object;

    :cond_26
    return-void

    :pswitch_27
    check-cast p0, Lsyd;

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v0, "offline_pages_location"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_37

    const/4 p1, 0x0

    invoke-virtual {p0, v1, p1}, Lsyd;->a(Landroid/content/SharedPreferences;Z)V

    :cond_37
    return-void

    :pswitch_38
    check-cast p0, Lv00;

    check-cast v1, Lhjf;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v2, -0x32e5283f

    if-eq v0, v2, :cond_53

    const v2, 0x305544d2

    if-ne v0, v2, :cond_5e

    const-string v0, "personalized_default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5b

    goto :goto_5e

    :cond_53
    const-string v0, "personalized_ads"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5e

    :cond_5b
    invoke-virtual {p0, v1}, Lv00;->c(Landroid/content/Context;)V

    :cond_5e
    :goto_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_38
        :pswitch_27
        :pswitch_17
    .end packed-switch
.end method
