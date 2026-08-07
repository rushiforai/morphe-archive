.class final Lcom/android/billingclient/api/n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ll/vkb0;

.field private final c:Lcom/android/billingclient/api/g0;

.field private final d:Lcom/android/billingclient/api/zzm;

.field private final e:Lcom/android/billingclient/api/zzm;

.field private f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/vkb0;Ll/tot0;Ll/bas0;Ll/ydk0;Lcom/android/billingclient/api/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/n0;->b:Ll/vkb0;

    .line 7
    .line 8
    iput-object p6, p0, Lcom/android/billingclient/api/n0;->c:Lcom/android/billingclient/api/g0;

    .line 9
    .line 10
    new-instance p1, Lcom/android/billingclient/api/zzm;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-direct {p1, p0, p2}, Lcom/android/billingclient/api/zzm;-><init>(Lcom/android/billingclient/api/n0;Z)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/billingclient/api/n0;->d:Lcom/android/billingclient/api/zzm;

    .line 17
    .line 18
    new-instance p1, Lcom/android/billingclient/api/zzm;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-direct {p1, p0, p2}, Lcom/android/billingclient/api/zzm;-><init>(Lcom/android/billingclient/api/n0;Z)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/billingclient/api/n0;->e:Lcom/android/billingclient/api/zzm;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic a(Lcom/android/billingclient/api/n0;)Ll/bas0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic b(Lcom/android/billingclient/api/n0;)Lcom/android/billingclient/api/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->c:Lcom/android/billingclient/api/g0;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/android/billingclient/api/n0;)Ll/vkb0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->b:Ll/vkb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Lcom/android/billingclient/api/n0;)Ll/ydk0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final d()Ll/vkb0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->b:Ll/vkb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/n0;->d:Lcom/android/billingclient/api/zzm;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/zzm;->c(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/billingclient/api/n0;->e:Lcom/android/billingclient/api/zzm;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/zzm;->c(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final g(Z)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    const-string v1, "com.android.vending.billing.PURCHASES_UPDATED"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/content/IntentFilter;

    .line 9
    .line 10
    const-string v2, "com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v2, "com.android.vending.billing.ALTERNATIVE_BILLING"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/android/billingclient/api/n0;->f:Z

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/billingclient/api/n0;->e:Lcom/android/billingclient/api/zzm;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p1, v2, v1}, Lcom/android/billingclient/api/zzm;->a(Landroid/content/Context;Landroid/content/IntentFilter;)V

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/android/billingclient/api/n0;->f:Z

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/billingclient/api/n0;->d:Lcom/android/billingclient/api/zzm;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 36
    .line 37
    const-string p1, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST"

    .line 38
    .line 39
    invoke-virtual {v1, p0, v0, p1}, Lcom/android/billingclient/api/zzm;->b(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/android/billingclient/api/n0;->a:Landroid/content/Context;

    .line 44
    .line 45
    invoke-virtual {v1, p0, v0}, Lcom/android/billingclient/api/zzm;->a(Landroid/content/Context;Landroid/content/IntentFilter;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
