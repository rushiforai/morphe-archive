.class public final Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$HistoryArrayBuilder;,
        Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;
    }
.end annotation


# direct methods
.method public static callHistoryCallback(Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/util/List<",
            "Lrqm;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static callVisitsCallback(Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/util/List<",
            "Lwan;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static getHistoryArrayBuilder(I)Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$HistoryArrayBuilder;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$HistoryArrayBuilder;

    invoke-direct {v0, p0}, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$HistoryArrayBuilder;-><init>(I)V

    return-object v0
.end method

.method public static getVisitArrayBuilder(I)Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;

    invoke-direct {v0, p0}, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;-><init>(I)V

    return-object v0
.end method
