.class public Lcom/opera/android/settings/UserSettingsContentProvider;
.super Landroid/content/ContentProvider;
.source "SourceFile"


# static fields
.field public static f:Landroid/content/UriMatcher;


# instance fields
.field public a:Lb59;

.field public final b:Ljava/lang/Object;

.field public c:Landroid/content/ContentResolver;

.field public d:I

.field public e:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/content/Context;)Landroid/net/Uri;
    .registers 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".UserSettingsContentProvider"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "content://"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const-string v0, "_override_default"

    invoke-static {p0, v0}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .registers 4

    invoke-static {p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "value"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .registers 4

    invoke-static {p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "overrideDefault"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static e(Landroid/net/Uri;Lovm;)I
    .registers 8

    invoke-virtual {p0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p0

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, -0x1

    sparse-switch v3, :sswitch_data_54

    goto :goto_3e

    :sswitch_23
    const-string v2, "long"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    goto :goto_3e

    :sswitch_2c
    const-string v1, "int"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3e

    move v1, v2

    goto :goto_41

    :sswitch_36
    const-string v1, "String"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    :cond_3e
    :goto_3e
    move v1, v5

    goto :goto_41

    :cond_40
    move v1, v4

    :cond_41
    :goto_41
    packed-switch v1, :pswitch_data_62

    return v4

    :pswitch_45
    invoke-interface {p1, v0}, Lovm;->h(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_4a
    invoke-interface {p1, v0}, Lovm;->i(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_4f
    invoke-interface {p1, v0}, Lovm;->f(Ljava/lang/String;)I

    move-result p0

    return p0

    :sswitch_data_54
    .sparse-switch
        -0x6bc5b3cf -> :sswitch_36
        0x197ef -> :sswitch_2c
        0x32c67c -> :sswitch_23
    .end sparse-switch

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_4a
        :pswitch_45
    .end packed-switch
.end method

.method public static j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p1

    :cond_7
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    return-object p1

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 6

    sget-object p2, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p2

    const/4 p3, 0x0

    const/4 v0, 0x1

    if-eq p2, v0, :cond_b

    return p3

    :cond_b
    invoke-virtual {p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->g()V

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x2

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p2, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter p2

    :try_start_1c
    const-string v1, "previous_version_code"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    monitor-exit p2

    return p3

    :cond_26
    iget-object p0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit p2

    return v0

    :cond_41
    monitor-exit p2

    return p3

    :goto_43
    monitor-exit p2
    :try_end_44
    .catchall {:try_start_1c .. :try_end_44} :catchall_45

    throw p0

    :catchall_45
    move-exception p0

    goto :goto_43
.end method

.method public final f(Landroid/content/Context;ILxi5;)V
    .registers 16

    iget-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "settings_first_stored_version_key"

    const/4 v2, -0x1

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v3, 0x16

    if-gez v1, :cond_28

    if-lez p2, :cond_1a

    move v1, p2

    goto :goto_1b

    :cond_1a
    move v1, v3

    :goto_1b
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "settings_first_stored_version_key"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_28
    const/4 v1, 0x1

    if-ge p2, v1, :cond_38

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "image_mode"

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_38
    const/4 v4, 0x2

    if-ge p2, v4, :cond_5d

    const-string v5, "navigation_bar_placement"

    invoke-interface {p0, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-ltz v5, :cond_5d

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string v7, "app_layout"

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_50

    move v5, v1

    :cond_50
    invoke-interface {v6, v7, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "navigation_bar_placement"

    invoke-interface {v5, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_5d
    const/4 v5, 0x4

    const/4 v6, 0x0

    if-ge p2, v5, :cond_87

    const-string v5, "installation_id"

    invoke-interface {p0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_74

    invoke-static {}, Ltz5;->c()Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-static {v7, v5}, Ltz5;->f(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_74
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "installation_id"

    invoke-interface {v5, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "lib_decompress_done_libopera.so"

    invoke-interface {v5, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_87
    const/4 v5, 0x5

    if-ge p2, v5, :cond_ba

    const-string v5, "install_referrer"

    invoke-interface {p0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_ad

    invoke-static {v5}, Ldtg;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_ad

    invoke-static {p1}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "install_referrer"

    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_ad
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "install_referrer"

    invoke-interface {v5, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_ba
    const/4 v5, 0x7

    if-ge p2, v5, :cond_ca

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "is_pre_news_user"

    invoke-interface {v5, v7, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_ca
    const/16 v5, 0x8

    if-ge p2, v5, :cond_10e

    const-string v5, "app_layout"

    invoke-interface {p0, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-lez v5, :cond_e4

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "app_layout"

    sub-int/2addr v5, v1

    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_e4
    const-string v5, "downloads_location"

    invoke-interface {p0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_10e

    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_10e

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "downloads_location"

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v9}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_10e
    const/16 v5, 0x9

    if-ge p2, v5, :cond_123

    const-string v5, "turbo_compressed_bytes"

    const-wide/16 v7, 0x0

    invoke-interface {p0, v5, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    const-string v5, "turbo_uncompressed_bytes"

    invoke-interface {p0, v5, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-virtual {p3, v9, v10, v7, v8}, Lxi5;->i(JJ)V

    :cond_123
    const/16 p3, 0xb

    if-ge p2, p3, :cond_141

    const-string p3, "hide_bottombar"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-ltz p3, :cond_141

    if-nez p3, :cond_133

    move p3, v4

    goto :goto_134

    :cond_133
    move p3, v1

    :goto_134
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "toolbar_disposition_classic"

    invoke-interface {v5, v7, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_141
    const/16 p3, 0xc

    const/4 v5, 0x0

    if-ge p2, p3, :cond_16f

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-static {}, Llag;->values()[Llag;

    move-result-object v7

    array-length v8, v7

    move v9, v5

    :goto_150
    if-ge v9, v8, :cond_16c

    aget-object v10, v7, v9

    invoke-static {v10}, Lcom/opera/android/settings/SettingsManager;->K(Llag;)Z

    move-result v11

    if-nez v11, :cond_169

    invoke-static {v10}, Lcom/opera/android/settings/SettingsManager;->S(Llag;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_169

    invoke-interface {p0, v10, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    if-nez v11, :cond_169

    invoke-interface {p3, v10, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_169
    add-int/lit8 v9, v9, 0x1

    goto :goto_150

    :cond_16c
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_16f
    const/16 p3, 0xd

    if-ge p2, p3, :cond_190

    const-string p3, "app_theme"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-le p3, v2, :cond_190

    if-ne p3, v4, :cond_190

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v7, "app_theme"

    invoke-interface {p3, v7, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v7, "app_theme_accent"

    invoke-interface {p3, v7, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_190
    const/16 p3, 0xe

    if-ge p2, p3, :cond_1b9

    const-string p3, "night_mode"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-ltz p3, :cond_1b9

    const-string p3, "night_mode_brightness"

    const/16 v7, 0x1f4

    invoke-interface {p0, p3, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "night_mode_dimming"

    rsub-int p3, p3, 0x3e8

    invoke-interface {v7, v8, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v7, "night_mode_temperature"

    invoke-interface {p3, v7, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1b9
    const/16 p3, 0xf

    if-ge p2, p3, :cond_1d4

    const-string p3, "night_mode_temperature"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    const/16 v7, 0x258

    if-le p3, v7, :cond_1d4

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v8, "night_mode_temperature"

    invoke-interface {p3, v8, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1d4
    const/16 p3, 0x10

    if-ge p2, p3, :cond_1ef

    const-string p3, "offline_pages_location"

    invoke-interface {p0, p3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_1ef

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v6, "offline_pages_location"

    const-string v7, ""

    invoke-interface {p3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1ef
    const/16 p3, 0x11

    if-ge p2, p3, :cond_206

    const-string p3, "notifications_permission_defualt"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v4, :cond_206

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, p3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_206
    const/16 p3, 0x12

    if-ge p2, p3, :cond_230

    const-string p3, "wallet_network"

    const-string v6, "wallet_custom_server_id"

    filled-new-array {p3, v6}, [Ljava/lang/String;

    move-result-object p3

    move v6, v5

    :goto_213
    if-ge v6, v4, :cond_230

    aget-object v7, p3, v6

    invoke-interface {p0, v7}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_22d

    invoke-interface {p0, v7, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    int-to-long v8, v8

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10, v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_22d
    add-int/lit8 v6, v6, 0x1

    goto :goto_213

    :cond_230
    const/16 p3, 0x14

    if-ge p2, p3, :cond_268

    invoke-static {}, Li0l;->g()Z

    move-result p3

    if-eqz p3, :cond_268

    const-string p3, "app_layout"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-eq p3, v2, :cond_251

    if-eq p3, v1, :cond_251

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v6, "app_layout"

    invoke-interface {p3, v6, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_251
    const-string p3, "toolbar_disposition_tablet"

    invoke-interface {p0, p3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-eq p3, v2, :cond_268

    if-eqz p3, :cond_268

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v1, "toolbar_disposition_tablet"

    invoke-interface {p3, v1, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_268
    const/16 p3, 0x15

    if-ge p2, p3, :cond_299

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p3

    iget-object v1, p3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "exit_dialog_close_tabs"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_284

    iget-object p3, p3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "exit_dialog_clear_data"

    invoke-interface {p3, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_299

    :cond_284
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v1, "exit_clear_data_categories"

    invoke-static {p1}, Lz4o;->U(Landroid/content/Context;)[Lr25;

    move-result-object p1

    invoke-static {p1}, Lz4o;->r([Lr25;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_299
    if-ge p2, v3, :cond_2b0

    const-string p1, "external_apps_permission_default"

    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    if-eq p2, v2, :cond_2b0

    if-eq p2, v4, :cond_2b0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2b0
    monitor-exit v0

    return-void

    :goto_2b2
    monitor-exit v0
    :try_end_2b3
    .catchall {:try_start_3 .. :try_end_2b3} :catchall_2b4

    throw p0

    :catchall_2b4
    move-exception p0

    goto :goto_2b2
.end method

.method public final g()V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "settings_version_key"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/16 v4, 0x16

    if-eq v2, v4, :cond_34

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v5, "settings_version_key"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eq v2, v3, :cond_34

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Lcom/opera/android/settings/UserSettingsContentProvider;->f(Landroid/content/Context;ILxi5;)V

    :cond_34
    monitor-exit v0

    return-void

    :goto_36
    monitor-exit v0
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_38

    throw p0

    :catchall_38
    move-exception p0

    goto :goto_36
.end method

.method public final getType(Landroid/net/Uri;)Ljava/lang/String;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->e:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iget-object v1, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "version_code"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->d:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->e:Z

    monitor-exit v0

    return-void

    :goto_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_21

    throw p0

    :catchall_21
    move-exception p0

    goto :goto_1f
.end method

.method public final i(Landroid/net/Uri;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->c:Landroid/content/ContentResolver;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    return-void
.end method

.method public final insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .registers 3

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreate()Z
    .registers 6

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".UserSettingsContentProvider"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v1, v2}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v2, "remove/type/*"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v2, "value/*/*"

    const/4 v4, 0x2

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v2, "overrideDefault/*/*"

    const/4 v4, 0x3

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v2, "contains/anytype/*"

    const/4 v4, 0x4

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v2, "containsDefault/anytype/*"

    const/4 v4, 0x5

    invoke-virtual {v1, v0, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lvml;->d:Lumi;

    const/4 v2, 0x0

    new-array v2, v2, [Lbg1;

    const-string v4, "user_settings"

    invoke-static {v0, v1, v4, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->c:Landroid/content/ContentResolver;

    return v3
.end method

.method public final query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->g()V

    new-instance p2, Landroid/database/MatrixCursor;

    const-string p3, "value"

    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    sget-object p3, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    invoke-virtual {p3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p3

    const/4 p4, 0x2

    if-ne p3, p4, :cond_22

    new-instance p3, Ln9h;

    const/16 p4, 0xb

    invoke-direct {p3, p0, p2, p4}, Ln9h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, p3}, Lcom/opera/android/settings/UserSettingsContentProvider;->e(Landroid/net/Uri;Lovm;)I

    return-object p2

    :cond_22
    const/4 p5, 0x4

    if-ne p3, p5, :cond_5c

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p5, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter p5

    :try_start_32
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p3

    const-string p4, "previous_version_code"

    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_4e

    iget-object p0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4e

    const/4 p0, 0x0

    goto :goto_4f

    :cond_4e
    const/4 p0, 0x1

    :goto_4f
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    monitor-exit p5

    return-object p2

    :goto_58
    monitor-exit p5
    :try_end_59
    .catchall {:try_start_32 .. :try_end_59} :catchall_5a

    throw p0

    :catchall_5a
    move-exception p0

    goto :goto_58

    :cond_5c
    const/4 p5, 0x5

    if-ne p3, p5, :cond_8d

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter p3

    :try_start_70
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p4

    iget-object p0, p0, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    monitor-exit p3

    return-object p2

    :goto_89
    monitor-exit p3
    :try_end_8a
    .catchall {:try_start_70 .. :try_end_8a} :catchall_8b

    throw p0

    :catchall_8b
    move-exception p0

    goto :goto_89

    :cond_8d
    return-object p2
.end method

.method public final update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 5

    invoke-virtual {p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->g()V

    sget-object p3, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    invoke-virtual {p3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p3

    const/4 p4, 0x2

    if-ne p3, p4, :cond_16

    new-instance p3, Lagm;

    invoke-direct {p3, p0, p2, p1}, Lagm;-><init>(Lcom/opera/android/settings/UserSettingsContentProvider;Landroid/content/ContentValues;Landroid/net/Uri;)V

    invoke-static {p1, p3}, Lcom/opera/android/settings/UserSettingsContentProvider;->e(Landroid/net/Uri;Lovm;)I

    move-result p0

    return p0

    :cond_16
    const/4 p4, 0x3

    if-ne p3, p4, :cond_23

    new-instance p3, Loam;

    invoke-direct {p3, p0, p2, p1}, Loam;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1, p3}, Lcom/opera/android/settings/UserSettingsContentProvider;->e(Landroid/net/Uri;Lovm;)I

    move-result p0

    return p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method
