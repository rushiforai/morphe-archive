.class public final Lzh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Ljava/util/HashSet;

.field public final b:Li7f;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lzh7;->a:Ljava/util/HashSet;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lzh7;->b:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La1a;

    iget-object p0, p0, Lzh7;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La1a;

    iget-object p0, p0, Lzh7;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lyh7;Z)V
    .registers 6

    iget-object v0, p0, Lzh7;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, p2, :cond_46

    if-eqz p2, :cond_e

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_e
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :goto_11
    new-instance v0, Lg7f;

    iget-object p0, p0, Lzh7;->b:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :cond_18
    :goto_18
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_46

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La1a;

    iget-object p0, p0, La1a;->a:Lb1a;

    sget-object v1, Lyh7;->b:Lyh7;

    if-eq p1, v1, :cond_18

    if-nez p2, :cond_41

    iget-object v1, p0, Lb1a;->b:Lea6;

    iget-object v1, v1, Lea6;->c:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "other_close_time"

    invoke-static {v1, v2}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :cond_41
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lb1a;->X(Z)V

    goto :goto_18

    :cond_46
    return-void
.end method
