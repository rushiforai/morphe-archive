.class public final Lbac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk9k;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lm9c;

.field public final c:Lkze;

.field public d:Z

.field public final e:Laac;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lm9c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbac;->a:Landroid/app/Activity;

    iput-object p2, p0, Lbac;->b:Lm9c;

    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lbac;->c:Lkze;

    new-instance p1, Laac;

    invoke-direct {p1, p0}, Laac;-><init>(Lbac;)V

    iput-object p1, p0, Lbac;->e:Laac;

    return-void
.end method


# virtual methods
.method public final a()Lize;
    .registers 1

    iget-object p0, p0, Lbac;->c:Lkze;

    return-object p0
.end method

.method public final b(Z)V
    .registers 4

    iget-object p1, p0, Lbac;->c:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    iget-object v0, p0, Lbac;->b:Lm9c;

    iget-object v1, v0, Lm9c;->d:Li7f;

    iget-object p0, p0, Lbac;->e:Laac;

    invoke-virtual {v1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2c

    iget p0, v1, Li7f;->c:I

    if-nez p0, :cond_2c

    iget-object p0, v0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    iget-object v0, v0, Lm9c;->e:Lwc9;

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_2c
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Lbac;->c:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lbac;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1, p0}, Lcom/opera/android/OperaApplication;->W(Landroid/app/Activity;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final start()V
    .registers 4

    iget-boolean v0, p0, Lbac;->d:Z

    if-nez v0, :cond_2e

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbac;->d:Z

    iget-object v1, p0, Lbac;->b:Lm9c;

    invoke-virtual {v1}, Lm9c;->a()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_13

    invoke-virtual {p0}, Lbac;->c()V

    return-void

    :cond_13
    iget-object v2, v1, Lm9c;->d:Li7f;

    iget-object p0, p0, Lbac;->e:Laac;

    invoke-virtual {v2, p0}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2e

    iget p0, v2, Li7f;->c:I

    if-ne p0, v0, :cond_2e

    iget-object p0, v1, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    iget-object v0, v1, Lm9c;->e:Lwc9;

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_2e
    return-void
.end method
