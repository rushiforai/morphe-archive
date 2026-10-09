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

    .line 126
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 16
    .param p1, "request"    # I
    .param p2, "result"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 134
    const-string v0, "cache_tree_uri"

    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v1, 0x29

    if-eq p1, v1, :cond_a

    return-void

    :cond_a
    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    invoke-virtual {p0}, Le/e/a/CacheFolders$Picker;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .local v2, "a":Landroid/app/Activity;
    const/4 v3, 0x0

    if-eqz v2, :cond_105

    const/4 v4, -0x1

    if-ne p2, v4, :cond_105

    if-eqz p3, :cond_105

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    if-nez v4, :cond_21

    goto/16 :goto_105

    .line 135
    :cond_21
    invoke-static {v2}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    .line 136
    const/4 v4, 0x1

    :try_start_25
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    .local v5, "tree":Landroid/net/Uri;
    invoke-virtual {p3}, Landroid/content/Intent;->getFlags()I

    move-result v6

    const/4 v7, 0x3

    and-int/2addr v6, v7

    .line 137
    .local v6, "flags":I
    if-ne v6, v7, :cond_ee

    .line 138
    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    .line 139
    invoke-static {v5}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 140
    .local v7, "root":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "application/octet-stream"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ".nicoid-test-"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v7, v9, v10}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_61} :catch_f6

    .line 141
    .local v8, "probe":Landroid/net/Uri;
    const-string v9, "Folder is not writable"

    if-eqz v8, :cond_e8

    :try_start_65
    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-static {v10, v8}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_e2

    .line 142
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, ""

    invoke-interface {v9, v0, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .local v9, "before":Ljava/lang/String;
    invoke-static {}, Le/e/a/CacheFolders;->prefs()Landroid/content/SharedPreferences;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v0, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "cache_tree_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    # invokes: Le/e/a/CacheFolders;->key(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v11}, Le/e/a/CacheFolders;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-eqz v0, :cond_da

    .line 143
    instance-of v0, v2, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_bc

    move-object v0, v2

    check-cast v0, Landroid/preference/PreferenceActivity;

    invoke-static {v0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V

    .line 144
    :cond_bc
    iget-object v0, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    .local v0, "download":Landroid/content/Intent;
    iput-object v3, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    if-eqz v0, :cond_cc

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1a

    if-lt v3, v10, :cond_c9

    const/4 v1, 0x1

    :cond_c9
    # invokes: Le/e/a/CacheFolders;->service(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;
    invoke-static {v2, v0, v1}, Le/e/a/CacheFolders;->access$200(Landroid/content/Context;Landroid/content/Intent;Z)Landroid/content/ComponentName;

    .line 145
    :cond_cc
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d9

    invoke-static {v2, v9}, Le/e/a/CacheFolders;->offerCopy(Landroid/app/Activity;Ljava/lang/String;)V

    .line 146
    .end local v0    # "download":Landroid/content/Intent;
    .end local v5    # "tree":Landroid/net/Uri;
    .end local v6    # "flags":I
    .end local v7    # "root":Landroid/net/Uri;
    .end local v8    # "probe":Landroid/net/Uri;
    .end local v9    # "before":Ljava/lang/String;
    :cond_d9
    goto :goto_104

    .line 142
    .restart local v5    # "tree":Landroid/net/Uri;
    .restart local v6    # "flags":I
    .restart local v7    # "root":Landroid/net/Uri;
    .restart local v8    # "probe":Landroid/net/Uri;
    .restart local v9    # "before":Ljava/lang/String;
    :cond_da
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot save folder grant"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "a":Landroid/app/Activity;
    .end local p1    # "request":I
    .end local p2    # "result":I
    .end local p3    # "data":Landroid/content/Intent;
    throw v0

    .line 141
    .end local v9    # "before":Ljava/lang/String;
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local p1    # "request":I
    .restart local p2    # "result":I
    .restart local p3    # "data":Landroid/content/Intent;
    :cond_e2
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_ed

    :cond_e8
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "a":Landroid/app/Activity;
    .end local p1    # "request":I
    .end local p2    # "result":I
    .end local p3    # "data":Landroid/content/Intent;
    :goto_ed
    throw v0

    .line 137
    .end local v7    # "root":Landroid/net/Uri;
    .end local v8    # "probe":Landroid/net/Uri;
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local p1    # "request":I
    .restart local p2    # "result":I
    .restart local p3    # "data":Landroid/content/Intent;
    :cond_ee
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Read/write grant required"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v2    # "a":Landroid/app/Activity;
    .end local p1    # "request":I
    .end local p2    # "result":I
    .end local p3    # "data":Landroid/content/Intent;
    throw v0
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_f6} :catch_f6

    .line 146
    .end local v5    # "tree":Landroid/net/Uri;
    .end local v6    # "flags":I
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local p1    # "request":I
    .restart local p2    # "result":I
    .restart local p3    # "data":Landroid/content/Intent;
    :catch_f6
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "\u4fdd\u5b58\u5148\u3092\u4f7f\u7528\u3067\u304d\u307e\u305b\u3093\u3002\u5225\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 147
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_104
    return-void

    .line 134
    :cond_105
    :goto_105
    iput-object v3, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "state"    # Landroid/os/Bundle;

    .line 128
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_17

    const-string v0, "pending"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Le/e/a/CacheFolders$Picker;->pending:Landroid/content/Intent;

    const-string v0, "picking"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    :cond_17
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Bundle;

    .line 129
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
    .registers 6

    .line 130
    iget-boolean v0, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v1, "i":Landroid/content/Intent;
    const/16 v2, 0xc3

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 131
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_25

    const-string v2, "content://com.android.externalstorage.documents/document/primary%3AMovies"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "android.provider.extra.INITIAL_URI"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 132
    :cond_25
    const/16 v2, 0x29

    :try_start_27
    invoke-virtual {p0, v1, v2}, Le/e/a/CacheFolders$Picker;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2a
    .catch Landroid/content/ActivityNotFoundException; {:try_start_27 .. :try_end_2a} :catch_2b

    goto :goto_40

    :catch_2b
    move-exception v2

    .local v2, "e":Landroid/content/ActivityNotFoundException;
    const/4 v3, 0x0

    iput-boolean v3, p0, Le/e/a/CacheFolders$Picker;->picking:Z

    invoke-virtual {p0}, Le/e/a/CacheFolders$Picker;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .end local v2    # "e":Landroid/content/ActivityNotFoundException;
    :goto_40
    return-void
.end method
