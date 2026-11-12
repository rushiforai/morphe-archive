.class public final Lcom/opera/android/sync/SyncedSessionTab;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p3, p0, Lcom/opera/android/sync/SyncedSessionTab;->a:J

    iput-wide p5, p0, Lcom/opera/android/sync/SyncedSessionTab;->b:J

    new-instance p3, Ljava/util/Date;

    invoke-direct {p3, p7, p8}, Ljava/util/Date;-><init>(J)V

    iput-object p1, p0, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    iput-object p2, p0, Lcom/opera/android/sync/SyncedSessionTab;->d:Ljava/lang/String;

    iput-object p9, p0, Lcom/opera/android/sync/SyncedSessionTab;->e:Ljava/lang/String;

    return-void
.end method

.method public static create(JJLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/opera/android/sync/SyncedSessionTab;
    .registers 14
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    move-wide v0, p0

    move-object p1, p7

    move-wide v2, p2

    move-object p2, p8

    move-wide p3, v0

    move-wide p7, p5

    move-wide p5, v2

    new-instance p0, Lcom/opera/android/sync/SyncedSessionTab;

    invoke-direct/range {p0 .. p9}, Lcom/opera/android/sync/SyncedSessionTab;-><init>(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/opera/android/sync/SyncedSessionTab;

    if-eqz v0, :cond_18

    check-cast p1, Lcom/opera/android/sync/SyncedSessionTab;

    iget-wide v0, p1, Lcom/opera/android/sync/SyncedSessionTab;->a:J

    iget-wide v2, p0, Lcom/opera/android/sync/SyncedSessionTab;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    iget-wide v0, p1, Lcom/opera/android/sync/SyncedSessionTab;->b:J

    iget-wide p0, p0, Lcom/opera/android/sync/SyncedSessionTab;->b:J

    cmp-long p0, v0, p0

    if-nez p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-wide v0, p0, Lcom/opera/android/sync/SyncedSessionTab;->a:J

    long-to-int v0, v0

    iget-wide v1, p0, Lcom/opera/android/sync/SyncedSessionTab;->b:J

    long-to-int p0, v1

    add-int/2addr v0, p0

    return v0
.end method
