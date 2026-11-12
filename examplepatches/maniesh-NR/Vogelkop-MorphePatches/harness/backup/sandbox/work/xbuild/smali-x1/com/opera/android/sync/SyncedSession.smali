.class public final Lcom/opera/android/sync/SyncedSession;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/Date;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/opera/android/sync/SyncedSession;->b:Ljava/lang/String;

    new-instance p1, Ljava/util/Date;

    invoke-direct {p1, p3, p4}, Ljava/util/Date;-><init>(J)V

    iput-object p1, p0, Lcom/opera/android/sync/SyncedSession;->c:Ljava/util/Date;

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;IJ)Lcom/opera/android/sync/SyncedSession;
    .registers 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance p2, Lcom/opera/android/sync/SyncedSession;

    invoke-direct {p2, p0, p1, p3, p4}, Lcom/opera/android/sync/SyncedSession;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    return-object p2
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lcom/opera/android/sync/SyncedSession;

    if-eqz v0, :cond_12

    check-cast p1, Lcom/opera/android/sync/SyncedSession;

    iget-object p1, p1, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
