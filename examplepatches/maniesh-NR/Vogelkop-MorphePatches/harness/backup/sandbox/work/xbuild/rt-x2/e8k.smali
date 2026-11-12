.class public final Le8k;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lmw3;

.field public final b:Lpo7;

.field public final c:Lu8k;

.field public final d:Lkze;

.field public final e:Lkze;

.field public final f:Lkze;

.field public final g:Lx53;


# direct methods
.method public constructor <init>(Lmw3;Lpo7;Lu8k;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le8k;->a:Lmw3;

    iput-object p2, p0, Le8k;->b:Lpo7;

    iput-object p3, p0, Le8k;->c:Lu8k;

    new-instance v0, Lkze;

    invoke-virtual {p1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "startpage.allow_extended_behavior"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj7k;

    if-eqz v1, :cond_27

    iget v1, v1, Lj7k;->b:I

    goto :goto_28

    :cond_27
    move v1, v3

    :goto_28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le8k;->d:Lkze;

    new-instance v0, Lkze;

    invoke-virtual {p1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_4c

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj7k;

    if-eqz p1, :cond_4c

    iget-boolean p1, p1, Lj7k;->d:Z

    goto :goto_4d

    :cond_4c
    const/4 p1, 0x1

    :goto_4d
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-direct {v0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le8k;->e:Lkze;

    new-instance p1, Lkze;

    invoke-virtual {p3}, Lu8k;->b()Lt8k;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le8k;->f:Lkze;

    new-instance p1, Lx53;

    invoke-direct {p1, p0}, Lx53;-><init>(Le8k;)V

    iput-object p1, p0, Le8k;->g:Lx53;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 7

    iget-object v0, p0, Le8k;->a:Lmw3;

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "startpage.allow_extended_behavior"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iget-object v4, p0, Le8k;->b:Lpo7;

    if-eqz v1, :cond_20

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj7k;

    if-eqz v1, :cond_20

    iget v1, v1, Lj7k;->b:I

    goto :goto_21

    :cond_20
    move v1, v3

    :goto_21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v5, p0, Le8k;->d:Lkze;

    invoke-static {v5, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj7k;

    if-eqz v0, :cond_43

    iget-boolean v0, v0, Lj7k;->d:Z

    goto :goto_44

    :cond_43
    const/4 v0, 0x1

    :goto_44
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Le8k;->e:Lkze;

    invoke-static {v1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    iget-object v0, p0, Le8k;->c:Lu8k;

    invoke-virtual {v0}, Lu8k;->b()Lt8k;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p0, p0, Le8k;->f:Lkze;

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final W(Lndc;)V
    .registers 6

    new-instance v0, Ld8k;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld8k;-><init>(Le8k;B)V

    new-instance v1, Lt7d;

    const/16 v2, 0x13

    invoke-direct {v1, v0, v2}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v0, p0, Le8k;->b:Lpo7;

    invoke-virtual {v0, p1, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Le8k;->a:Lmw3;

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru9;

    iget-object v1, p0, Le8k;->g:Lx53;

    invoke-virtual {v0, v1}, Lru9;->a(Ln1;)V

    iget-object v0, p0, Le8k;->c:Lu8k;

    iget-object v0, v0, Lu8k;->d:Lode;

    new-instance v1, Ld8k;

    const/4 v3, 0x1

    invoke-direct {v1, p0, v3}, Ld8k;-><init>(Le8k;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, v1, v2}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Le8k;->a:Lmw3;

    invoke-virtual {p1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lru9;

    iget-object p0, p0, Le8k;->g:Lx53;

    invoke-virtual {p1, p0}, Lru9;->d(Ln1;)V

    return-void
.end method
