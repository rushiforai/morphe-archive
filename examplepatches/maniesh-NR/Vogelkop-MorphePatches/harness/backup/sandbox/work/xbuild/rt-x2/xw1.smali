.class public abstract Lxw1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static final b:Lvzk;

.field public static c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lvzk;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Li7f;

    invoke-direct {v2}, Li7f;-><init>()V

    iput-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lvzk;->c:Ljava/lang/Object;

    iput-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    sput-object v0, Lxw1;->b:Lvzk;

    return-void
.end method

.method public static a(Lhjf;Landroid/content/Context;Lr65;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Ll45;)V
    .registers 10

    invoke-virtual {p2}, Lr65;->m()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_11

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    invoke-virtual {p2, v1}, Lcom/appsflyer/AppsFlyerLib;->enableTCFDataCollection(Z)V

    goto/16 :goto_1e0

    :cond_11
    iget-object p2, p2, Lr65;->b:Lvx;

    invoke-virtual {p2}, Lvx;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ld75;

    iget-boolean p2, p2, Ld75;->i:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_1b5

    if-eqz p4, :cond_1ad

    invoke-virtual {p3}, Lcom/opera/android/settings/SettingsManager;->G()Z

    move-result p2

    if-nez p2, :cond_1ad

    invoke-virtual {p4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_1ab

    sget-object p4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p2, p4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p4

    const/4 v3, -0x1

    sparse-switch p4, :sswitch_data_204

    goto/16 :goto_1a6

    :sswitch_45
    const-string p4, "sk"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x1e

    goto/16 :goto_1a6

    :sswitch_51
    const-string p4, "si"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x1d

    goto/16 :goto_1a6

    :sswitch_5d
    const-string p4, "se"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x1c

    goto/16 :goto_1a6

    :sswitch_69
    const-string p4, "ro"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x1b

    goto/16 :goto_1a6

    :sswitch_75
    const-string p4, "pt"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x1a

    goto/16 :goto_1a6

    :sswitch_81
    const-string p4, "pl"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x19

    goto/16 :goto_1a6

    :sswitch_8d
    const-string p4, "no"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x18

    goto/16 :goto_1a6

    :sswitch_99
    const-string p4, "nl"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x17

    goto/16 :goto_1a6

    :sswitch_a5
    const-string p4, "mt"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x16

    goto/16 :goto_1a6

    :sswitch_b1
    const-string p4, "lv"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x15

    goto/16 :goto_1a6

    :sswitch_bd
    const-string p4, "lu"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x14

    goto/16 :goto_1a6

    :sswitch_c9
    const-string p4, "lt"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x13

    goto/16 :goto_1a6

    :sswitch_d5
    const-string p4, "li"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x12

    goto/16 :goto_1a6

    :sswitch_e1
    const-string p4, "it"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x11

    goto/16 :goto_1a6

    :sswitch_ed
    const-string p4, "is"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x10

    goto/16 :goto_1a6

    :sswitch_f9
    const-string p4, "ie"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xf

    goto/16 :goto_1a6

    :sswitch_105
    const-string p4, "hu"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xe

    goto/16 :goto_1a6

    :sswitch_111
    const-string p4, "hr"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xd

    goto/16 :goto_1a6

    :sswitch_11d
    const-string p4, "gr"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xc

    goto/16 :goto_1a6

    :sswitch_129
    const-string p4, "gb"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xb

    goto/16 :goto_1a6

    :sswitch_135
    const-string p4, "fr"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0xa

    goto/16 :goto_1a6

    :sswitch_141
    const-string p4, "fi"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x9

    goto :goto_1a6

    :sswitch_14c
    const-string p4, "es"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/16 v3, 0x8

    goto :goto_1a6

    :sswitch_157
    const-string p4, "ee"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x7

    goto :goto_1a6

    :sswitch_161
    const-string p4, "dk"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x6

    goto :goto_1a6

    :sswitch_16b
    const-string p4, "de"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x5

    goto :goto_1a6

    :sswitch_175
    const-string p4, "cz"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x4

    goto :goto_1a6

    :sswitch_17f
    const-string p4, "cy"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x3

    goto :goto_1a6

    :sswitch_189
    const-string p4, "bg"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    const/4 v3, 0x2

    goto :goto_1a6

    :sswitch_193
    const-string p4, "be"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    move v3, v1

    goto :goto_1a6

    :sswitch_19d
    const-string p4, "at"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a6

    move v3, v0

    :cond_1a6
    :goto_1a6
    packed-switch v3, :pswitch_data_282

    move p2, v0

    goto :goto_1b3

    :cond_1ab
    :pswitch_1ab
    move p2, v1

    goto :goto_1b3

    :cond_1ad
    const-string p2, "inside_eea"

    invoke-virtual {p3, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    :goto_1b3
    if-nez p2, :cond_1b6

    :cond_1b5
    move v1, v0

    :cond_1b6
    const-string p2, "personalized_ads"

    invoke-virtual {p3, p2}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p2

    if-eqz v1, :cond_1d2

    new-instance p3, Lcom/appsflyer/AppsFlyerConsent;

    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p3, p4, v0, v1, p2}, Lcom/appsflyer/AppsFlyerConsent;-><init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    goto :goto_1d9

    :cond_1d2
    new-instance p3, Lcom/appsflyer/AppsFlyerConsent;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p3, p2, v2, v2, v2}, Lcom/appsflyer/AppsFlyerConsent;-><init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    :goto_1d9
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/appsflyer/AppsFlyerLib;->setConsentData(Lcom/appsflyer/AppsFlyerConsent;)V

    :goto_1e0
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    new-instance p3, Lww1;

    invoke-direct {p3, p5}, Lww1;-><init>(Ll45;)V

    const-string p4, "aWV5TF2eQmEbHYUWbhuGNP"

    invoke-virtual {p2, p0, p4, p3}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    sget-object p0, Lxw1;->c:Ljava/lang/String;

    if-eqz p0, :cond_202

    sget-boolean p2, Lxw1;->a:Z

    if-nez p2, :cond_1f9

    sput-object p0, Lxw1;->c:Ljava/lang/String;

    goto :goto_200

    :cond_1f9
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p2

    invoke-virtual {p2, p1, p0}, Lcom/appsflyer/AppsFlyerLib;->updateServerUninstallToken(Landroid/content/Context;Ljava/lang/String;)V

    :goto_200
    sput-object v2, Lxw1;->c:Ljava/lang/String;

    :cond_202
    return-void

    nop

    :sswitch_data_204
    .sparse-switch
        0xc33 -> :sswitch_19d
        0xc43 -> :sswitch_193
        0xc45 -> :sswitch_189
        0xc76 -> :sswitch_17f
        0xc77 -> :sswitch_175
        0xc81 -> :sswitch_16b
        0xc87 -> :sswitch_161
        0xca0 -> :sswitch_157
        0xcae -> :sswitch_14c
        0xcc3 -> :sswitch_141
        0xccc -> :sswitch_135
        0xcdb -> :sswitch_129
        0xceb -> :sswitch_11d
        0xd0a -> :sswitch_111
        0xd0d -> :sswitch_105
        0xd1c -> :sswitch_f9
        0xd2a -> :sswitch_ed
        0xd2b -> :sswitch_e1
        0xd7d -> :sswitch_d5
        0xd88 -> :sswitch_c9
        0xd89 -> :sswitch_bd
        0xd8a -> :sswitch_b1
        0xda7 -> :sswitch_a5
        0xdbe -> :sswitch_99
        0xdc1 -> :sswitch_8d
        0xdfc -> :sswitch_81
        0xe04 -> :sswitch_75
        0xe3d -> :sswitch_69
        0xe52 -> :sswitch_5d
        0xe56 -> :sswitch_51
        0xe58 -> :sswitch_45
    .end sparse-switch

    :pswitch_data_282
    .packed-switch 0x0
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
        :pswitch_1ab
    .end packed-switch
.end method
