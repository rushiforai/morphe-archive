.class public final Le/e/a/SettingsBackup$Picker;
.super Landroid/app/Fragment;
.source "SettingsBackup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsBackup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Picker"
.end annotation


# instance fields
.field busy:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(ILandroid/content/SharedPreferences;Landroid/app/Activity;Landroid/net/Uri;)V
    .registers 11

    .line 16
    const/16 v0, 0x3d

    const-string v1, "UTF-8"

    const/4 v2, 0x0

    if-ne p0, v0, :cond_51

    :try_start_7
    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Le/e/a/SettingsBackup;->encode(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_18} :catch_b7

    :try_start_18
    invoke-virtual {p2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wt"

    invoke-virtual {v0, p3, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p3
    :try_end_22
    .catchall {:try_start_18 .. :try_end_22} :catchall_47

    if-eqz p3, :cond_3b

    :try_start_24
    invoke-virtual {p3, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_38

    if-eqz p3, :cond_2c

    :try_start_29
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_2c
    .catchall {:try_start_29 .. :try_end_2c} :catchall_47

    :cond_2c
    :try_start_2c
    sget-object p1, Le/e/a/SettingsBackup;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda3;

    invoke-direct {p3, p2}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_36} :catch_b7

    goto/16 :goto_c2

    :catchall_38
    move-exception p1

    move-object v2, p1

    goto :goto_41

    :cond_3b
    :try_start_3b
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
    :try_end_41
    .catchall {:try_start_3b .. :try_end_41} :catchall_38

    :goto_41
    if-eqz p3, :cond_46

    :try_start_43
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V

    :cond_46
    throw v2
    :try_end_47
    .catchall {:try_start_43 .. :try_end_47} :catchall_47

    :catchall_47
    move-exception p1

    if-eqz v2, :cond_50

    if-eq v2, p1, :cond_4f

    :try_start_4c
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4f
    move-object p1, v2

    :cond_50
    :goto_50
    throw p1

    :cond_51
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_56} :catch_b7

    :try_start_56
    invoke-virtual {p2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p3
    :try_end_5e
    .catchall {:try_start_56 .. :try_end_5e} :catchall_ad

    if-eqz p3, :cond_a1

    const/16 v3, 0x2000

    :try_start_62
    new-array v3, v3, [B

    :goto_64
    invoke-virtual {p3, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4
    :try_end_68
    .catchall {:try_start_62 .. :try_end_68} :catchall_9e

    const/4 v5, -0x1

    if-ne v4, v5, :cond_88

    if-eqz p3, :cond_70

    :try_start_6d
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_ad

    :cond_70
    :try_start_70
    new-instance p3, Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p3}, Le/e/a/SettingsBackup;->decode(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p3

    sget-object v0, Le/e/a/SettingsBackup;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;

    invoke-direct {v1, p2, p3, p1}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/util/Map;Landroid/content/SharedPreferences;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_87} :catch_b7

    goto :goto_c2

    :cond_88
    :try_start_88
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    const/high16 v6, 0x200000

    if-gt v5, v6, :cond_96

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_64

    :cond_96
    new-instance p1, Ljava/io/IOException;

    const-string v0, "File too large"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_9d
    throw p1

    :catchall_9e
    move-exception p1

    move-object v2, p1

    goto :goto_a7

    :cond_a1
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V
    :try_end_a6
    .catchall {:try_start_88 .. :try_end_a6} :catchall_9e

    goto :goto_9d

    :goto_a7
    if-eqz p3, :cond_ac

    :try_start_a9
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V

    :cond_ac
    throw v2
    :try_end_ad
    .catchall {:try_start_a9 .. :try_end_ad} :catchall_ad

    :catchall_ad
    move-exception p1

    if-eqz v2, :cond_50

    if-eq v2, p1, :cond_b5

    :try_start_b2
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_b5} :catch_b7

    :cond_b5
    move-object p1, v2

    goto :goto_50

    :catch_b7
    move-exception p1

    sget-object p1, Le/e/a/SettingsBackup;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda5;

    invoke-direct {p3, p2, p0}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;I)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_c2
    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;)V
    .registers 4

    .line 16
    const-string v0, "Settings exported"

    const-string v1, "\u5df2\u532f\u51fa\u8a2d\u5b9a"

    const-string v2, "\u8a2d\u5b9a\u3092\u30a8\u30af\u30b9\u30dd\u30fc\u30c8\u3057\u307e\u3057\u305f"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/util/Map;Landroid/content/SharedPreferences;)V
    .registers 8

    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Import settings"

    const-string v2, "\u532f\u5165\u8a2d\u5b9a"

    const-string v3, "\u8a2d\u5b9a\u3092\u30a4\u30f3\u30dd\u30fc\u30c8"

    invoke-static {p0, v3, v1, v2}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Restore settings, then restart the app."

    const-string v3, "\u9084\u539f\u8a2d\u5b9a\u5f8c\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u3002"

    const-string v4, "\u8a2d\u5b9a\u3092\u5fa9\u5143\u3057\u307e\u3059\u3002\u53cd\u6620\u5f8c\u306b\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p0, v4, v2, v3}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " settings"

    const-string v3, " \u500b\u9805\u76ee"

    const-string v4, "\u9805\u76ee"

    invoke-static {p0, v4, v2, v3}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Import"

    const-string v2, "\u532f\u5165"

    const-string v3, "\u30a4\u30f3\u30dd\u30fc\u30c8"

    invoke-static {p0, v3, v1, v2}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda1;

    invoke-direct {v2, p2, p1, p0}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda1;-><init>(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Cancel"

    const-string v0, "\u53d6\u6d88"

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v1, p2, v0}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 16
    sget-object p3, Le/e/a/SettingsBackup;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p4, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;

    invoke-direct {p4, p0, p1, p2}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;-><init>(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;)V

    invoke-interface {p3, p4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;)V
    .registers 4

    .line 16
    invoke-static {p0, p1}, Le/e/a/SettingsBackup;->apply(Landroid/content/SharedPreferences;Ljava/util/Map;)Z

    move-result p0

    sget-object p1, Le/e/a/SettingsBackup;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2, p0}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;Z)V
    .registers 5

    .line 16
    if-eqz p1, :cond_5

    const-string v0, "\u8a2d\u5b9a\u3092\u30a4\u30f3\u30dd\u30fc\u30c8\u3057\u307e\u3057\u305f\u3002\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u304f\u3060\u3055\u3044"

    goto :goto_7

    :cond_5
    const-string v0, "\u8a2d\u5b9a\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    :goto_7
    if-eqz p1, :cond_c

    const-string v1, "Settings imported. Restart the app."

    goto :goto_e

    :cond_c
    const-string v1, "Unable to save settings"

    :goto_e
    if-eqz p1, :cond_13

    const-string v2, "\u5df2\u532f\u5165\u8a2d\u5b9a\uff0c\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f"

    goto :goto_15

    :cond_13
    const-string v2, "\u7121\u6cd5\u5132\u5b58\u8a2d\u5b9a"

    :goto_15
    invoke-static {p0, v0, v1, v2}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    if-eqz p1, :cond_26

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    :cond_26
    return-void
.end method

.method static synthetic lambda$6(Landroid/app/Activity;I)V
    .registers 5

    .line 16
    const/16 v0, 0x3d

    if-ne p1, v0, :cond_7

    const-string v1, "\u30a8\u30af\u30b9\u30dd\u30fc\u30c8\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    goto :goto_9

    :cond_7
    const-string v1, "\u8a2d\u5b9a\u30d5\u30a1\u30a4\u30eb\u3092\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093\u3067\u3057\u305f"

    :goto_9
    if-ne p1, v0, :cond_e

    const-string v2, "Unable to export settings"

    goto :goto_10

    :cond_e
    const-string v2, "Unable to read settings file"

    :goto_10
    if-ne p1, v0, :cond_15

    const-string p1, "\u532f\u51fa\u8a2d\u5b9a\u5931\u6557"

    goto :goto_17

    :cond_15
    const-string p1, "\u7121\u6cd5\u8b80\u53d6\u8a2d\u5b9a\u6a94"

    :goto_17
    invoke-static {p0, v1, v2, p1}, Le/e/a/SettingsBackup;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 7

    .line 16
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/SettingsBackup$Picker;->busy:Z

    invoke-virtual {p0}, Le/e/a/SettingsBackup$Picker;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2d

    const/4 v1, -0x1

    if-ne p2, v1, :cond_2d

    if-eqz p3, :cond_2d

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_18

    goto :goto_2d

    :cond_18
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-static {p3}, Le/e/a/SettingsBackup;->known(Landroid/content/SharedPreferences;)V

    sget-object v1, Le/e/a/SettingsBackup;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1, p3, v0, p2}, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;-><init>(ILandroid/content/SharedPreferences;Landroid/app/Activity;Landroid/net/Uri;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_2d
    :goto_2d
    return-void
.end method

.method pick(Z)V
    .registers 7

    .line 16
    iget-boolean v0, p0, Le/e/a/SettingsBackup$Picker;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/content/Intent;

    if-eqz p1, :cond_c

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    goto :goto_e

    :cond_c
    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    :goto_e
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz p1, :cond_1c

    const-string v1, "application/json"

    goto :goto_1e

    :cond_1c
    const-string v1, "*/*"

    :goto_1e
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz p1, :cond_50

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "nicoid-re-settings-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMdd-HHmmss"

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.TITLE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_50
    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/SettingsBackup$Picker;->busy:Z

    if-eqz p1, :cond_58

    const/16 p1, 0x3d

    goto :goto_5a

    :cond_58
    const/16 p1, 0x3e

    :goto_5a
    :try_start_5a
    invoke-virtual {p0, v0, p1}, Le/e/a/SettingsBackup$Picker;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_5d
    .catch Landroid/content/ActivityNotFoundException; {:try_start_5a .. :try_end_5d} :catch_5e

    return-void

    :catch_5e
    move-exception p1

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/SettingsBackup$Picker;->busy:Z

    throw p1
.end method
