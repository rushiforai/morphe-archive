.class public final Lfjn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lru9;

.field public final c:Ldj9;

.field public final d:Lx5f;

.field public final e:Lzyk;

.field public final f:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lru9;Ldj9;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfjn;->a:Landroid/content/Context;

    iput-object p2, p0, Lfjn;->b:Lru9;

    iput-object p3, p0, Lfjn;->c:Ldj9;

    iput-object p4, p0, Lfjn;->d:Lx5f;

    new-instance p1, Lejn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lejn;-><init>(Lfjn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lfjn;->e:Lzyk;

    new-instance p1, Lejn;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lejn;-><init>(Lfjn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lfjn;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 6

    iget-object v0, p0, Lfjn;->b:Lru9;

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "crypto.wallet.wallet_removed"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_21

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "crypto.wallet.has_new_wallet"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_22

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "crypto.wallet.has_wallet"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_22

    :cond_21
    return v3

    :cond_22
    iget-object v0, p0, Lfjn;->c:Ldj9;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj9;

    iget-object v1, v0, Lcj9;->a:Ljava/lang/String;

    const-string v2, "ru"

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v4, 0x1

    if-nez v1, :cond_59

    iget-object v0, v0, Lcj9;->b:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    iget-object v0, p0, Lfjn;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    iget-object p0, p0, Lfjn;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5a

    :cond_59
    move v3, v4

    :cond_5a
    xor-int/2addr v3, v4

    return v3
.end method
