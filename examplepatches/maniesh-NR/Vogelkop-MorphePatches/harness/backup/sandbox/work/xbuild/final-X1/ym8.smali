.class public final Lym8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lf30;


# instance fields
.field public final a:Landroid/content/Context;

.field public volatile b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lf30;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lf30;-><init>(B)V

    sput-object v0, Lym8;->c:Lf30;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/OperaApplication;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lym8;->a:Landroid/content/Context;

    return-void
.end method

.method public static a(Landroid/content/Context;)Ljava/util/ArrayList;
    .registers 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    const/16 v3, 0x32

    if-ge v2, v3, :cond_12d

    const/16 v3, 0x25

    if-eq v2, v3, :cond_117

    const/16 v3, 0x27

    if-eq v2, v3, :cond_f2

    const/16 v3, 0x2b

    if-eq v2, v3, :cond_c8

    const/16 v3, 0x2e

    if-eq v2, v3, :cond_c3

    const/4 v3, 0x0

    const/16 v4, 0x30

    if-eq v2, v4, :cond_a4

    sget-object v4, Lym8;->c:Lf30;

    packed-switch v2, :pswitch_data_12e

    packed-switch v2, :pswitch_data_138

    goto/16 :goto_11f

    :pswitch_2a
    :try_start_2a
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->densityDpi:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11f

    :pswitch_3a
    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object v3

    iget-object v3, v3, Lgc7;->b:Lay;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfc7;

    iget-object v3, v3, Lfc7;->c:Ljava/lang/String;

    goto/16 :goto_11f

    :pswitch_52
    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object v3

    invoke-virtual {v3}, Lgc7;->a()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11f

    :pswitch_64
    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v3

    invoke-virtual {v3}, Ljk5;->a()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11f

    :pswitch_76
    invoke-static {p0}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-wide v5, v3, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/text/SimpleDateFormat;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11f

    :pswitch_8d
    invoke-static {p0}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-wide v5, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/text/SimpleDateFormat;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11f

    :cond_a4
    sget-object v5, Lpyn;->a:Ljava/util/HashSet;

    invoke-static {}, Landroid/webkit/WebView;->getCurrentWebViewPackage()Landroid/content/pm/PackageInfo;

    move-result-object v5

    if-eqz v5, :cond_11f

    new-instance v6, Lyd2;

    iget-object v7, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-direct {v6, v4, v7}, Lyd2;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lyd2;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const/16 v6, 0x31

    invoke-direct {v4, v6, v5}, Lyd2;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11f

    :cond_c3
    invoke-static {p0}, Lpyn;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    goto :goto_11f

    :cond_c8
    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    iget-object v4, v3, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v4, v4, Lxv1;->P0:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->c()Z

    move-result v4
    :try_end_d8
    .catchall {:try_start_2a .. :try_end_d8} :catchall_129

    if-eqz v4, :cond_e7

    :try_start_da
    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object v3, v3, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v4, "previous_version_code"

    invoke-interface {v3, v4, v1}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result v3
    :try_end_e6
    .catch Ljava/lang/SecurityException; {:try_start_da .. :try_end_e6} :catch_e7
    .catchall {:try_start_da .. :try_end_e6} :catchall_129

    goto :goto_e8

    :catch_e7
    :cond_e7
    const/4 v3, -0x1

    :goto_e8
    if-gez v3, :cond_ed

    :try_start_ea
    const-string v3, "<unknown>"

    goto :goto_11f

    :cond_ed
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_11f

    :cond_f2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_11f

    :cond_117
    invoke-static {p0}, Li0l;->a(Landroid/content/Context;)J

    move-result-wide v3

    invoke-static {v3, v4}, Laik;->m(J)Ljava/lang/String;

    move-result-object v3

    :cond_11f
    :goto_11f
    if-eqz v3, :cond_129

    new-instance v4, Lyd2;

    invoke-direct {v4, v2, v3}, Lyd2;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_129
    .catchall {:try_start_ea .. :try_end_129} :catchall_129

    :catchall_129
    :cond_129
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7

    :cond_12d
    return-object v0

    :pswitch_data_12e
    .packed-switch 0x19
        :pswitch_8d
        :pswitch_76
        :pswitch_64
    .end packed-switch

    :pswitch_data_138
    .packed-switch 0x1d
        :pswitch_52
        :pswitch_3a
        :pswitch_2a
    .end packed-switch
.end method
