.class public abstract Lhnf;
.super Lcom/google/android/gms/ads/mediation/NativeAdMapper;
.source "SourceFile"


# instance fields
.field public final t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

.field public final u:Lqhf;

.field public v:Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

.field public w:Lbie;

.field public x:Lksd;

.field public y:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;-><init>()V

    iput-object p1, p0, Lhnf;->t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    iput-object p2, p0, Lhnf;->u:Lqhf;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lhnf;->u:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method

.method public final destroy()V
    .registers 3

    const-string v0, "destroy"

    invoke-virtual {p0, v0}, Lhnf;->a(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhnf;->y:Z

    iget-object v0, p0, Lhnf;->w:Lbie;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lbie;->d()V

    iput-object v1, p0, Lhnf;->w:Lbie;

    :cond_12
    iput-object v1, p0, Lhnf;->x:Lksd;

    iput-object v1, p0, Lhnf;->v:Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;

    return-void
.end method

.method public final trackViews(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;)V
    .registers 14

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "trackViews: containerView="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p3, p0, Lhnf;->w:Lbie;

    if-eqz p3, :cond_a0

    iget-object p3, p0, Lhnf;->x:Lksd;

    if-eqz p3, :cond_a0

    instance-of p3, p1, Landroid/widget/FrameLayout;

    if-nez p3, :cond_23

    const-string p1, "trackViews: Failed to track views, invalid container view type."

    invoke-virtual {p0, p1}, Lhnf;->a(Ljava/lang/String;)V

    return-void

    :cond_23
    const-string p3, "3001"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Landroid/view/View;

    const-string p3, "3004"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Landroid/view/View;

    const-string p3, "3002"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Landroid/view/View;

    const-string p3, "3003"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    instance-of v0, p3, Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_50

    check-cast p3, Landroid/widget/ImageView;

    move-object v5, p3

    move-object p3, v1

    goto :goto_52

    :cond_50
    move-object p3, v1

    move-object v5, p3

    :goto_52
    iget-object v1, p0, Lhnf;->x:Lksd;

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p2

    if-eqz p2, :cond_90

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {p2, v0}, Lkotlin/collections/CollectionsKt;->I(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    const/4 p2, 0x5

    new-array v6, p2, [Landroid/view/View;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    const/4 v8, 0x1

    aput-object v2, v6, v8

    const/4 v8, 0x2

    aput-object v3, v6, v8

    const/4 v8, 0x3

    aput-object v4, v6, v8

    const/4 v8, 0x4

    aput-object v5, v6, v8

    new-instance v8, Ljava/util/LinkedHashSet;

    invoke-direct {v8}, Ljava/util/LinkedHashSet;-><init>()V

    :goto_79
    if-ge v7, p2, :cond_85

    aget-object v9, v6, v7

    if-eqz v9, :cond_82

    invoke-interface {v8, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_82
    add-int/lit8 v7, v7, 0x1

    goto :goto_79

    :cond_85
    invoke-interface {v0, v8}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_90

    move-object v6, v0

    goto :goto_91

    :cond_90
    move-object v6, p3

    :goto_91
    new-instance v0, Ligi;

    const/16 v7, 0x1d

    invoke-direct/range {v0 .. v7}, Ligi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lhnf;->w:Lbie;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1, v0}, Lbie;->e(Landroid/widget/FrameLayout;Ligi;)V

    return-void

    :cond_a0
    const-string p1, "trackViews: Failed to track views, invalid native ad or media view."

    invoke-virtual {p0, p1}, Lhnf;->a(Ljava/lang/String;)V

    return-void
.end method

.method public final untrackView(Landroid/view/View;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "untrackView: view="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lhnf;->w:Lbie;

    if-eqz p0, :cond_18

    invoke-virtual {p0}, Lbie;->g()V

    :cond_18
    return-void
.end method
