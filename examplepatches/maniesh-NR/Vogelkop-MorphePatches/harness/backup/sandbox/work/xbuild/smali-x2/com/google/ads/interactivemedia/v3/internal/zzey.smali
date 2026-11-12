.class public final synthetic Lcom/google/ads/interactivemedia/v3/internal/zzey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic a:Lcom/google/ads/interactivemedia/v3/internal/zzfa;


# direct methods
.method public synthetic constructor <init>(Lcom/google/ads/interactivemedia/v3/internal/zzfa;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzey;->a:Lcom/google/ads/interactivemedia/v3/internal/zzfa;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzey;->a:Lcom/google/ads/interactivemedia/v3/internal/zzfa;

    iget-object p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->c:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    return-object p0
.end method
