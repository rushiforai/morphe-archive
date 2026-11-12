.class public final Lg8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ld8j;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Ldu3;

.field public final d:Lcom/opera/android/Lazy;

.field public final e:Ldu3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Ldu3;Lcom/opera/android/Lazy;Ldu3;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lg8j;->b:Lgjm;

    iput-object p3, p0, Lg8j;->c:Ldu3;

    iput-object p4, p0, Lg8j;->d:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lg8j;->e:Ldu3;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 6

    new-instance v0, Lj9;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lj9;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs b([I)V
    .registers 6

    new-instance v0, Lku1;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lku1;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs c([I)V
    .registers 6

    new-instance v0, Lic2;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lic2;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs d([I)V
    .registers 6

    new-instance v0, Ldy3;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Ldy3;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs e([I)V
    .registers 6

    new-instance v0, Lb29;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lb29;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs f([I)V
    .registers 6

    new-instance v0, Lfcg;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lfcg;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs g([I)V
    .registers 6

    new-instance v0, Lhsi;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lhsi;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final h()V
    .registers 3

    new-instance v0, Lt8j;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs i([I)V
    .registers 10

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-static {p1}, Ls16;->n([I)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_e

    invoke-virtual {v2, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_e
    const/4 p1, 0x0

    new-array p1, p1, [Ln6h;

    new-instance v1, Lwzg;

    const/4 v0, 0x4

    const/4 v3, 0x0

    const-class v4, Lszj;

    invoke-direct {v1, v3, v4, v0}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/4 v3, 0x2

    const/16 v4, 0x1003

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v7}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final varargs j(Lc8j;[I)V
    .registers 7

    new-instance v0, Lm7k;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p2}, Loba;-><init>(II[I)V

    invoke-direct {v0, p1, v1}, Lm7k;-><init>(Lc8j;Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final k()V
    .registers 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APP_NOTIFICATION_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final l(Ljava/lang/Class;Landroid/os/Bundle;)V
    .registers 12

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    invoke-direct {v2, v1, p1, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p2

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
