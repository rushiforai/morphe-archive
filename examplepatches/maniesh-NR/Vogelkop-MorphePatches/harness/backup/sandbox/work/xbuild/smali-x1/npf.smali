.class public final Lnpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationBannerAd;


# instance fields
.field public final a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

.field public final b:Lqhf;

.field public c:Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;

.field public d:Lz13;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    iput-object p2, p0, Lnpf;->b:Lqhf;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lnpf;->b:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lnpf;->d:Lz13;

    return-object p0
.end method
