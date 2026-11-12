.class public final Lcom/opera/android/browser/SafeBrowsingBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lvgi;

.field public static b:Ljava/util/ArrayDeque;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->b:Ljava/util/ArrayDeque;

    return-void
.end method

.method public static checkUrl(Ljava/lang/String;J)V
    .registers 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->b:Ljava/util/ArrayDeque;

    if-nez v0, :cond_33

    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    if-eqz v0, :cond_2e

    iget-boolean v1, v0, Lvgi;->g:Z

    if-nez v1, :cond_2e

    iget-object v1, v0, Lvgi;->e:Lcom/google/android/gms/safetynet/SafetyNetClient;

    iget-object v0, v0, Lvgi;->f:Ljava/lang/String;

    const/4 v2, 0x5

    const/16 v3, 0xf

    const/4 v4, 0x4

    filled-new-array {v4, v2, v3}, [I

    move-result-object v2

    invoke-virtual {v1, p0, v0, v2}, Lcom/google/android/gms/safetynet/SafetyNetClient;->lookupUri(Ljava/lang/String;Ljava/lang/String;[I)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lrh2;

    invoke-direct {v0, p1, p2}, Lrh2;-><init>(J)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lrh2;

    invoke-direct {v0, p1, p2}, Lrh2;-><init>(J)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_2e
    const/4 p0, 0x0

    invoke-static {p1, p2, p0, p0}, LJ/N;->MY0CkqZH(JZI)V

    return-void

    :cond_33
    new-instance v1, Lwgi;

    invoke-direct {v1, p0, p1, p2}, Lwgi;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static init()V
    .registers 0

    return-void
.end method

.method public static shutdown()V
    .registers 0

    return-void
.end method
