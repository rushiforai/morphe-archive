.class public final Lrb6;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrb6;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result p1

    iput-boolean p1, p0, Lrb6;->b:Z

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    const-string v0, "personalized_news"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "process_news_topics"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_23

    :cond_10
    iget-object p1, p0, Lrb6;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v0

    iget-boolean v1, p0, Lrb6;->b:Z

    if-eq v0, v1, :cond_23

    iput-boolean v0, p0, Lrb6;->b:Z

    xor-int/lit8 v0, v0, 0x1

    const-string p0, "news_is_blocked_by_personalization_change"

    invoke-virtual {p1, v0, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_23
    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lrb6;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lrb6;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
