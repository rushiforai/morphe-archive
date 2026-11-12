.class public final synthetic Lowk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:Lqwk;


# direct methods
.method public synthetic constructor <init>(Lqwk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lowk;->a:Lqwk;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 3

    iget-object p0, p0, Lowk;->a:Lqwk;

    invoke-virtual {p0}, Lu5k;->A()V

    iget-object p0, p0, Lqwk;->j:Lswk;

    const/4 v0, 0x2

    if-ne p1, v0, :cond_27

    iget-object p1, p0, Lswk;->a:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->c()Z

    move-result p1

    if-eqz p1, :cond_27

    invoke-virtual {p0}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "passphrase.dismiss.time"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "passphrase.dismiss.count"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_27
    return-void
.end method
