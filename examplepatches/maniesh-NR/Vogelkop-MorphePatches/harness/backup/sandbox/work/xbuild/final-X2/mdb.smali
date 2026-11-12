.class public abstract Lmdb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;

.field public static final b:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ljava/util/HashSet;

    const-string v6, "content"

    const-string v7, "momi"

    const-string v1, "http"

    const-string v2, "https"

    const-string v3, "about"

    const-string v4, "ofa"

    const-string v5, "file"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lmdb;->a:Ljava/util/HashSet;

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lmdb;->b:Ljava/util/Random;

    return-void
.end method

.method public static a(Landroid/content/Context;)Landroid/content/ComponentName;
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    return-object p0

    :cond_19
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "package_name"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "context_class"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v0, :cond_3f

    const-string v2, "intent"

    invoke-virtual {v0}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3f
    new-instance v0, Lyo8;

    const-string v2, "Unusable launch intent"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lyo8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.opera.Opera"

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static b(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const/high16 v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {p0}, Lmdb;->a(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    return-object v0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v1, v0, :cond_41

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-nez v2, :cond_3e

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_3e

    const/16 v2, 0x2b

    if-eq v0, v2, :cond_3e

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_3e

    const-string v0, "[^a-z0-9.+-]"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_41
    return-object p0
.end method

.method public static d(Ljava/lang/String;)Z
    .registers 4

    if-eqz p0, :cond_1e

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "javascript"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "jar"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public static e(Ljava/lang/String;)Z
    .registers 2

    invoke-static {p0}, Lwqm;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-static {p0}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lbtb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lmdb;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static f(Landroid/content/Intent;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_23

    const/4 v1, 0x0

    :try_start_7
    invoke-virtual {v0}, Landroid/os/BaseBundle;->size()I
    :try_end_a
    .catch Landroid/os/BadParcelableException; {:try_start_7 .. :try_end_a} :catch_1c
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_a} :catch_b

    return-void

    :catch_b
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/ClassNotFoundException;

    if-eqz v2, :cond_1b

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Landroid/content/Intent;->replaceExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    return-void

    :cond_1b
    throw v0

    :catch_1c
    move-exception v0

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Landroid/content/Intent;->replaceExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_23
    return-void
.end method

.method public static g(Lx5f;ZZLandroid/content/Intent;)V
    .registers 9

    if-eqz p2, :cond_5

    sget-object p2, Lje0;->b:Lje0;

    goto :goto_7

    :cond_5
    sget-object p2, Lje0;->c:Lje0;

    :goto_7
    sget-object v0, Lle0;->c:Lle0;

    const/4 v1, 0x0

    if-eqz p3, :cond_246

    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, -0x1

    sparse-switch v3, :sswitch_data_24a

    goto/16 :goto_1c0

    :sswitch_23
    const-string v3, "android.intent.action.WEB_SEARCH"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x23

    goto/16 :goto_1c0

    :sswitch_2f
    const-string v3, "android.nfc.action.NDEF_DISCOVERED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x22

    goto/16 :goto_1c0

    :sswitch_3b
    const-string v3, "android.intent.action.INSERT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x21

    goto/16 :goto_1c0

    :sswitch_47
    const-string v3, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x20

    goto/16 :goto_1c0

    :sswitch_53
    const-string v3, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_PIP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1f

    goto/16 :goto_1c0

    :sswitch_5f
    const-string v3, "com.opera.android.action.SHOW_WALLET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1e

    goto/16 :goto_1c0

    :sswitch_6b
    const-string v3, "com.opera.android.SERVICE_TAB_LAUNCH"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1d

    goto/16 :goto_1c0

    :sswitch_77
    const-string v3, "com.opera.android.action.VPN_PRO_WIDGET_OPEN_OFA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1c

    goto/16 :goto_1c0

    :sswitch_83
    const-string v3, "com.opera.android.action.AI_ASSISTANT_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1b

    goto/16 :goto_1c0

    :sswitch_8f
    const-string v3, "com.opera.android.action.SCAN_QR_CODE_FROM_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x1a

    goto/16 :goto_1c0

    :sswitch_9b
    const-string v3, "com.opera.android.action.SHOW_DOWNLOADS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x19

    goto/16 :goto_1c0

    :sswitch_a7
    const-string v3, "com.opera.android.settings.SITE_SETTING"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x18

    goto/16 :goto_1c0

    :sswitch_b3
    const-string v3, "com.opera.android.action.SCAN_QR_CODE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x17

    goto/16 :goto_1c0

    :sswitch_bf
    const-string v3, "com.opera.android.action.SHOW_NEWS_ARTICLE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x16

    goto/16 :goto_1c0

    :sswitch_cb
    const-string v3, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_NOTIFICATION"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x15

    goto/16 :goto_1c0

    :sswitch_d7
    const-string v3, "android.service.quicksettings.action.QS_TILE_PREFERENCES"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x14

    goto/16 :goto_1c0

    :sswitch_e3
    const-string v3, "com.opera.android.action.SEARCH"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x13

    goto/16 :goto_1c0

    :sswitch_ef
    const-string v3, "com.opera.android.action.SEARCH_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x12

    goto/16 :goto_1c0

    :sswitch_fb
    const-string v3, "com.opera.android.action.SHOW_MANAGE_SPACE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x11

    goto/16 :goto_1c0

    :sswitch_107
    const-string v3, "com.opera.android.action.NEW_PRIVATE_TAB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x10

    goto/16 :goto_1c0

    :sswitch_113
    const-string v3, "com.opera.android.action.VPN_PRO_NOTIFICATION_OPEN_OFA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xf

    goto/16 :goto_1c0

    :sswitch_11f
    const-string v3, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xe

    goto/16 :goto_1c0

    :sswitch_12b
    const-string v3, "com.opera.android.action.UNINSTALL_SHORTCUT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xd

    goto/16 :goto_1c0

    :sswitch_137
    const-string v3, "com.opera.android.action.SCAN_QR_CODE_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xc

    goto/16 :goto_1c0

    :sswitch_143
    const-string v3, "com.opera.android.action.JUMP_MINIGAME_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xb

    goto/16 :goto_1c0

    :sswitch_14f
    const-string v3, "com.opera.android.action.VOICE_SEARCH_FROM_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0xa

    goto/16 :goto_1c0

    :sswitch_15b
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x9

    goto :goto_1c0

    :sswitch_166
    const-string v3, "android.intent.action.SEND"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/16 v4, 0x8

    goto :goto_1c0

    :sswitch_171
    const-string v3, "android.intent.action.MAIN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x7

    goto :goto_1c0

    :sswitch_17b
    const-string v3, "com.opera.android.action.SEARCH_FROM_WIDGET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x6

    goto :goto_1c0

    :sswitch_185
    const-string v3, "com.opera.android.action.SHOW_NEWSFEED_ARTICLE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x5

    goto :goto_1c0

    :sswitch_18f
    const-string v3, "com.opera.android.action.SHOW_NEWS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x4

    goto :goto_1c0

    :sswitch_199
    const-string v3, "com.opera.android.action.NEW_TAB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x3

    goto :goto_1c0

    :sswitch_1a3
    const-string v3, "com.opera.android.flow.ACTION_NOTIFICATION"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x2

    goto :goto_1c0

    :sswitch_1ad
    const-string v3, "com.opera.android.action.AI_WIDGET_KEYBOARD"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x1

    goto :goto_1c0

    :sswitch_1b7
    const-string v3, "com.opera.android.action.AI_WIDGET_VOICE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    const/4 v4, 0x0

    :cond_1c0
    :goto_1c0
    sget-object v2, Lje0;->e:Lje0;

    packed-switch v4, :pswitch_data_2dc

    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lle0;->b:Lle0;

    goto/16 :goto_246

    :pswitch_1cd
    sget-object v0, Lle0;->f:Lle0;

    goto/16 :goto_246

    :pswitch_1d1
    sget-object v0, Lle0;->e:Lle0;

    goto/16 :goto_246

    :pswitch_1d5
    sget-object v0, Lle0;->i:Lle0;

    goto/16 :goto_246

    :pswitch_1d9
    const-string v0, "com.opera.android.extra.ORIGINAL_COMPONENT_CLASS_NAME"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "com.opera.android.SearchInOpera"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1eb

    sget-object v0, Lle0;->G:Lle0;

    goto/16 :goto_246

    :cond_1eb
    sget-object v0, Lle0;->g:Lle0;

    goto/16 :goto_246

    :pswitch_1ef
    sget-object v0, Lle0;->m:Lle0;

    :goto_1f1
    move-object p2, v2

    goto/16 :goto_246

    :pswitch_1f4
    sget-object v0, Lle0;->j:Lle0;

    goto/16 :goto_246

    :pswitch_1f8
    sget-object v0, Lle0;->C:Lle0;

    goto :goto_1f1

    :pswitch_1fb
    sget-object v0, Lle0;->H:Lle0;

    goto :goto_1f1

    :pswitch_1fe
    sget-object v0, Lle0;->z:Lle0;

    goto :goto_1f1

    :pswitch_201
    sget-object v0, Lle0;->l:Lle0;

    goto :goto_1f1

    :pswitch_204
    sget-object v0, Lle0;->k:Lle0;

    goto :goto_1f1

    :pswitch_207
    sget-object v0, Lle0;->r:Lle0;

    goto :goto_1f1

    :pswitch_20a
    sget-object v0, Lle0;->x:Lle0;

    goto :goto_1f1

    :pswitch_20d
    sget-object v0, Lle0;->D:Lle0;

    goto :goto_1f1

    :pswitch_210
    sget-object v0, Lle0;->o:Lle0;

    goto :goto_1f1

    :pswitch_213
    sget-object v0, Lle0;->I:Lle0;

    goto :goto_1f1

    :pswitch_216
    sget-object v0, Lle0;->v:Lle0;

    goto :goto_1f1

    :pswitch_219
    sget-object v0, Lle0;->q:Lle0;

    goto :goto_246

    :pswitch_21c
    sget-object v0, Lle0;->B:Lle0;

    goto :goto_1f1

    :pswitch_21f
    sget-object v0, Lle0;->n:Lle0;

    goto :goto_246

    :pswitch_222
    sget-object v0, Lle0;->M:Lle0;

    goto :goto_1f1

    :pswitch_225
    sget-object v0, Lle0;->J:Lle0;

    goto :goto_1f1

    :pswitch_228
    sget-object v0, Lle0;->N:Lle0;

    goto :goto_1f1

    :pswitch_22b
    sget-object v0, Lle0;->A:Lle0;

    goto :goto_1f1

    :pswitch_22e
    sget-object v0, Lle0;->d:Lle0;

    goto :goto_246

    :pswitch_231
    sget-object v0, Lle0;->F:Lle0;

    goto :goto_246

    :pswitch_234
    sget-object v0, Lle0;->y:Lle0;

    goto :goto_1f1

    :pswitch_237
    sget-object v0, Lle0;->t:Lle0;

    goto :goto_246

    :pswitch_23a
    sget-object v0, Lle0;->p:Lle0;

    goto :goto_246

    :pswitch_23d
    sget-object v0, Lle0;->w:Lle0;

    goto :goto_1f1

    :pswitch_240
    sget-object v0, Lle0;->K:Lle0;

    goto :goto_1f1

    :pswitch_243
    sget-object v0, Lle0;->L:Lle0;

    goto :goto_1f1

    :cond_246
    :goto_246
    :pswitch_246
    invoke-virtual {p0, p1, v1, v0, p2}, Lx5f;->T(ZLjava/lang/String;Lle0;Lje0;)V

    return-void

    :sswitch_data_24a
    .sparse-switch
        -0x7a47e583 -> :sswitch_1b7
        -0x6113c964 -> :sswitch_1ad
        -0x5e33ea05 -> :sswitch_1a3
        -0x5b4ae05b -> :sswitch_199
        -0x4b52217c -> :sswitch_18f
        -0x49bb6847 -> :sswitch_185
        -0x4636466d -> :sswitch_17b
        -0x45f16402 -> :sswitch_171
        -0x45ee9a33 -> :sswitch_166
        -0x45ed2f16 -> :sswitch_15b
        -0x3fb0dee0 -> :sswitch_14f
        -0x3c29a2a6 -> :sswitch_143
        -0x33c0a693 -> :sswitch_137
        -0x33676bac -> :sswitch_12b
        -0x31e46be6 -> :sswitch_11f
        -0x2ceb4705 -> :sswitch_113
        -0x2c279937 -> :sswitch_107
        -0x231b57c3 -> :sswitch_fb
        -0x1899de12 -> :sswitch_ef
        -0x133a0fa7 -> :sswitch_e3
        -0xb93d81e -> :sswitch_d7
        0x4fdc20e -> :sswitch_cb
        0xeed1a1b -> :sswitch_bf
        0xfc2277a -> :sswitch_b3
        0x13fe101c -> :sswitch_a7
        0x2477a3ba -> :sswitch_9b
        0x280f4734 -> :sswitch_8f
        0x2d77764f -> :sswitch_83
        0x45707542 -> :sswitch_77
        0x4f7d534e -> :sswitch_6b
        0x4fce7b6a -> :sswitch_5f
        0x541d80f4 -> :sswitch_53
        0x6590ee62 -> :sswitch_47
        0x6abfd7be -> :sswitch_3b
        0x6f35f57a -> :sswitch_2f
        0x737c5b98 -> :sswitch_23
    .end sparse-switch

    :pswitch_data_2dc
    .packed-switch 0x0
        :pswitch_243
        :pswitch_240
        :pswitch_23d
        :pswitch_23a
        :pswitch_237
        :pswitch_237
        :pswitch_234
        :pswitch_246
        :pswitch_231
        :pswitch_22e
        :pswitch_22b
        :pswitch_228
        :pswitch_225
        :pswitch_222
        :pswitch_21f
        :pswitch_21c
        :pswitch_219
        :pswitch_216
        :pswitch_213
        :pswitch_210
        :pswitch_20d
        :pswitch_20a
        :pswitch_237
        :pswitch_207
        :pswitch_204
        :pswitch_201
        :pswitch_1fe
        :pswitch_1fb
        :pswitch_1f8
        :pswitch_1f4
        :pswitch_1ef
        :pswitch_20a
        :pswitch_1d9
        :pswitch_1d5
        :pswitch_1d1
        :pswitch_1cd
    .end packed-switch
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_4
    invoke-static {p0}, Lmdb;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-static {v0}, Lmdb;->d(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    :cond_10
    return-object p0

    :cond_11
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4
.end method

.method public static i(Landroid/content/Intent;Landroid/net/Uri;)V
    .registers 5

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_2d

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lv61;->a(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "raw:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :cond_2d
    const-string v0, "android.provider.extra.INITIAL_URI"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-void
.end method
