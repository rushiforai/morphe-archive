.class public final Le/e/a/v0$i;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/EditText;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Landroid/content/SharedPreferences$Editor;

.field public final synthetic d:[I

.field public final synthetic e:Landroid/content/SharedPreferences;


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 10

    const-string p1, "search_Word"

    const-string v0, "\t"

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 v1, 0x0

    if-nez p3, :cond_cf

    const/16 p3, 0x42

    if-ne p2, p3, :cond_cf

    iget-object p2, p0, Le/e/a/v0$i;->a:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-nez p3, :cond_2e

    iget-object p1, p0, Le/e/a/v0$i;->b:Landroid/content/Context;

    const p2, 0x7f0f022b

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Le/e/a/v0$i;->b:Landroid/content/Context;

    .line 1
    invoke-static {p1, v1, p2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return v1

    :cond_2e
    const/4 p3, 0x1

    .line 2
    :try_start_2f
    iget-object v2, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Type"

    iget-object v4, p0, Le/e/a/v0$i;->d:[I

    aget v4, v4, v1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v2, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Sort"

    iget-object v4, p0, Le/e/a/v0$i;->d:[I

    aget v4, v4, p3

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v2, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Time"

    iget-object v4, p0, Le/e/a/v0$i;->d:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v2, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Date"

    iget-object v4, p0, Le/e/a/v0$i;->d:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v2, p0, Le/e/a/v0$i;->e:Landroid/content/SharedPreferences;

    const-string v3, ""

    invoke-interface {v2, p1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x32

    :goto_7a
    array-length v5, v2

    if-ge v5, v4, :cond_7f

    array-length v5, v2

    goto :goto_81

    :cond_7f
    const/16 v5, 0x32

    :goto_81
    if-ge v1, v5, :cond_a2

    aget-object v5, v2, v1

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9f

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v2, v1

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_9f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7a

    :cond_a2
    iget-object v0, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Le/e/a/v0$i;->c:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object p1, p0, Le/e/a/v0$i;->d:[I

    invoke-static {p1, p2}, Le/e/a/v0;->a([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.hls"

    const-string v0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/v0$i;->b:Landroid/content/Context;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_c9} :catch_ca

    goto :goto_ce

    :catch_ca
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_ce
    return p3

    :cond_cf
    return v1
.end method
