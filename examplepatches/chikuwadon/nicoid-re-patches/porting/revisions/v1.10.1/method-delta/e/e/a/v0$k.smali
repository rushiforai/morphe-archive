.class public final Le/e/a/v0$k;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    const-string p1, "search_Word"

    const-string p2, "\t"

    iget-object v0, p0, Le/e/a/v0$k;->a:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_24

    iget-object p1, p0, Le/e/a/v0$k;->b:Landroid/content/Context;

    const p2, 0x7f0f022b

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Le/e/a/v0$k;->b:Landroid/content/Context;

    .line 1
    invoke-static {p1, v2, p2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_24
    :try_start_24
    iget-object v1, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Type"

    iget-object v4, p0, Le/e/a/v0$k;->d:[I

    aget v4, v4, v2

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Sort"

    iget-object v4, p0, Le/e/a/v0$k;->d:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Time"

    iget-object v4, p0, Le/e/a/v0$k;->d:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    const-string v3, "search_Date"

    iget-object v4, p0, Le/e/a/v0$k;->d:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Le/e/a/v0$k;->e:Landroid/content/SharedPreferences;

    const-string v3, ""

    invoke-interface {v1, p1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_6e
    array-length v4, v1

    const/16 v5, 0xf

    if-ge v4, v5, :cond_74

    array-length v5, v1

    :cond_74
    if-ge v2, v5, :cond_95

    aget-object v4, v1, v2

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_92

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v1, v2

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_92
    add-int/lit8 v2, v2, 0x1

    goto :goto_6e

    :cond_95
    iget-object p2, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p2, p1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Le/e/a/v0$k;->c:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object p1, p0, Le/e/a/v0$k;->d:[I

    invoke-static {p1, v0}, Le/e/a/v0;->a([ILjava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Le/e/a/v0$k;->d:[I

    invoke-static {p1, v0}, Le/e/a/v0;->a([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.hls"

    const-string v0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Le/e/a/v0$k;->b:Landroid/content/Context;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_c1} :catch_c2

    goto :goto_c6

    :catch_c2
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_c6
    return-void
.end method
