.class public abstract Lcom/opera/android/suggestion/SuggestionProviderBridge;
.super Llt8;
.source "SourceFile"


# instance fields
.field public final c:B


# direct methods
.method public constructor <init>(I)V
    .registers 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Llt8;-><init>(B)V

    invoke-static {p0}, LJ/N;->M8wB29Rt(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Llt8;->e(J)V

    iput-byte p1, p0, Lcom/opera/android/suggestion/SuggestionProviderBridge;->c:B

    return-void
.end method

.method public static getDataObj(Lcom/opera/android/suggestion/Suggestion;)Ljava/lang/Object;
    .registers 1
    .param p0    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    return-object p0
.end method

.method public static getRelevance(Lcom/opera/android/suggestion/Suggestion;)I
    .registers 1
    .param p0    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget p0, p0, Lcom/opera/android/suggestion/Suggestion;->g:I

    return p0
.end method

.method public static getSize(Ljava/util/List;)I
    .registers 1
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/opera/android/suggestion/Suggestion;",
            ">;)I"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public static getSuggestion(Ljava/util/List;I)Lcom/opera/android/suggestion/Suggestion;
    .registers 2
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/opera/android/suggestion/Suggestion;",
            ">;I)",
            "Lcom/opera/android/suggestion/Suggestion;"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/suggestion/Suggestion;

    return-object p0
.end method

.method public static getTitle(Lcom/opera/android/suggestion/Suggestion;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static getType(Lcom/opera/android/suggestion/Suggestion;)I
    .registers 1
    .param p0    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget p0, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    return p0
.end method

.method public static getUrl(Lcom/opera/android/suggestion/Suggestion;)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_8

    const-string p0, ""

    :cond_8
    return-object p0
.end method


# virtual methods
.method public abstract cancel()V
.end method

.method public final clearCache()V
    .registers 1

    return-void
.end method

.method public final d()Ljava/lang/Object;
    .registers 1

    return-object p0
.end method

.method public abstract g(Ljava/lang/String;ZZLyv4;)V
.end method

.method public final query(Ljava/lang/String;ZZJ)V
    .registers 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lyv4;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p4, p5, v1}, Lyv4;-><init>(Ljava/lang/Object;JB)V

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;->g(Ljava/lang/String;ZZLyv4;)V

    return-void
.end method
