.class public final synthetic Lqa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroid/widget/FrameLayout$LayoutParams;Lmyn;Lma;Lna;Lnx5;Lkxn;)V
    .registers 9

    .line 21
    const/4 p7, 0x0

    iput-byte p7, p0, Lqa;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqa;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqa;->c:Ljava/lang/Object;

    iput-object p3, p0, Lqa;->d:Ljava/lang/Object;

    iput-object p4, p0, Lqa;->e:Ljava/lang/Object;

    iput-object p5, p0, Lqa;->f:Ljava/lang/Object;

    iput-object p6, p0, Lqa;->g:Ljava/lang/Object;

    iput-object p8, p0, Lqa;->h:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lpjn;Llqh;Llqh;Llqh;Llqh;Llqh;Lr65;)V
    .registers 9

    const/4 v0, 0x1

    iput-byte v0, p0, Lqa;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqa;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqa;->c:Ljava/lang/Object;

    iput-object p3, p0, Lqa;->d:Ljava/lang/Object;

    iput-object p4, p0, Lqa;->e:Ljava/lang/Object;

    iput-object p5, p0, Lqa;->f:Ljava/lang/Object;

    iput-object p6, p0, Lqa;->g:Ljava/lang/Object;

    iput-object p7, p0, Lqa;->h:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lqa;->a:B

    iget-object v1, p0, Lqa;->h:Ljava/lang/Object;

    iget-object v2, p0, Lqa;->g:Ljava/lang/Object;

    iget-object v3, p0, Lqa;->f:Ljava/lang/Object;

    iget-object v4, p0, Lqa;->e:Ljava/lang/Object;

    iget-object v5, p0, Lqa;->d:Ljava/lang/Object;

    iget-object v6, p0, Lqa;->c:Ljava/lang/Object;

    iget-object p0, p0, Lqa;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_122

    check-cast p0, Lpjn;

    check-cast v6, Llqh;

    check-cast v5, Llqh;

    check-cast v4, Llqh;

    check-cast v3, Llqh;

    check-cast v2, Llqh;

    check-cast v1, Lr65;

    check-cast p1, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFData;

    const/4 v0, 0x0

    if-eqz p1, :cond_78

    iget-object p1, p1, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFData;->b:Ljava/util/List;

    if-eqz p1, :cond_78

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_30
    :goto_30
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_78

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFPurpose;

    iget v8, v7, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFPurpose;->c:I

    iget-object v7, v7, Lcom/usercentrics/sdk/services/tcf/interfaces/TCFPurpose;->e:Ljava/lang/Boolean;

    const/4 v9, 0x3

    if-eq v8, v9, :cond_6d

    const/4 v9, 0x4

    if-eq v8, v9, :cond_62

    const/4 v9, 0x5

    if-eq v8, v9, :cond_57

    const/4 v9, 0x6

    if-ne v8, v9, :cond_30

    if-eqz v7, :cond_53

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    goto :goto_54

    :cond_53
    move v7, v0

    :goto_54
    iput-boolean v7, v4, Llqh;->a:Z

    goto :goto_30

    :cond_57
    if-eqz v7, :cond_5e

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    goto :goto_5f

    :cond_5e
    move v7, v0

    :goto_5f
    iput-boolean v7, v5, Llqh;->a:Z

    goto :goto_30

    :cond_62
    if-eqz v7, :cond_69

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    goto :goto_6a

    :cond_69
    move v7, v0

    :goto_6a
    iput-boolean v7, v2, Llqh;->a:Z

    goto :goto_30

    :cond_6d
    if-eqz v7, :cond_74

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    goto :goto_75

    :cond_74
    move v7, v0

    :goto_75
    iput-boolean v7, v3, Llqh;->a:Z

    goto :goto_30

    :cond_78
    iget-boolean p1, v6, Llqh;->a:Z

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lxv1;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    const-string v7, "collect_website_categories"

    invoke-virtual {v6, p1, v7}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p1

    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lsdf;->c(I)V

    iget-boolean p1, v5, Llqh;->a:Z

    if-eqz p1, :cond_9b

    iget-boolean p1, v4, Llqh;->a:Z

    if-eqz p1, :cond_9b

    move p1, v6

    goto :goto_9c

    :cond_9b
    move p1, v0

    :goto_9c
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v7

    const-string v8, "personalized_news"

    invoke-virtual {v7, p1, v8}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p1

    const/16 v7, 0x20

    invoke-virtual {p1, v7}, Lsdf;->c(I)V

    iget-boolean p1, v5, Llqh;->a:Z

    if-eqz p1, :cond_b8

    iget-boolean p1, v4, Llqh;->a:Z

    if-eqz p1, :cond_b8

    move p1, v6

    goto :goto_b9

    :cond_b8
    move p1, v0

    :goto_b9
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    const-string v5, "process_news_topics"

    invoke-virtual {v4, p1, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p1

    const/16 v4, 0x8

    invoke-virtual {p1, v4}, Lsdf;->c(I)V

    iget-boolean p1, v3, Llqh;->a:Z

    if-eqz p1, :cond_d3

    iget-boolean p1, v2, Llqh;->a:Z

    if-nez p1, :cond_d4

    :cond_d3
    move v6, v0

    :cond_d4
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    const-string v2, "personalized_ads"

    invoke-virtual {p1, v6, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object p1

    const/16 v2, 0x40

    invoke-virtual {p1, v2}, Lsdf;->c(I)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->I()Z

    move-result p1

    if-nez p1, :cond_f9

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "personalized_default"

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_f9
    iget-object p0, v1, Lr65;->f:Ld7h;

    invoke-virtual {p0}, Ld7h;->e()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_101
    move-object v0, p0

    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    check-cast v4, Lmyn;

    check-cast v3, Lma;

    check-cast v2, Lna;

    check-cast v1, Lkxn;

    move-object v7, p1

    check-cast v7, Landroid/content/Context;

    move-object v10, v6

    move-object v6, v1

    move-object v1, v10

    move-object v10, v5

    move-object v5, v2

    move-object v2, v10

    move-object v10, v4

    move-object v4, v3

    move-object v3, v10

    invoke-static/range {v0 .. v7}, Lt8;->c(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroid/widget/FrameLayout$LayoutParams;Lmyn;Lma;Lna;Lkxn;Landroid/content/Context;)Landroid/webkit/WebView;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_101
    .end packed-switch
.end method
