.class public final Le/e/a/DownloadUi115$FolderPicker;
.super Landroid/app/Fragment;
.source "DownloadUi115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DownloadUi115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FolderPicker"
.end annotation


# instance fields
.field height:I

.field id:Ljava/lang/String;

.field picking:Z

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 9

    .line 15
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x73

    if-eq p1, v0, :cond_8

    return-void

    :cond_8
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    invoke-virtual {p0}, Le/e/a/DownloadUi115$FolderPicker;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_b3

    const/4 v1, -0x1

    if-ne p2, v1, :cond_b3

    if-eqz p3, :cond_b3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_1f

    goto/16 :goto_b3

    :cond_1f
    :try_start_1f
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p3}, Landroid/content/Intent;->getFlags()I

    move-result p3

    and-int/lit8 p3, p3, 0x3

    and-int/lit8 v1, p3, 0x2

    if-eqz v1, :cond_9a

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-static {p2}, Le/e/a/DownloadJobs115;->document(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "application/octet-stream"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ".nicoid-write-test-"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p3, v1, v2, v3}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    if-eqz p3, :cond_94

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, p3}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    invoke-static {p1}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v1, "mp4_tree_uri"

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p2

    if-eqz p2, :cond_8e

    instance-of p2, p1, Landroid/preference/PreferenceActivity;

    if-eqz p2, :cond_80

    move-object p2, p1

    check-cast p2, Landroid/preference/PreferenceActivity;

    invoke-static {p2}, Le/e/a/DownloadUi115;->settings(Landroid/preference/PreferenceActivity;)V

    :cond_80
    iget-object p2, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    if-eqz p2, :cond_ad

    iget-object p2, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    iget-object p3, p0, Le/e/a/DownloadUi115$FolderPicker;->title:Ljava/lang/String;

    iget v1, p0, Le/e/a/DownloadUi115$FolderPicker;->height:I

    invoke-static {p1, p2, p3, v1}, Le/e/a/DownloadUi115;->enqueue(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_ad

    :cond_8e
    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2}, Ljava/io/IOException;-><init>()V

    :goto_93
    throw p2

    :cond_94
    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2}, Ljava/io/IOException;-><init>()V

    goto :goto_93

    :cond_9a
    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2}, Ljava/io/IOException;-><init>()V
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_9f} :catch_a2
    .catchall {:try_start_1f .. :try_end_9f} :catchall_a0

    goto :goto_93

    :catchall_a0
    move-exception p1

    goto :goto_b0

    :catch_a2
    move-exception p2

    :try_start_a3
    const-string p2, "\u3053\u306e\u30d5\u30a9\u30eb\u30c0\u306b\u306f\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3002\u5225\u306e\u30d5\u30a9\u30eb\u30c0\u3092\u6307\u5b9a\u3057\u3066\u304f\u3060\u3055\u3044"

    const/4 p3, 0x1

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_ad
    .catchall {:try_start_a3 .. :try_end_ad} :catchall_a0

    :cond_ad
    :goto_ad
    iput-object v0, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    return-void

    :goto_b0
    iput-object v0, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    throw p1

    :cond_b3
    :goto_b3
    iput-object v0, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 15
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_25

    const-string v0, "id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    const-string v0, "title"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/DownloadUi115$FolderPicker;->title:Ljava/lang/String;

    const-string v0, "height"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Le/e/a/DownloadUi115$FolderPicker;->height:I

    const-string v0, "picking"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    :cond_25
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 15
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "id"

    iget-object v1, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "title"

    iget-object v1, p0, Le/e/a/DownloadUi115$FolderPicker;->title:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "height"

    iget v1, p0, Le/e/a/DownloadUi115$FolderPicker;->height:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "picking"

    iget-boolean v1, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method pick(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6

    .line 15
    iget-boolean v0, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Le/e/a/DownloadUi115$FolderPicker;->id:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/DownloadUi115$FolderPicker;->title:Ljava/lang/String;

    iput p3, p0, Le/e/a/DownloadUi115$FolderPicker;->height:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    new-instance p2, Landroid/content/Intent;

    const-string p3, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {p2, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 p3, 0xc3

    invoke-virtual {p2, p3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p0}, Le/e/a/DownloadUi115$FolderPicker;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-static {p3}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    const-string v0, "mp4_tree_uri"

    const-string v1, ""

    invoke-interface {p3, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_40

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_40

    const-string v0, "android.provider.extra.INITIAL_URI"

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_40
    const/16 p3, 0x73

    :try_start_42
    invoke-virtual {p0, p2, p3}, Le/e/a/DownloadUi115$FolderPicker;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_46

    goto :goto_57

    :catch_46
    move-exception p2

    const/4 p2, 0x0

    iput-boolean p2, p0, Le/e/a/DownloadUi115$FolderPicker;->picking:Z

    invoke-virtual {p0}, Le/e/a/DownloadUi115$FolderPicker;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const-string p3, "\u30d5\u30a9\u30eb\u30c0\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p2, p3, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_57
    return-void
.end method
