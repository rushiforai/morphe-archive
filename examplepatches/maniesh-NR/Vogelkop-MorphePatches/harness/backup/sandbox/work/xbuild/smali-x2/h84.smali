.class public final Lh84;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(IIIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lh84;->a:B

    iput-object p5, p0, Lh84;->b:Ljava/lang/String;

    iput p2, p0, Lh84;->c:I

    iput p3, p0, Lh84;->d:I

    iput p4, p0, Lh84;->e:I

    new-instance p1, Ljava/util/ArrayList;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lh84;->f:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final declared-synchronized a(I)Z
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1c

    const/16 v1, 0x100

    if-lt v0, v1, :cond_e

    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :cond_e
    :try_start_e
    iget-object v0, p0, Lh84;->f:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_17
    .catchall {:try_start_e .. :try_end_17} :catchall_1c

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :goto_1a
    :try_start_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1c

    throw p1

    :catchall_1c
    move-exception p1

    goto :goto_1a
.end method
