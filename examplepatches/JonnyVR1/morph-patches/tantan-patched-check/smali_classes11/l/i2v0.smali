.class public final Ll/i2v0;
.super Ll/d70;
.source "SourceFile"

# interfaces
.implements Ll/ntx0;
.implements Ll/yqw0;
.implements Ll/byv0;


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# instance fields
.field public final a:Lcom/google/ads/mediation/AbstractAdViewAdapter;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Ll/d8y;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/ads/mediation/AbstractAdViewAdapter;Ll/d8y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i2v0;->b:Ll/d8y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 0

    .line 1
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/d8y;->a(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b(Ll/mxj0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/j9r0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/j9r0;-><init>(Ll/mxj0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/i2v0;->b:Ll/d8y;

    .line 7
    .line 8
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 9
    .line 10
    invoke-interface {p1, p0, v0}, Ll/d8y;->j(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;Ll/nxj0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final i(Ll/cms0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Ll/d8y;->b(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;Ll/cms0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final k(Ll/cms0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/d8y;->n(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;Ll/cms0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onAdClicked()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/d8y;->l(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/d8y;->e(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final x(Ll/jtv;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Ll/d8y;->q(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;Ll/b70;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2v0;->b:Ll/d8y;

    .line 2
    .line 3
    iget-object p0, p0, Ll/i2v0;->a:Lcom/google/ads/mediation/AbstractAdViewAdapter;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/d8y;->h(Lcom/google/android/gms/ads/mediation/MediationNativeAdapter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
