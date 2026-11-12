.class public final Lipm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:J

.field public final c:J

.field public d:Z

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(JJ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lipm;->a:Ljava/util/ArrayList;

    iput-wide p1, p0, Lipm;->b:J

    iput-wide p3, p0, Lipm;->c:J

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/ArrayList;
    .registers 13

    iget-object p0, p0, Lipm;->a:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    :cond_15
    :goto_15
    if-ge v4, v1, :cond_34

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long v8, v6, v2

    long-to-double v8, v8

    const-wide v10, 0x41124f8000000000L    # 300000.0

    cmpg-double v8, v8, v10

    if-ltz v8, :cond_15

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-wide v2, v6

    goto :goto_15

    :cond_34
    return-object v0
.end method

.method public final b()J
    .registers 3

    iget-boolean v0, p0, Lipm;->d:Z

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lipm;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lipm;->e:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lipm;->d:Z

    :cond_11
    iget p0, p0, Lipm;->e:I

    int-to-long v0, p0

    return-wide v0
.end method
