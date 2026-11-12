.class public final La55;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpjn;

.field public final b:Landroid/util/SparseArray;

.field public final c:Lnrl;


# direct methods
.method public constructor <init>(Lpjn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, La55;->b:Landroid/util/SparseArray;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, La55;->c:Lnrl;

    iput-object p1, p0, La55;->a:Lpjn;

    new-instance p1, Llb4;

    const/16 v0, 0x10

    invoke-direct {p1, p0, v0}, Llb4;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    const/4 p0, 0x1

    invoke-static {p0, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(ILz45;)V
    .registers 13

    const-string v0, "anonymous_account"

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p1, v2, :cond_e

    if-ne p1, v1, :cond_a

    move-object v5, v0

    goto :goto_11

    :cond_a
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_e
    const-string v3, "accountless_subscriptions"

    move-object v5, v3

    :goto_11
    iget-object v8, p2, Lz45;->a:Ljava/lang/String;

    if-eq p1, v2, :cond_21

    if-ne p1, v1, :cond_1d

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object p2

    :goto_1b
    move-object v6, p2

    goto :goto_2a

    :cond_1d
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_21
    const-string p2, "anonymous_subscription_premium_beta"

    const-string v0, "subscriptions:extend_vpn"

    filled-new-array {p2, v0}, [Ljava/lang/String;

    move-result-object p2

    goto :goto_1b

    :goto_2a
    new-instance v4, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    const/4 v9, 0x0

    const-string v7, "ofa-beta-client"

    invoke-direct/range {v4 .. v9}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    iget-object p0, p0, La55;->b:Landroid/util/SparseArray;

    invoke-virtual {p0, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method
