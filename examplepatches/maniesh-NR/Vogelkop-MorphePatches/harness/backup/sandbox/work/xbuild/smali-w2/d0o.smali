.class public final synthetic Ld0o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(IZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Ld0o;->a:Z

    iput p1, p0, Ld0o;->b:I

    iput-boolean p3, p0, Ld0o;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    iget-boolean v0, p0, Ld0o;->a:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_204

    iget-object v0, p1, Lcom/opera/android/startup/WelcomeActivity;->m:Lx77;

    if-eqz v0, :cond_1d0

    iget-object v3, v0, Lx77;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/Lazy;

    const-string v5, "inside_eea"

    if-eqz v4, :cond_1ca

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->G()Z

    move-result v6

    if-nez v6, :cond_1ca

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v0, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Lx5f;

    const/4 v6, 0x2

    if-eqz v4, :cond_33

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v7, v6, :cond_33

    move v7, v1

    goto :goto_34

    :cond_33
    move v7, v2

    :goto_34
    iget-object v8, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v8}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v8

    const/16 v10, 0x11

    invoke-virtual {v8, v10, v1, v7}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v9}, Lx5f;->U0(Lx56;)V

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1c5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v7, -0x1

    sparse-switch v4, :sswitch_data_2a4

    goto/16 :goto_1bd

    :sswitch_5f
    const-string v4, "sk"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x1e

    goto/16 :goto_1c0

    :sswitch_6b
    const-string v4, "si"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x1d

    goto/16 :goto_1c0

    :sswitch_77
    const-string v4, "se"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x1c

    goto/16 :goto_1c0

    :sswitch_83
    const-string v4, "ro"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x1b

    goto/16 :goto_1c0

    :sswitch_8f
    const-string v4, "pt"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x1a

    goto/16 :goto_1c0

    :sswitch_9b
    const-string v4, "pl"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x19

    goto/16 :goto_1c0

    :sswitch_a7
    const-string v4, "no"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x18

    goto/16 :goto_1c0

    :sswitch_b3
    const-string v4, "nl"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x17

    goto/16 :goto_1c0

    :sswitch_bf
    const-string v4, "mt"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x16

    goto/16 :goto_1c0

    :sswitch_cb
    const-string v4, "lv"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x15

    goto/16 :goto_1c0

    :sswitch_d7
    const-string v4, "lu"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x14

    goto/16 :goto_1c0

    :sswitch_e3
    const-string v4, "lt"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x13

    goto/16 :goto_1c0

    :sswitch_ef
    const-string v4, "li"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x12

    goto/16 :goto_1c0

    :sswitch_fb
    const-string v4, "it"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    move v6, v10

    goto/16 :goto_1c0

    :sswitch_106
    const-string v4, "is"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x10

    goto/16 :goto_1c0

    :sswitch_112
    const-string v4, "ie"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xf

    goto/16 :goto_1c0

    :sswitch_11e
    const-string v4, "hu"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xe

    goto/16 :goto_1c0

    :sswitch_12a
    const-string v4, "hr"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xd

    goto/16 :goto_1c0

    :sswitch_136
    const-string v4, "gr"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xc

    goto/16 :goto_1c0

    :sswitch_142
    const-string v4, "gb"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xb

    goto/16 :goto_1c0

    :sswitch_14e
    const-string v4, "fr"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0xa

    goto/16 :goto_1c0

    :sswitch_15a
    const-string v4, "fi"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x9

    goto :goto_1c0

    :sswitch_165
    const-string v4, "es"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/16 v6, 0x8

    goto :goto_1c0

    :sswitch_170
    const-string v4, "ee"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/4 v6, 0x7

    goto :goto_1c0

    :sswitch_17a
    const-string v4, "dk"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/4 v6, 0x6

    goto :goto_1c0

    :sswitch_184
    const-string v4, "de"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/4 v6, 0x5

    goto :goto_1c0

    :sswitch_18e
    const-string v4, "cz"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/4 v6, 0x4

    goto :goto_1c0

    :sswitch_198
    const-string v4, "cy"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    const/4 v6, 0x3

    goto :goto_1c0

    :sswitch_1a2
    const-string v4, "bg"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c0

    goto :goto_1bd

    :sswitch_1ab
    const-string v4, "be"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1bd

    move v6, v1

    goto :goto_1c0

    :sswitch_1b5
    const-string v4, "at"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1bf

    :cond_1bd
    :goto_1bd
    move v6, v7

    goto :goto_1c0

    :cond_1bf
    move v6, v2

    :cond_1c0
    :goto_1c0
    packed-switch v6, :pswitch_data_322

    move v0, v2

    goto :goto_1c6

    :cond_1c5
    :pswitch_1c5
    move v0, v1

    :goto_1c6
    invoke-virtual {v3, v0, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_1ce

    :cond_1ca
    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    :goto_1ce
    if-ne v0, v1, :cond_204

    :cond_1d0
    invoke-static {p1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    iget-object v3, v0, Lcom/google/firebase/analytics/FirebaseAnalytics;->a:Lcom/google/android/gms/internal/measurement/zzez;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/measurement/zzez;->zzq(Ljava/lang/Boolean;)V

    new-instance v3, Lkotlin/Pair;

    sget-object v4, Lm49;->b:Lm49;

    sget-object v5, Ll49;->b:Ll49;

    invoke-direct {v3, v4, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v4, Lkotlin/Pair;

    sget-object v6, Lm49;->a:Lm49;

    invoke-direct {v4, v6, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Lkotlin/Pair;

    sget-object v7, Lm49;->c:Lm49;

    invoke-direct {v6, v7, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v7, Lkotlin/Pair;

    sget-object v8, Lm49;->d:Lm49;

    invoke-direct {v7, v8, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v4, v6, v7}, [Lkotlin/Pair;

    move-result-object v3

    invoke-static {v3}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/firebase/analytics/FirebaseAnalytics;->a(Ljava/util/Map;)V

    :cond_204
    iget v0, p0, Ld0o;->b:I

    if-nez v0, :cond_287

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->m0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lldf;

    iget-object v0, p0, Lldf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v3, "need"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_238

    iget-object p0, p0, Lldf;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v3}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_238
    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p0

    if-eqz p0, :cond_285

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p0

    iget-object p0, p0, Lsdf;->c:Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lbef;->e()Lbef;

    move-result-object v0

    if-eq p0, v0, :cond_271

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p0

    iget-object p0, p0, Lsdf;->c:Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbef;

    invoke-virtual {p0}, Lbef;->i()Z

    move-result p0

    if-nez p0, :cond_271

    move v2, v1

    :cond_271
    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "personalized_default"

    invoke-virtual {p0, v2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    if-nez v2, :cond_285

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "news_is_blocked_by_personalization_change"

    invoke-virtual {p0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_285
    const/4 p0, 0x0

    return-object p0

    :cond_287
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lln5;

    invoke-direct {p1}, Lln5;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key.consents"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "key.should_fade_buttons"

    iget-boolean p0, p0, Ld0o;->c:Z

    invoke-virtual {v1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object p1

    :sswitch_data_2a4
    .sparse-switch
        0xc33 -> :sswitch_1b5
        0xc43 -> :sswitch_1ab
        0xc45 -> :sswitch_1a2
        0xc76 -> :sswitch_198
        0xc77 -> :sswitch_18e
        0xc81 -> :sswitch_184
        0xc87 -> :sswitch_17a
        0xca0 -> :sswitch_170
        0xcae -> :sswitch_165
        0xcc3 -> :sswitch_15a
        0xccc -> :sswitch_14e
        0xcdb -> :sswitch_142
        0xceb -> :sswitch_136
        0xd0a -> :sswitch_12a
        0xd0d -> :sswitch_11e
        0xd1c -> :sswitch_112
        0xd2a -> :sswitch_106
        0xd2b -> :sswitch_fb
        0xd7d -> :sswitch_ef
        0xd88 -> :sswitch_e3
        0xd89 -> :sswitch_d7
        0xd8a -> :sswitch_cb
        0xda7 -> :sswitch_bf
        0xdbe -> :sswitch_b3
        0xdc1 -> :sswitch_a7
        0xdfc -> :sswitch_9b
        0xe04 -> :sswitch_8f
        0xe3d -> :sswitch_83
        0xe52 -> :sswitch_77
        0xe56 -> :sswitch_6b
        0xe58 -> :sswitch_5f
    .end sparse-switch

    :pswitch_data_322
    .packed-switch 0x0
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
        :pswitch_1c5
    .end packed-switch
.end method
