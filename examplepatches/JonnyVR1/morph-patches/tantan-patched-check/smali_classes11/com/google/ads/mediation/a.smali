.class public final Lcom/google/ads/mediation/a;
.super Ll/b2n;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# instance fields
.field public final a:Lcom/google/ads/mediation/AbstractAdViewAdapter;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Ll/b8y;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/ads/mediation/AbstractAdViewAdapter;Ll/b8y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b2n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/ads/mediation/a;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/ads/mediation/a;->b:Ll/b8y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/jtv;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/ads/mediation/a;->b:Ll/b8y;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/ads/mediation/a;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Ll/b8y;->k(Lcom/google/android/gms/ads/mediation/MediationInterstitialAdapter;Ll/b70;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final bridge synthetic b(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/ads/mediation/a;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 2
    .line 3
    check-cast p1, Ll/a2n;

    .line 4
    .line 5
    iput-object p1, v0, Lcom/google/ads/mediation/AbstractAdViewAdapter;->mInterstitialAd:Ll/a2n;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/ads/mediation/a;->b:Ll/b8y;

    .line 8
    .line 9
    new-instance v2, Ll/d5u0;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1}, Ll/d5u0;-><init>(Lcom/google/ads/mediation/AbstractAdViewAdapter;Ll/b8y;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v2}, Ll/a2n;->c(Ll/gcj;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/google/ads/mediation/a;->b:Ll/b8y;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/google/ads/mediation/a;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/b8y;->m(Lcom/google/android/gms/ads/mediation/MediationInterstitialAdapter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
