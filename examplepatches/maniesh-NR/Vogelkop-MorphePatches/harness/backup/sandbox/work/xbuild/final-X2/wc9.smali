.class public final synthetic Lwc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwc9;->a:B

    iput-object p1, p0, Lwc9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 5

    iget-byte v0, p0, Lwc9;->a:B

    iget-object p0, p0, Lwc9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_72

    check-cast p0, Lm9c;

    const-string p1, "ad_set"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4a

    iget-object p0, p0, Lm9c;->d:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :cond_17
    :goto_17
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4a

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Laac;

    iget-object p2, p1, Laac;->a:Lbac;

    iget-object v0, p2, Lbac;->b:Lm9c;

    invoke-virtual {v0}, Lm9c;->a()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_17

    iget-object v1, v0, Lm9c;->d:Li7f;

    invoke-virtual {v1, p1}, Li7f;->c(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_46

    iget p1, v1, Li7f;->c:I

    if-nez p1, :cond_46

    iget-object p1, v0, Lm9c;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object v0, v0, Lm9c;->e:Lwc9;

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_46
    invoke-virtual {p2}, Lbac;->c()V

    goto :goto_17

    :cond_4a
    return-void

    :pswitch_4b
    check-cast p0, Lxc9;

    const-string v0, "unread_message"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_71

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    iget-object p0, p0, Lxc9;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_5f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_71

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ls1f;

    iget-object p1, p1, Ls1f;->a:Lr1f;

    invoke-virtual {p1}, Lp1f;->b()V

    goto :goto_5f

    :cond_71
    return-void

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_4b
    .end packed-switch
.end method
