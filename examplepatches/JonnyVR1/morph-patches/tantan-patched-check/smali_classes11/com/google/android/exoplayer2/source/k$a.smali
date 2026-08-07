.class public Lcom/google/android/exoplayer2/source/k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0
    .param p1    # Ll/zde;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/k$a;->e(Ll/zde;)Lcom/google/android/exoplayer2/source/k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/upstream/c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/k$a;->f(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public e(Ll/zde;)Lcom/google/android/exoplayer2/source/k;
    .locals 0
    .param p1    # Ll/zde;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-object p0
.end method

.method public f(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/k;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/upstream/c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-object p0
.end method
