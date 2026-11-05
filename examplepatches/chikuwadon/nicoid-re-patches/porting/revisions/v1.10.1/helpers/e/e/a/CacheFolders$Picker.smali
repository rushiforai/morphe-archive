.class public final Le/e/a/CacheFolders$Picker;
.super Landroid/app/Fragment;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheFolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Picker"
.end annotation


# instance fields
.field pending:Landroid/content/Intent;

.field picking:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 149
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 12

    .line 157
    const-string v0, "cache_tree_uri"

    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v1, 0x29

    if-eq p1, v1, :cond_a

    return-void

    :cond_a
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    invoke-virtual {p0}, Le/e/a/CacheFolders$Picker;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_13b

    const/4 v3, -0x1

    if-ne p2, v3, :cond_13b

    if-eqz p3, :cond_13b

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_21

    goto/16 :goto_13b

    .line 158
    :cond_21
    invoke-static {v1}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    .line 159
    const/4 p2, 0x1

    :try_start_25
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p3}, Landroid/content/Intent;->getFlags()I

    move-result p3

    const/4 v4, 0x3

    and-int/2addr p3, v4

    .line 160
    if-ne p3, v4, :cond_10d

    .line 161
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3, p3}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    .line 162
    invoke-static {v3}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p3

    invoke-static {v3, p3}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    .line 163
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "application/octet-stream"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, ".nicoid-test-"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, p3, v5, v6}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_5d} :catch_115

    .line 164
    const-string v4, "Folder is not writable"

    if-eqz p3, :cond_107

    :try_start_61
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, p3}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result p3

    if-eqz p3, :cond_101

    .line 165
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object p3

    const-string v4, ""

    invoke-interface {p3, v0, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v0, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "cache_tree_"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Le/e/a/CacheFolders;->access$1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-eqz v0, :cond_f9

    .line 166
    instance-of v0, v1, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_b4

    move-object v0, v1

    check-cast v0, Landroid/preference/PreferenceActivity;

    invoke-static {v0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V

    .line 167
    :cond_b4
    iget-object v0, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    iput-object v2, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    # invokes: Le/e/a/CacheFolders;->pageRequest(Landroid/content/Intent;)Z
    invoke-static {v0}, Le/e/a/CacheFolders;->access$2(Landroid/content/Intent;)Z

    move-result v4

    if-eqz v4, :cond_df

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_cd

    const-string p1, "nicoid_cache_copy_from"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_cd
    # invokes: Le/e/a/CacheFolders;->replaceHost(Landroid/content/Intent;)Z
    invoke-static {v0}, Le/e/a/CacheFolders;->access$0(Landroid/content/Intent;)Z

    move-result p1

    const-string p3, "nicoid_cache_replace_picker_host"

    invoke-virtual {v0, p3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    if-eqz p1, :cond_13a

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_13a

    :cond_df
    if-eqz v0, :cond_eb

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_e8

    const/4 p1, 0x1

    :cond_e8
    # invokes: Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    invoke-static {v1, v0, p1}, Le/e/a/CacheFolders;->access$3(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    :cond_eb
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13a

    invoke-static {v1, p3}, Le/e/a/CacheFolders;->offerCopy(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_139

    .line 165
    :cond_f9
    new-instance p1, Ljava/io/IOException;

    const-string p3, "Cannot save folder grant"

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 164
    :cond_101
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_106
    throw p1

    :cond_107
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_106

    .line 160
    :cond_10d
    new-instance p1, Ljava/io/IOException;

    const-string p3, "Read/write grant required"

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_115
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_115} :catch_115

    .line 168
    :catch_115
    move-exception p1

    const-string p1, "\u4fdd\u5b58\u5148\u3092\u4f7f\u7528\u3067\u304d\u307e\u305b\u3093\u3002\u5225\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iget-object p1, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    # invokes: Le/e/a/CacheFolders;->pageRequest(Landroid/content/Intent;)Z
    invoke-static {p1}, Le/e/a/CacheFolders;->access$2(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_139

    iget-object p1, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    # invokes: Le/e/a/CacheFolders;->replaceHost(Landroid/content/Intent;)Z
    invoke-static {p1}, Le/e/a/CacheFolders;->access$0(Landroid/content/Intent;)Z

    move-result p1

    iput-object v2, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    if-eqz p1, :cond_139

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_13a

    :cond_139
    :goto_139
    nop

    .line 169
    :cond_13a
    :goto_13a
    return-void

    .line 157
    :cond_13b
    :goto_13b
    iget-object p1, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    # invokes: Le/e/a/CacheFolders;->replaceHost(Landroid/content/Intent;)Z
    invoke-static {p1}, Le/e/a/CacheFolders;->access$0(Landroid/content/Intent;)Z

    move-result p1

    iput-object v2, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    if-eqz p1, :cond_14a

    if-eqz v1, :cond_14a

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    :cond_14a
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 151
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_17

    const-string v0, "pending"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    const-string v0, "picking"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    :cond_17
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 152
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "pending"

    iget-object v1, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "picking"

    iget-boolean v1, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method pick()V
    .registers 5

    .line 153
    iget-boolean v0, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 v2, 0xc3

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 154
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_25

    const-string v2, "content://com.android.externalstorage.documents/document/primary%3AMovies"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "android.provider.extra.INITIAL_URI"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 155
    :cond_25
    const/16 v2, 0x29

    :try_start_27
    invoke-virtual {p0, v1, v2}, Le/e/a/CacheFolders$Picker;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2a
    .catch Landroid/content/ActivityNotFoundException; {:try_start_27 .. :try_end_2a} :catch_2b

    goto :goto_40

    :catch_2b
    move-exception v1

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    invoke-virtual {p0}, Le/e/a/CacheFolders$Picker;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "\u30d5\u30a9\u30eb\u30c0\u30fc\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_40
    return-void
.end method
