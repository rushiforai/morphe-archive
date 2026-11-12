.class public final Ln49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Lp5j;


# instance fields
.field public final a:Lcom/google/firebase/analytics/FirebaseAnalytics;

.field public final b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/google/firebase/analytics/FirebaseAnalytics;Lcom/opera/android/settings/SettingsManager;Lhjf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln49;->a:Lcom/google/firebase/analytics/FirebaseAnalytics;

    iput-object p2, p0, Ln49;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-interface {p3}, Lndc;->getLifecycle()Ltcc;

    move-result-object p3

    invoke-virtual {p3, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    const-string p0, "ga_usage_statistics"

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    iget-object p1, p1, Lcom/google/firebase/analytics/FirebaseAnalytics;->a:Lcom/google/android/gms/internal/measurement/zzez;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/measurement/zzez;->zzq(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "ga_usage_statistics"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Ln49;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iget-object p0, p0, Ln49;->a:Lcom/google/firebase/analytics/FirebaseAnalytics;

    iget-object p0, p0, Lcom/google/firebase/analytics/FirebaseAnalytics;->a:Lcom/google/android/gms/internal/measurement/zzez;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/measurement/zzez;->zzq(Ljava/lang/Boolean;)V

    :cond_19
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ln49;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
