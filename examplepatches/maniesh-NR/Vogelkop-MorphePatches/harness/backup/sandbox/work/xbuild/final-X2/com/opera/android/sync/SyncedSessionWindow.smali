.class public final Lcom/opera/android/sync/SyncedSessionWindow;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/sync/SyncedSessionWindow;->a:Ljava/lang/String;

    iput-wide p2, p0, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    new-instance p0, Ljava/util/Date;

    invoke-direct {p0, p4, p5}, Ljava/util/Date;-><init>(J)V

    return-void
.end method

.method public static create(Ljava/lang/String;JIIJ)Lcom/opera/android/sync/SyncedSessionWindow;
    .registers 7
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    move-wide p2, p1

    move-object p1, p0

    new-instance p0, Lcom/opera/android/sync/SyncedSessionWindow;

    move-wide p4, p5

    invoke-direct/range {p0 .. p5}, Lcom/opera/android/sync/SyncedSessionWindow;-><init>(Ljava/lang/String;JJ)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lcom/opera/android/sync/SyncedSessionWindow;

    if-eqz v0, :cond_10

    check-cast p1, Lcom/opera/android/sync/SyncedSessionWindow;

    iget-wide v0, p1, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    iget-wide p0, p0, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    cmp-long p0, v0, p0

    if-nez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    long-to-int p0, v0

    return p0
.end method
