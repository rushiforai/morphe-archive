.class public final Ljy;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Li5o;


# direct methods
.method public synthetic constructor <init>(Li5o;B)V
    .registers 3

    iput-byte p2, p0, Ljy;->e:B

    iput-object p1, p0, Ljy;->f:Li5o;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ljy;->e:B

    iget-object p0, p0, Ljy;->f:Li5o;

    packed-switch v0, :pswitch_data_4e

    new-instance v0, Ljz;

    iget-object v1, p0, Li5o;->f:Ljava/lang/Object;

    check-cast v1, Lb59;

    iget-object v2, p0, Li5o;->b:Ljava/lang/Object;

    check-cast v2, Ljy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    iget-object p0, p0, Li5o;->j:Ljava/lang/Object;

    check-cast p0, Lsy;

    invoke-direct {v0, v1, v2, p0}, Ljz;-><init>(Lb59;Lt9f;Lsy;)V

    return-object v0

    :pswitch_1f
    new-instance v0, Lqag;

    iget-object v1, p0, Li5o;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Li5o;->e:Ljava/lang/Object;

    check-cast p0, Lumi;

    const-string v2, "AdsCookies"

    invoke-direct {v0, p0, v1, v2}, Lqag;-><init>(Lumi;Landroid/content/Context;Ljava/lang/String;)V

    new-instance p0, Ljava/net/CookieManager;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljava/net/CookieManager;-><init>(Ljava/net/CookieStore;Ljava/net/CookiePolicy;)V

    sget-object v0, Lg3k;->e:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-virtual {v0}, Lt9f;->b()Ls9f;

    move-result-object v0

    new-instance v1, Leq6;

    invoke-direct {v1, p0}, Leq6;-><init>(Ljava/net/CookieManager;)V

    iput-object v1, v0, Ls9f;->k:Liv5;

    new-instance p0, Lt9f;

    invoke-direct {p0, v0}, Lt9f;-><init>(Ls9f;)V

    return-object p0

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
