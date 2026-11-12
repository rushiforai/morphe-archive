.class public final Lmy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/net/Uri$Builder;

.field public final b:Ldg7;

.field public final c:Lt9f;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Li5o;


# direct methods
.method public constructor <init>(Li5o;Landroid/net/Uri$Builder;Ldg7;Lt9f;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lmy;->d:Ljava/lang/String;

    iput-object p6, p0, Lmy;->e:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lmy;->f:Li5o;

    iput-object p2, p0, Lmy;->a:Landroid/net/Uri$Builder;

    iput-object p3, p0, Lmy;->b:Ldg7;

    iput-object p4, p0, Lmy;->c:Lt9f;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    new-instance v0, Lvff;

    iget-object v1, p0, Lmy;->a:Landroid/net/Uri$Builder;

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lmy;->f:Li5o;

    iget-object v3, v2, Li5o;->k:Ljava/lang/Object;

    check-cast v3, Lnz;

    const-string v4, ""

    if-eqz v3, :cond_13a

    iget-object v5, v2, Li5o;->d:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    invoke-static {v5}, Lyi4;->m(Landroid/content/Context;)Z

    move-result v6

    iget-object v7, v2, Li5o;->g:Ljava/lang/Object;

    check-cast v7, Lvx;

    iget-object v2, v2, Li5o;->h:Ljava/lang/Object;

    check-cast v2, Lesk;

    new-instance v8, Lorb;

    invoke-direct {v8}, Lorb;-><init>()V

    const/4 v9, 0x0

    if-eqz v6, :cond_35

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_36

    :cond_35
    move-object v2, v9

    :goto_36
    sget-object v10, Laik;->a:[Ljava/lang/String;

    if-eqz v2, :cond_3b

    move-object v4, v2

    :cond_3b
    const-string v2, "advertisingId"

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "personalizationEnabled"

    invoke-virtual {v8, v2, v6}, Lorb;->r(Ljava/lang/String;Z)V

    const-string v2, "hashedOperaId"

    iget-object v4, v3, Lnz;->o:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "channelId"

    iget-object v4, v3, Lnz;->n:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-boolean v4, v3, Lnz;->b:Z

    if-eqz v4, :cond_61

    const-string v4, "GOOGLE_PLAY"

    invoke-virtual {v2, v4}, Lvpb;->a(Ljava/lang/Object;)V

    :cond_61
    iget-boolean v4, v3, Lnz;->c:Z

    if-eqz v4, :cond_6a

    const-string v4, "FACEBOOK"

    invoke-virtual {v2, v4}, Lvpb;->a(Ljava/lang/Object;)V

    :cond_6a
    const-string v4, "availableServices"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "androidId"

    invoke-virtual {v8, v9, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v3, Lnz;->l:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_82

    invoke-virtual {v7}, Lvx;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :cond_82
    const-string v4, "countryCode"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "languageCode"

    iget-object v4, v3, Lnz;->d:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "appPackageName"

    iget-object v4, v3, Lnz;->e:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "appVersion"

    iget-object v4, v3, Lnz;->f:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "deviceVendor"

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "deviceModel"

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "osType"

    const-string v4, "ANDROID"

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "osVersion"

    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Lsle;->c()I

    move-result v2

    const/4 v4, 0x2

    if-eq v2, v4, :cond_db

    const/4 v4, 0x3

    if-eq v2, v4, :cond_d8

    const/4 v4, 0x4

    if-eq v2, v4, :cond_d5

    const/4 v4, 0x5

    if-eq v2, v4, :cond_d2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_cf

    const-string v2, "UNKNOWN"

    goto :goto_dd

    :cond_cf
    const-string v2, "CELLULAR_5G"

    goto :goto_dd

    :cond_d2
    const-string v2, "CELLULAR_4G"

    goto :goto_dd

    :cond_d5
    const-string v2, "CELLULAR_3G"

    goto :goto_dd

    :cond_d8
    const-string v2, "CELLULAR_2G"

    goto :goto_dd

    :cond_db
    const-string v2, "WIFI"

    :goto_dd
    const-string v4, "connectionType"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "placementKey"

    iget-object v4, p0, Lmy;->d:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "screenWidth"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "screenHeight"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "slotId"

    iget-object v4, p0, Lmy;->e:Ljava/lang/String;

    invoke-virtual {v8, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "big"

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "slotStyle"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "adCount"

    const/4 v4, 0x1

    invoke-virtual {v8, v4, v2}, Lorb;->n(ILjava/lang/String;)V

    invoke-static {v5}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_126

    const-string v2, "TABLET"

    goto :goto_128

    :cond_126
    const-string v2, "PHONE"

    :goto_128
    const-string v4, "deviceType"

    invoke-virtual {v8, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "operatorCode"

    iget-object v3, v3, Lnz;->k:Ljava/lang/String;

    invoke-virtual {v8, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v8, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_13a
    iget-object v2, p0, Lmy;->c:Lt9f;

    iget-object p0, p0, Lmy;->b:Ldg7;

    invoke-direct {v0, v2, v1, p0, v4}, Lvff;-><init>(Lt9f;Ljava/lang/String;Ldg7;Ljava/lang/String;)V

    invoke-virtual {v0}, Lg3k;->g()V

    return-void
.end method
