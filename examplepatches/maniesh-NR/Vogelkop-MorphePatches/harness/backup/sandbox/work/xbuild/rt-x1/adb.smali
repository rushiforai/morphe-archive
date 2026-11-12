.class public final Ladb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Z

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Landroid/os/Bundle;)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Ladb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ladb;->b:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lhqc;->b:Lhqc;

    const/4 v1, 0x0

    if-eqz p2, :cond_a5

    const-string v2, "livescore_id"

    const-wide/16 v3, -0x1

    invoke-virtual {p2, v2, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    cmp-long v3, v5, v3

    if-nez v3, :cond_1e

    move-object v2, v1

    :cond_1e
    const-string v3, "livescore_destination"

    invoke-virtual {p2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_a5

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_ba

    goto/16 :goto_a5

    :sswitch_2f
    const-string v4, "onboarding_follow_teams"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    new-instance v1, Lmqc;

    invoke-direct {v1, v2}, Lmqc;-><init>(Ljava/lang/Long;)V

    goto/16 :goto_a5

    :sswitch_3e
    const-string v2, "base"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a5

    move-object v1, p1

    goto :goto_a5

    :sswitch_48
    const-string v4, "football_team"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    if-eqz v2, :cond_a5

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    new-instance v3, Llqc;

    invoke-direct {v3, v1, v2}, Llqc;-><init>(J)V

    :goto_5b
    move-object v1, v3

    goto :goto_a5

    :sswitch_5d
    const-string v4, "competition"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    if-eqz v2, :cond_a5

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    new-instance v3, Ljqc;

    const-string v4, "livescore_phase_name"

    invoke-virtual {p2, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v2, v4}, Ljqc;-><init>(JLjava/lang/String;)V

    goto :goto_5b

    :sswitch_77
    const-string v4, "football_match"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    if-eqz v2, :cond_a5

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    new-instance v3, Lkqc;

    const-string v4, "livescore_play_audio"

    invoke-virtual {p2, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-direct {v3, v1, v2, v4}, Lkqc;-><init>(JZ)V

    goto :goto_5b

    :sswitch_91
    const-string v4, "basketball_match"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    if-eqz v2, :cond_a5

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    new-instance v3, Liqc;

    invoke-direct {v3, v1, v2}, Liqc;-><init>(J)V

    goto :goto_5b

    :cond_a5
    :goto_a5
    if-eqz v1, :cond_a8

    move-object p1, v1

    :cond_a8
    iput-object p1, p0, Ladb;->d:Ljava/lang/Object;

    if-eqz p2, :cond_b6

    const-string p1, "enable_carousel"

    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    :cond_b6
    iput-boolean v0, p0, Ladb;->c:Z

    return-void

    nop

    :sswitch_data_ba
    .sparse-switch
        -0x7373be35 -> :sswitch_91
        -0x4ab49d8d -> :sswitch_77
        -0x414a6e41 -> :sswitch_5d
        -0x33f21411 -> :sswitch_48
        0x2e06d1 -> :sswitch_3e
        0x3dab974c -> :sswitch_2f
    .end sparse-switch
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnej;Z)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ladb;->a:B

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    iput-object p1, p0, Ladb;->b:Lcom/opera/android/BrowserActivity;

    .line 188
    iput-object p2, p0, Ladb;->d:Ljava/lang/Object;

    .line 189
    iput-boolean p3, p0, Ladb;->c:Z

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 8

    iget-byte v0, p0, Ladb;->a:B

    iget-object v1, p0, Ladb;->d:Ljava/lang/Object;

    iget-boolean v2, p0, Ladb;->c:Z

    iget-object v3, p0, Ladb;->b:Lcom/opera/android/BrowserActivity;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_94

    invoke-static {v3}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v0

    iget-object v5, v0, Lgom;->a:Llom;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_4f

    if-eq v5, v4, :cond_24

    const/4 v6, 0x2

    if-eq v5, v6, :cond_24

    const/4 v6, 0x3

    if-eq v5, v6, :cond_24

    invoke-static {}, Lh9o;->p()V

    goto :goto_4f

    :cond_24
    if-nez v2, :cond_4c

    iget-object v2, v0, Lgom;->b:Lkom;

    sget-object v5, Lkom;->b:Lkom;

    if-eq v2, v5, :cond_4c

    check-cast v1, Lnej;

    new-instance v2, Log5;

    new-instance v3, Lb57;

    const/16 v5, 0xd

    invoke-direct {v3, p0, v0, v5}, Lb57;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lue5;

    const v0, 0x1df2ed4b

    invoke-direct {p0, v0, v3, v4}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const/4 v0, 0x0

    invoke-direct {v2, p0, v0}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_4f

    :cond_4c
    invoke-static {v3, v0}, Lmom;->b(Lt5d;Lgom;)V

    :cond_4f
    :goto_4f
    return-void

    :pswitch_50
    invoke-static {v3}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-eqz p0, :cond_93

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    if-eqz v2, :cond_77

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object v0

    iget-object v0, v0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "live_scores_enabled"

    invoke-virtual {v0, v4, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_77
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrnc;

    invoke-virtual {p0, v3}, Lrnc;->a(Lndc;)Ltn;

    move-result-object p0

    check-cast v1, Ltc2;

    const/4 v0, 0x0

    invoke-virtual {p0, v3, v1, v0}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    :cond_93
    return-void

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_50
    .end packed-switch
.end method
