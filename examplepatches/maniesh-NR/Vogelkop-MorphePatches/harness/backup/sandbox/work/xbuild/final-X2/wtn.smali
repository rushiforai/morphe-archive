.class public final Lwtn;
.super Lvtn;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public c:J

.field public d:J

.field public e:Z

.field public final f:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwtn;->a:Ljava/lang/String;

    iput p2, p0, Lwtn;->b:I

    const-wide/high16 p1, -0x8000000000000000L

    iput-wide p1, p0, Lwtn;->c:J

    const-wide p1, 0x7fffffffffffffffL

    iput-wide p1, p0, Lwtn;->d:J

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwtn;->f:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lwtn;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final c()J
    .registers 6

    iget-object v0, p0, Lwtn;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lwtn;->b:I

    add-int/2addr v0, p0

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    int-to-long v3, v0

    add-long/2addr v3, v1

    return-wide v3
.end method

.method public final e()V
    .registers 2

    iget-boolean v0, p0, Lwtn;->e:Z

    if-eqz v0, :cond_7

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwtn;->e:Z

    :cond_7
    return-void
.end method

.method public final f(Lvtn;)V
    .registers 7

    move-object v0, p1

    check-cast v0, Lcom/opera/android/history/g;

    iget-object v1, v0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v1}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->b()J

    move-result-wide v1

    iget-wide v3, p0, Lwtn;->c:J

    cmp-long v3, v1, v3

    if-lez v3, :cond_11

    iput-wide v1, p0, Lwtn;->c:J

    :cond_11
    iget-wide v3, p0, Lwtn;->d:J

    cmp-long v3, v1, v3

    if-gez v3, :cond_19

    iput-wide v1, p0, Lwtn;->d:J

    :cond_19
    iput-object p0, v0, Lcom/opera/android/history/g;->f:Lwtn;

    iget-object p0, p0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
