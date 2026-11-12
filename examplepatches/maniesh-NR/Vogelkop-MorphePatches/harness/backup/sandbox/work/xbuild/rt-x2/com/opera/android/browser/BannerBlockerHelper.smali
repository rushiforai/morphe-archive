.class public final Lcom/opera/android/browser/BannerBlockerHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# static fields
.field public static final b:[Ljava/lang/String;

.field public static c:I


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method static constructor <clinit>()V
    .registers 60

    const-string v58, "VA"

    const-string v59, "XK"

    const-string v1, "AD"

    const-string v2, "AL"

    const-string v3, "AM"

    const-string v4, "AT"

    const-string v5, "AX"

    const-string v6, "AZ"

    const-string v7, "BA"

    const-string v8, "BE"

    const-string v9, "BG"

    const-string v10, "BY"

    const-string v11, "CH"

    const-string v12, "CY"

    const-string v13, "CZ"

    const-string v14, "DE"

    const-string v15, "DK"

    const-string v16, "EE"

    const-string v17, "ES"

    const-string v18, "FI"

    const-string v19, "FO"

    const-string v20, "FR"

    const-string v21, "GB"

    const-string v22, "GE"

    const-string v23, "GG"

    const-string v24, "GI"

    const-string v25, "GL"

    const-string v26, "GR"

    const-string v27, "HR"

    const-string v28, "HU"

    const-string v29, "IE"

    const-string v30, "IM"

    const-string v31, "IS"

    const-string v32, "IT"

    const-string v33, "JE"

    const-string v34, "KZ"

    const-string v35, "LI"

    const-string v36, "LT"

    const-string v37, "LU"

    const-string v38, "LV"

    const-string v39, "MC"

    const-string v40, "MD"

    const-string v41, "ME"

    const-string v42, "MK"

    const-string v43, "MT"

    const-string v44, "NL"

    const-string v45, "NO"

    const-string v46, "PL"

    const-string v47, "PT"

    const-string v48, "RO"

    const-string v49, "RS"

    const-string v50, "RU"

    const-string v51, "SE"

    const-string v52, "SI"

    const-string v53, "SJ"

    const-string v54, "SK"

    const-string v55, "SM"

    const-string v56, "TR"

    const-string v57, "UA"

    filled-new-array/range {v1 .. v59}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/opera/android/browser/BannerBlockerHelper;->b:[Ljava/lang/String;

    const/4 v0, 0x1

    sput v0, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/BannerBlockerHelper;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/browser/BannerBlockerHelper;->a()V

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public static onBadData(J)V
    .registers 4

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "size: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Bad bannerblocker list"

    invoke-static {p1, p0}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static onMissedBannerBlockOpportunity(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 6
    .param p0    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p0, :cond_1d

    invoke-static {p0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/BrowserActivity;

    if-eqz v1, :cond_1d

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, p0}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object p0

    if-eqz p0, :cond_1d

    sget v1, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1e

    if-ne v1, v2, :cond_35

    :cond_1d
    return-void

    :cond_1e
    const/4 v1, 0x4

    sput v1, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    invoke-static {v0}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object v1

    new-instance v3, Lvk2;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lvk2;-><init>(B)V

    sget-object v4, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v4, Ldz8;

    invoke-direct {v4, v3, v2}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v1, v4}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    :cond_35
    new-instance v1, Le23;

    invoke-direct {v1, v0, p0}, Le23;-><init>(Lcom/opera/android/BrowserActivity;Lb2l;)V

    check-cast p0, Ld7l;

    iget-object v2, p0, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->isLoading()Z

    move-result v2

    iget-object v3, p0, Ld7l;->j:Le7l;

    const/4 v4, 0x0

    if-eqz v2, :cond_54

    invoke-interface {v3}, Lb9l;->I()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lc23;

    invoke-direct {v3, v1, v2, v4}, Lc23;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v3}, Ld7l;->e0(La2l;)V

    goto :goto_63

    :cond_54
    invoke-interface {v3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, v1, Le23;->b:Z

    if-nez v3, :cond_63

    iput-object v2, v1, Le23;->c:Ljava/lang/String;

    const-wide/16 v2, 0x1388

    invoke-static {v1, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_63
    :goto_63
    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->R:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/history/HistoryManager;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ld23;

    invoke-direct {v2, v1, v4}, Ld23;-><init>(Ljava/lang/Object;B)V

    iget-wide v0, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v0, v1, p0, v2}, LJ/N;->MpaqgRo7(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "banner_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const-string v0, "ad_blocking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    return-void

    :cond_11
    invoke-virtual {p0}, Lcom/opera/android/browser/BannerBlockerHelper;->a()V

    return-void
.end method

.method public final a()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/BannerBlockerHelper;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->h()Z

    move-result p0

    invoke-static {p0}, LJ/N;->Mlri5RoO(Z)V

    return-void
.end method
