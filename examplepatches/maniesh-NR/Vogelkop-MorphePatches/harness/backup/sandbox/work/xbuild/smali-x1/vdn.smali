.class public final Lvdn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lefn;

.field public final c:Lhfn;

.field public final d:Lesk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lefn;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn.enabled"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lvdn;->a:Z

    const-string v1, "vpn.enable_only_in_incognito"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    new-instance v0, Ludn;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Ludn;-><init>(BZ)V

    iput-object v0, p0, Lvdn;->d:Lesk;

    goto :goto_30

    :cond_27
    new-instance v0, Lk32;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p1, v1}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    iput-object v0, p0, Lvdn;->d:Lesk;

    :goto_30
    iput-object p2, p0, Lvdn;->b:Lefn;

    const/4 p1, 0x0

    iput-object p1, p0, Lvdn;->c:Lhfn;

    return-void
.end method

.method public constructor <init>(ZZLefn;Lhfn;)V
    .registers 6

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-boolean p1, p0, Lvdn;->a:Z

    .line 56
    new-instance p1, Ludn;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p2}, Ludn;-><init>(BZ)V

    iput-object p1, p0, Lvdn;->d:Lesk;

    .line 57
    iput-object p3, p0, Lvdn;->b:Lefn;

    .line 58
    iput-object p4, p0, Lvdn;->c:Lhfn;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-boolean v0, p0, Lvdn;->a:Z

    if-eqz v0, :cond_14

    iget-object p0, p0, Lvdn;->d:Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 1

    iget-object p0, p0, Lvdn;->d:Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_46

    const-class v2, Lvdn;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_46

    check-cast p1, Lvdn;

    iget-boolean v2, p0, Lvdn;->a:Z

    iget-boolean v3, p1, Lvdn;->a:Z

    if-ne v2, v3, :cond_46

    iget-object v2, p0, Lvdn;->d:Lesk;

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, p1, Lvdn;->d:Lesk;

    invoke-interface {v3}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-ne v2, v3, :cond_46

    iget-object v2, p0, Lvdn;->b:Lefn;

    iget-object v3, p1, Lvdn;->b:Lefn;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    iget-object p0, p0, Lvdn;->c:Lhfn;

    iget-object p1, p1, Lvdn;->c:Lhfn;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_46

    return v0

    :cond_46
    return v1
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lvdn;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lvdn;->d:Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lvdn;->b:Lefn;

    iget-object p0, p0, Lvdn;->c:Lhfn;

    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
