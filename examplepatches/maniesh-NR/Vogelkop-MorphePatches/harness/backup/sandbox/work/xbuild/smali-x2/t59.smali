.class public Lt59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfqp;


# static fields
.field public static final d:Lt59;


# instance fields
.field public a:J

.field public b:J

.field public c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lt59;

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const-wide/16 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lt59;-><init>(JJLjava/lang/String;)V

    sput-object v0, Lt59;->d:Lt59;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 4

    packed-switch p1, :pswitch_data_1c

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 177
    iput-wide v0, p0, Lt59;->a:J

    .line 178
    iput-wide v0, p0, Lt59;->b:J

    return-void

    .line 179
    :pswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lt59;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x5
        :pswitch_10
    .end packed-switch
.end method

.method public constructor <init>(J)V
    .registers 7

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x64

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lt59;->c:Ljava/lang/Object;

    .line 170
    iput-wide p1, p0, Lt59;->a:J

    return-void
.end method

.method public constructor <init>(JJLjava/lang/String;)V
    .registers 6

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-wide p1, p0, Lt59;->a:J

    .line 173
    iput-wide p3, p0, Lt59;->b:J

    .line 174
    iput-object p5, p0, Lt59;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;JJ)V
    .registers 6

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt59;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lt59;->a:J

    iput-wide p4, p0, Lt59;->b:J

    return-void
.end method

.method public constructor <init>(Lp3a;I)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    iput-object v0, p0, Lt59;->c:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-interface {p1}, Lp3a;->d()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :cond_1a
    :goto_1a
    const-wide/16 v3, 0x0

    if-ltz v2, :cond_4e

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v5, p2, :cond_4e

    invoke-interface {p1, v2}, Lp3a;->f(I)Lta6;

    move-result-object v5

    invoke-virtual {v5, v1}, Lta6;->e(Ljava/util/GregorianCalendar;)Z

    move-result v6

    if-eqz v6, :cond_3d

    new-instance v1, Ljava/util/GregorianCalendar;

    iget v3, v5, Lta6;->a:I

    iget v4, v5, Lta6;->b:I

    iget v5, v5, Lta6;->c:I

    invoke-direct {v1, v3, v4, v5}, Ljava/util/GregorianCalendar;-><init>(III)V

    invoke-interface {p1, v2}, Lp3a;->e(I)J

    move-result-wide v3

    :cond_3d
    const/4 v5, 0x5

    const/4 v7, -0x1

    invoke-virtual {v1, v5, v7}, Ljava/util/Calendar;->add(II)V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v6, :cond_1a

    add-int/lit8 v2, v2, -0x1

    goto :goto_1a

    :cond_4e
    :goto_4e
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p1, p2, :cond_5c

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4e

    :cond_5c
    const/4 p1, 0x0

    move-wide v1, v3

    :goto_5e
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_92

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    sub-int/2addr p2, p1

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iget-object p2, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p2, Landroid/util/SparseLongArray;

    invoke-virtual {p2}, Landroid/util/SparseLongArray;->size()I

    move-result v7

    invoke-virtual {p2, v7, v5, v6}, Landroid/util/SparseLongArray;->append(IJ)V

    iget-object p2, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p2, Landroid/util/SparseLongArray;

    invoke-virtual {p2}, Landroid/util/SparseLongArray;->size()I

    move-result v7

    invoke-virtual {p2, v7, v5, v6}, Landroid/util/SparseLongArray;->append(IJ)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_5e

    :cond_92
    iget-object p1, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p1, Landroid/util/SparseLongArray;

    invoke-virtual {p1}, Landroid/util/SparseLongArray;->size()I

    move-result p1

    int-to-long p1, p1

    const-wide/16 v5, 0x1

    sub-long/2addr p1, v5

    iput-wide p1, p0, Lt59;->a:J

    cmp-long p1, v1, v3

    if-nez p1, :cond_a5

    move-wide v1, v5

    :cond_a5
    iput-wide v1, p0, Lt59;->b:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Lw05;

    iget-wide v1, p0, Lt59;->b:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_1a

    iget-wide v3, p0, Lt59;->a:J

    long-to-double v3, v3

    long-to-double v1, v1

    div-double/2addr v3, v1

    const-wide/16 v1, 0x0

    cmpg-double p0, v3, v1

    if-gez p0, :cond_18

    move-wide v3, v1

    :cond_18
    double-to-float p0, v3

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    iget v1, v0, Lw05;->c:F

    cmpg-float v1, p0, v1

    if-nez v1, :cond_22

    return-void

    :cond_22
    iput p0, v0, Lw05;->c:F

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final b([Ljava/security/MessageDigest;JI)V
    .registers 13

    iget-wide v0, p0, Lt59;->a:J

    add-long v4, v0, p2

    int-to-long v6, p4

    iget-object p0, p0, Lt59;->c:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/nio/channels/FileChannel;

    sget-object v3, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/MappedByteBuffer;->load()Ljava/nio/MappedByteBuffer;

    const/4 p2, 0x0

    move p3, p2

    :goto_15
    array-length p4, p1

    if-ge p3, p4, :cond_23

    aget-object p4, p1, p3

    invoke-virtual {p0, p2}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p4, p0}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_15

    :cond_23
    return-void
.end method

.method public final c()V
    .registers 6

    iget-object p0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p0, Lw05;

    const/4 v0, 0x6

    new-array v1, v0, [I

    fill-array-data v1, :array_30

    new-array v0, v0, [F

    fill-array-data v0, :array_40

    iget-object v2, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v2, Lv05;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, v4, v1, v0, v3}, Lv05;->a(Lv05;Landroid/graphics/Rect;[I[FI)Lv05;

    move-result-object v0

    iget-object v1, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v1, Lv05;

    invoke-virtual {v0, v1}, Lv05;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    return-void

    :cond_24
    iput-object v0, p0, Lw05;->e:Ljava/lang/Object;

    iget-object v0, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    nop

    :array_30
    .array-data 4
        -0x68ed01
        -0xb79a01
        -0x700601
        -0x68ed01
        -0x7faf
        -0x68ed01
    .end array-data

    :array_40
    .array-data 4
        0x0
        0x3e23d70a    # 0.16f
        0x3ebd70a4    # 0.37f
        0x3f0ccccd    # 0.55f
        0x3f3851ec    # 0.72f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final d(Lcom/opera/android/widget/GraphView;)V
    .registers 11

    iget-wide v0, p0, Lt59;->a:J

    long-to-float v0, v0

    iget-wide v1, p0, Lt59;->b:J

    long-to-float v1, v1

    iput v0, p1, Lcom/opera/android/widget/GraphView;->j:F

    iput v1, p1, Lcom/opera/android/widget/GraphView;->k:F

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/opera/android/widget/GraphView;->l:Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseLongArray;

    iget-object v1, p1, Lcom/opera/android/widget/GraphView;->f:Landroid/util/SparseLongArray;

    invoke-virtual {v1}, Landroid/util/SparseLongArray;->clear()V

    const/4 v2, -0x1

    iput v2, p1, Lcom/opera/android/widget/GraphView;->o:I

    invoke-virtual {p0}, Landroid/util/SparseLongArray;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_21
    if-ge v4, v3, :cond_41

    invoke-virtual {p0, v4}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v5

    invoke-virtual {p0, v4}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v6

    invoke-virtual {v1, v5, v6, v7}, Landroid/util/SparseLongArray;->put(IJ)V

    iget v5, p1, Lcom/opera/android/widget/GraphView;->o:I

    if-ne v5, v2, :cond_3e

    invoke-virtual {p0, v4}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_3e

    iput v4, p1, Lcom/opera/android/widget/GraphView;->o:I

    :cond_3e
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    :cond_41
    iput-boolean v0, p1, Lcom/opera/android/widget/GraphView;->l:Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final declared-synchronized e(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_d

    monitor-exit p0

    return-object p1

    :goto_b
    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_d

    throw p1

    :catchall_d
    move-exception p1

    goto :goto_b
.end method

.method public f(Ljava/lang/Object;)I
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final g()V
    .registers 6

    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :cond_9
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgz4;

    iget-wide v2, p0, Lt59;->b:J

    iget-object v0, v0, Lgz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_1f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Liz4;

    invoke-virtual {v4, v2, v3}, Liz4;->f(J)V

    goto :goto_1f

    :cond_2f
    return-void
.end method

.method public final h()V
    .registers 6

    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :cond_9
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgz4;

    iget-wide v2, p0, Lt59;->a:J

    iget-object v0, v0, Lgz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_1f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Liz4;

    invoke-virtual {v4, v2, v3}, Liz4;->D(J)V

    goto :goto_1f

    :cond_2f
    return-void
.end method

.method public i(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    return-void
.end method

.method public final declared-synchronized j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p2}, Lt59;->f(Ljava/lang/Object;)I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lt59;->a:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_12

    invoke-virtual {p0, p1, p2}, Lt59;->i(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_3f

    monitor-exit p0

    const/4 p0, 0x0

    return-object p0

    :cond_12
    if-eqz p2, :cond_19

    :try_start_14
    iget-wide v2, p0, Lt59;->b:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lt59;->b:J

    :cond_19
    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_36

    iget-wide v1, p0, Lt59;->b:J

    invoke-virtual {p0, v0}, Lt59;->f(Ljava/lang/Object;)I

    move-result v3

    int-to-long v3, v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lt59;->b:J

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_36

    invoke-virtual {p0, p1, v0}, Lt59;->i(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_36
    iget-wide p1, p0, Lt59;->a:J

    invoke-virtual {p0, p1, p2}, Lt59;->l(J)V
    :try_end_3b
    .catchall {:try_start_14 .. :try_end_3b} :catchall_3f

    monitor-exit p0

    return-object v0

    :goto_3d
    :try_start_3d
    monitor-exit p0
    :try_end_3e
    .catchall {:try_start_3d .. :try_end_3e} :catchall_3f

    throw p1

    :catchall_3f
    move-exception p1

    goto :goto_3d
.end method

.method public final k(Ljava/lang/Exception;)V
    .registers 9

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Exception;

    if-nez v2, :cond_c

    iput-object p1, p0, Lt59;->c:Ljava/lang/Object;

    :cond_c
    iget-wide v2, p0, Lt59;->a:J

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v2, v4

    if-nez v2, :cond_24

    sget-object v2, Lll6;->c0:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-gtz v2, :cond_24

    const-wide/16 v2, 0xc8

    add-long/2addr v2, v0

    iput-wide v2, p0, Lt59;->a:J

    :cond_24
    iget-wide v2, p0, Lt59;->a:J

    cmp-long v6, v2, v4

    if-eqz v6, :cond_43

    cmp-long v2, v0, v2

    if-ltz v2, :cond_43

    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    if-eq v0, p1, :cond_37

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_37
    iget-object p1, p0, Lt59;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Exception;

    const/4 v0, 0x0

    iput-object v0, p0, Lt59;->c:Ljava/lang/Object;

    iput-wide v4, p0, Lt59;->a:J

    iput-wide v4, p0, Lt59;->b:J

    throw p1

    :cond_43
    const-wide/16 v2, 0x32

    add-long/2addr v0, v2

    iput-wide v0, p0, Lt59;->b:J

    return-void
.end method

.method public final declared-synchronized l(J)V
    .registers 10

    monitor-enter p0

    :goto_1
    :try_start_1
    iget-wide v0, p0, Lt59;->b:J

    cmp-long v0, v0, p1

    if-lez v0, :cond_32

    iget-object v0, p0, Lt59;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    iget-wide v3, p0, Lt59;->b:J

    invoke-virtual {p0, v2}, Lt59;->f(Ljava/lang/Object;)I

    move-result v5

    int-to-long v5, v5

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lt59;->b:J

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    invoke-virtual {p0, v1, v2}, Lt59;->i(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_36

    goto :goto_1

    :cond_32
    monitor-exit p0

    return-void

    :goto_34
    :try_start_34
    monitor-exit p0
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_36

    throw p1

    :catchall_36
    move-exception p1

    goto :goto_34
.end method

.method public final zza()J
    .registers 3

    iget-wide v0, p0, Lt59;->b:J

    return-wide v0
.end method
