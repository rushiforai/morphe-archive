.class public final synthetic Lig7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lue7;


# instance fields
.field public final synthetic a:Ljg7;


# direct methods
.method public synthetic constructor <init>(Ljg7;)V
    .registers 2

    iput-object p1, p0, Lig7;->a:Ljg7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lig7;->a:Ljg7;

    invoke-virtual {p0, p1, p2}, Ljg7;->f(Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method

.method public final b(Lvvj;)V
    .registers 5

    iget-object p0, p0, Lig7;->a:Ljg7;

    iget-object p0, p0, Ljg7;->a:Lwg7;

    iput-object p1, p0, Lwg7;->M:Lvvj;

    iget-object v0, p0, Lwg7;->x:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "downloads_sort_order"

    iget-byte v2, p1, Lvvj;->a:B

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lwg7;->z:Lze7;

    if-eqz p0, :cond_2b

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0, p1}, Lze7;->J(Ljava/util/List;Lvvj;)V

    :cond_2b
    return-void
.end method
