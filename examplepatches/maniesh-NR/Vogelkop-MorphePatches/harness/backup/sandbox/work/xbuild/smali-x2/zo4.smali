.class public final Lzo4;
.super Lg83;
.source "SourceFile"


# static fields
.field public static final O:Ljyl;

.field public static final P:[J

.field public static final Q:[Lkuh;

.field public static final R:Lcig;


# instance fields
.field public A:F

.field public B:F

.field public C:Z

.field public D:Z

.field public E:J

.field public F:Lqjd;

.field public G:Ljyl;

.field public H:Lfyl;

.field public I:Lfzl;

.field public J:Lcig;

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:Ljij;

.field public final c:Lwth;

.field public final d:Lto4;

.field public final e:Luo4;

.field public final f:Lvo4;

.field public final g:Lxmf;

.field public final h:Ljx6;

.field public final i:Landroid/os/Handler;

.field public final j:Lijc;

.field public final k:Ljava/util/ArrayList;

.field public l:[I

.field public final m:Landroid/util/SparseArray;

.field public final n:Ljava/util/ArrayDeque;

.field public final o:S

.field public final p:S

.field public q:Lwo4;

.field public r:I

.field public s:J

.field public t:Lrb3;

.field public u:Lcom/google/android/gms/cast/framework/SessionManager;

.field public v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

.field public w:B

.field public x:Lzh8;

.field public y:I

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ljyl;

    const/4 v1, 0x0

    filled-new-array {v1, v1, v1}, [Lbj8;

    move-result-object v1

    invoke-direct {v0, v1}, Ljyl;-><init>([Lbj8;)V

    sput-object v0, Lzo4;->O:Ljyl;

    const/4 v0, 0x0

    new-array v1, v0, [J

    sput-object v1, Lzo4;->P:[J

    const/4 v1, 0x3

    new-array v1, v1, [Lkuh;

    sput-object v1, Lzo4;->Q:[Lkuh;

    new-instance v2, Ln9a;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Ln9a;-><init>(B)V

    aput-object v2, v1, v0

    new-instance v2, Ly55;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-instance v2, Lqs7;

    invoke-direct {v2, v3}, Lqs7;-><init>(B)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    const/16 v2, 0xc

    new-array v2, v2, [I

    fill-array-data v2, :array_5e

    array-length v3, v2

    move v5, v0

    :goto_3d
    if-ge v5, v3, :cond_4c

    aget v6, v2, v5

    const/4 v7, 0x0

    xor-int/2addr v7, v4

    invoke-static {v7}, Lz4o;->H(Z)V

    invoke-virtual {v1, v6, v4}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_3d

    :cond_4c
    new-instance v2, Lcig;

    xor-int/2addr v0, v4

    invoke-static {v0}, Lz4o;->H(Z)V

    new-instance v0, Lw69;

    invoke-direct {v0, v1}, Lw69;-><init>(Landroid/util/SparseBooleanArray;)V

    invoke-direct {v2, v0}, Lcig;-><init>(Lw69;)V

    sput-object v2, Lzo4;->R:Lcig;

    return-void

    nop

    :array_5e
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0xa
        0xf
        0xd
        0x10
        0x11
        0x12
        0x14
        0x1e
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/cast/framework/CastContext;Lxmf;Ljx6;)V
    .registers 16

    invoke-direct {p0}, Lg83;-><init>()V

    new-instance v0, Lwth;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lzo4;->c:Lwth;

    new-instance v1, Lto4;

    invoke-direct {v1, p0}, Lto4;-><init>(Lzo4;)V

    iput-object v1, p0, Lzo4;->d:Lto4;

    new-instance v1, Luo4;

    invoke-direct {v1, p0}, Luo4;-><init>(Lzo4;)V

    iput-object v1, p0, Lzo4;->e:Luo4;

    new-instance v1, Lvo4;

    invoke-direct {v1, p0}, Lvo4;-><init>(Lzo4;)V

    iput-object v1, p0, Lzo4;->f:Lvo4;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lzo4;->k:Ljava/util/ArrayList;

    const/4 v2, 0x0

    new-array v3, v2, [I

    iput-object v3, p0, Lzo4;->l:[I

    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    iput-object v3, p0, Lzo4;->m:Landroid/util/SparseArray;

    new-instance v3, Ljava/util/ArrayDeque;

    invoke-direct {v3}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v3, p0, Lzo4;->n:Ljava/util/ArrayDeque;

    sget-object v3, Lrb3;->g:Lrb3;

    iput-object v3, p0, Lzo4;->t:Lrb3;

    const/4 v3, 0x1

    iput-byte v3, p0, Lzo4;->w:B

    iput v2, p0, Lzo4;->y:I

    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, p0, Lzo4;->z:F

    iput v4, p0, Lzo4;->A:F

    iput v4, p0, Lzo4;->B:F

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v4, p0, Lzo4;->E:J

    sget-object v6, Lzo4;->O:Ljyl;

    iput-object v6, p0, Lzo4;->G:Ljyl;

    sget-object v6, Lfyl;->d:Lfyl;

    iput-object v6, p0, Lzo4;->H:Lfyl;

    sget-object v6, Lfzl;->b:Lfzl;

    iput-object v6, p0, Lzo4;->I:Lfzl;

    new-instance v6, Landroid/util/SparseBooleanArray;

    invoke-direct {v6}, Landroid/util/SparseBooleanArray;-><init>()V

    sget-object v7, Lzo4;->R:Lcig;

    iget-object v7, v7, Lcig;->a:Lw69;

    move v8, v2

    :goto_69
    iget-object v9, v7, Lw69;->a:Landroid/util/SparseBooleanArray;

    invoke-virtual {v9}, Landroid/util/SparseBooleanArray;->size()I

    move-result v9

    if-ge v8, v9, :cond_80

    invoke-virtual {v7, v8}, Lw69;->b(I)I

    move-result v9

    const/4 v10, 0x0

    xor-int/2addr v10, v3

    invoke-static {v10}, Lz4o;->H(Z)V

    invoke-virtual {v6, v9, v3}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_69

    :cond_80
    new-instance v7, Lcig;

    const/4 v8, 0x0

    xor-int/2addr v8, v3

    invoke-static {v8}, Lz4o;->H(Z)V

    new-instance v8, Lw69;

    invoke-direct {v8, v6}, Lw69;-><init>(Landroid/util/SparseBooleanArray;)V

    invoke-direct {v7, v8}, Lcig;-><init>(Lw69;)V

    iput-object v7, p0, Lzo4;->J:Lcig;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v6

    if-nez v6, :cond_9d

    iget-object v6, p0, Lzo4;->i:Landroid/os/Handler;

    invoke-virtual {v6}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v6

    :cond_9d
    new-instance v7, Landroid/os/Handler;

    invoke-direct {v7, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v7, p0, Lzo4;->i:Landroid/os/Handler;

    new-instance v7, Lijc;

    new-instance v8, Lt14;

    invoke-direct {v8, p0}, Lt14;-><init>(Lzo4;)V

    invoke-direct {v7, v6, v8}, Lijc;-><init>(Landroid/os/Looper;Lgjc;)V

    iput-object v7, p0, Lzo4;->j:Lijc;

    new-instance v6, Lhij;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v6, v1}, Lhij;-><init>(I)V

    iput-object v6, p0, Lzo4;->N:Ljij;

    invoke-virtual {p2}, Lcom/google/android/gms/cast/framework/CastContext;->getSessionManager()Lcom/google/android/gms/cast/framework/SessionManager;

    move-result-object p2

    iput-object p2, p0, Lzo4;->u:Lcom/google/android/gms/cast/framework/SessionManager;

    iput-object p3, p0, Lzo4;->g:Lxmf;

    iput-object p4, p0, Lzo4;->h:Ljx6;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    if-nez p1, :cond_cd

    const/4 p1, 0x0

    goto :goto_d1

    :cond_cd
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :goto_d1
    new-instance p3, Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-direct {p3, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-wide/32 v4, 0xf4240

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p3, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lpl6;

    invoke-direct {p2, p1, p3}, Lpl6;-><init>(Landroid/content/Context;Ljava/util/HashMap;)V

    new-instance p1, Lko4;

    invoke-direct {p1, p0}, Lko4;-><init>(Lzo4;)V

    iget-object p3, p4, Ljx6;->a:Loyl;

    if-nez p3, :cond_12f

    move v2, v3

    :cond_12f
    invoke-static {v2}, Lz4o;->H(Z)V

    iput-object p1, p4, Ljx6;->a:Loyl;

    iput-object p2, p4, Ljx6;->b:Lpl6;

    const/16 p1, 0x2710

    iput-short p1, p0, Lzo4;->o:S

    const/16 p1, 0x7530

    iput-short p1, p0, Lzo4;->p:S

    iget-object p1, p0, Lzo4;->u:Lcom/google/android/gms/cast/framework/SessionManager;

    const-class p2, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/cast/framework/SessionManager;->addSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    iget-object p1, p0, Lzo4;->u:Lcom/google/android/gms/cast/framework/SessionManager;

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/SessionManager;->getCurrentCastSession()Lcom/google/android/gms/cast/framework/CastSession;

    move-result-object p1

    if-eqz p1, :cond_154

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/CastSession;->getRemoteMediaClient()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    :cond_154
    return-void
.end method

.method public static A0(II)[I
    .registers 5

    sub-int/2addr p1, p0

    new-array v0, p1, [I

    const/4 v1, 0x0

    :goto_4
    if-ge v1, p1, :cond_d

    add-int v2, p0, v1

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_d
    return-object v0
.end method

.method public static B0(IILjij;)[I
    .registers 9

    invoke-interface {p2}, Ljij;->getFirstIndex()I

    move-result v0

    sub-int v1, p1, p0

    new-array v2, v1, [I

    const/4 v3, 0x0

    move v4, v3

    :goto_a
    if-ge v3, v1, :cond_27

    invoke-interface {p2}, Ljij;->getLength()I

    move-result v5

    if-ge v4, v5, :cond_22

    if-lt v0, p0, :cond_1b

    if-ge v0, p1, :cond_1b

    add-int/lit8 v5, v3, 0x1

    aput v0, v2, v3

    move v3, v5

    :cond_1b
    invoke-interface {p2, v0}, Ljij;->getNextIndex(I)I

    move-result v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_22
    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    return-object p0

    :cond_27
    return-object v2
.end method


# virtual methods
.method public final A(Lpf2;Z)V
    .registers 3

    return-void
.end method

.method public final B(Lvjd;)V
    .registers 2

    return-void
.end method

.method public final C0(Lcom/google/android/gms/cast/MediaError;)V
    .registers 5

    invoke-virtual {p1}, Lcom/google/android/gms/cast/MediaError;->getReason()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_a

    const-string v0, ""

    :cond_a
    invoke-virtual {p1}, Lcom/google/android/gms/cast/MediaError;->getDetailedErrorCode()Ljava/lang/Integer;

    move-result-object p1

    const/16 v1, 0x3e8

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v2, 0x66

    if-eq p1, v2, :cond_28

    const/16 v2, 0x68

    if-eq p1, v2, :cond_28

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p1}, Lzh8;->h(ILjava/lang/RuntimeException;)Lzh8;

    move-result-object p1

    goto :goto_40

    :cond_28
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance v0, Lzh8;

    const/4 v1, 0x0

    const/16 v2, 0xfa3

    invoke-direct {v0, v1, p1, v2}, Lzh8;-><init>(ILjava/lang/Exception;I)V

    move-object p1, v0

    goto :goto_40

    :cond_37
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p1}, Lzh8;->h(ILjava/lang/RuntimeException;)Lzh8;

    move-result-object p1

    :goto_40
    iput-object p1, p0, Lzo4;->x:Lzh8;

    new-instance v0, Ljl4;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p0, Lzo4;->j:Lijc;

    const/16 v1, 0xa

    invoke-virtual {p1, v1, v0}, Lijc;->d(ILfjc;)V

    invoke-virtual {p0}, Lzo4;->stop()V

    return-void
.end method

.method public final D(Z)V
    .registers 2

    return-void
.end method

.method public final D0(ILxo4;)V
    .registers 5

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lzo4;->q:Lwo4;

    if-nez v1, :cond_20

    invoke-interface {p2, v0}, Lxo4;->m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p2

    if-nez p2, :cond_10

    return-void

    :cond_10
    new-instance v0, Lwo4;

    invoke-direct {v0, p1, p2}, Lwo4;-><init>(ILcom/google/android/gms/common/api/PendingResult;)V

    iput-object v0, p0, Lzo4;->q:Lwo4;

    new-instance p1, Lpo4;

    invoke-direct {p1, p0}, Lpo4;-><init>(Lzo4;)V

    invoke-virtual {p2, p1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    return-void

    :cond_20
    const/4 v0, 0x1

    iget-object p0, p0, Lzo4;->n:Ljava/util/ArrayDeque;

    if-eq p1, v0, :cond_48

    const/4 v0, 0x2

    if-eq p1, v0, :cond_48

    const/4 v0, 0x3

    if-eq p1, v0, :cond_48

    const/4 v0, 0x4

    if-eq p1, v0, :cond_48

    packed-switch p1, :pswitch_data_52

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_35
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyo4;

    iget-byte v1, v1, Lyo4;->a:B

    if-ne v1, p1, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    :cond_48
    :pswitch_48
    new-instance v0, Lyo4;

    invoke-direct {v0, p1, p2}, Lyo4;-><init>(ILxo4;)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x1f
        :pswitch_48
        :pswitch_48
        :pswitch_48
    .end packed-switch
.end method

.method public final E0([I[I)V
    .registers 5

    invoke-static {p1, p2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v0, :cond_1b

    array-length v0, p1

    array-length v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-eqz v0, :cond_1b

    new-instance v1, Lqo4;

    invoke-direct {v1, p0, v0, p1, p2}, Lqo4;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1, v1}, Lzo4;->D0(ILxo4;)V

    :cond_1b
    return-void
.end method

.method public final F0(IZ)V
    .registers 6

    iget-byte v0, p0, Lzo4;->w:B

    if-eq v0, p1, :cond_32

    iput-byte p1, p0, Lzo4;->w:B

    const/4 v0, 0x1

    if-eq p1, v0, :cond_e

    if-eqz p2, :cond_e

    const/4 v0, 0x0

    iput-object v0, p0, Lzo4;->x:Lzh8;

    :cond_e
    new-instance v0, Lho4;

    invoke-direct {v0, p1}, Lho4;-><init>(I)V

    iget-object p1, p0, Lzo4;->j:Lijc;

    const/4 v1, 0x4

    invoke-virtual {p1, v1, v0}, Lijc;->d(ILfjc;)V

    invoke-virtual {p0}, Lg83;->e0()Z

    move-result v0

    iget-boolean v1, p0, Lzo4;->D:Z

    if-eq v1, v0, :cond_2d

    iput-boolean v0, p0, Lzo4;->D:Z

    new-instance v1, Lgo4;

    const/4 v2, 0x2

    invoke-direct {v1, v2, v0}, Lgo4;-><init>(BZ)V

    const/4 v0, 0x7

    invoke-virtual {p1, v0, v1}, Lijc;->d(ILfjc;)V

    :cond_2d
    if-nez p2, :cond_32

    invoke-virtual {p0}, Lzo4;->I0()V

    :cond_32
    return-void
.end method

.method public final G()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V
    .registers 6

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lzo4;->f:Lvo4;

    iget-object v2, p0, Lzo4;->d:Lto4;

    iget-object v3, p0, Lzo4;->e:Luo4;

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaQueue()Lcom/google/android/gms/cast/framework/media/MediaQueue;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/cast/framework/media/MediaQueue;->unregisterCallback(Lcom/google/android/gms/cast/framework/media/MediaQueue$Callback;)V

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->unregisterCallback(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$Callback;)V

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->removeProgressListener(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$ProgressListener;)V

    iget-object v0, p0, Lzo4;->q:Lwo4;

    if-eqz v0, :cond_2a

    iget-object v0, v0, Lwo4;->b:Lcom/google/android/gms/common/api/PendingResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/PendingResult;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lzo4;->q:Lwo4;

    :cond_2a
    iget-object v0, p0, Lzo4;->n:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    :cond_2f
    iput-object p1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz p1, :cond_57

    invoke-virtual {p1, v2}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->registerCallback(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$Callback;)V

    iget-object p1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaQueue()Lcom/google/android/gms/cast/framework/media/MediaQueue;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/google/android/gms/cast/framework/media/MediaQueue;->registerCallback(Lcom/google/android/gms/cast/framework/media/MediaQueue$Callback;)V

    iget-object p1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    const-wide/16 v2, 0x1f4

    invoke-virtual {p1, v1, v2, v3}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->addProgressListener(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$ProgressListener;J)Z

    invoke-virtual {p0}, Lzo4;->H0()V

    iget p1, p0, Lzo4;->A:F

    new-instance v0, Lio4;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lio4;-><init>(FB)V

    const/16 p1, 0x17

    invoke-virtual {p0, p1, v0}, Lzo4;->D0(ILxo4;)V

    return-void

    :cond_57
    invoke-virtual {p0}, Lzo4;->stop()V

    return-void
.end method

.method public final H0()V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v1, :cond_95

    iget-object v1, v0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_95

    invoke-virtual {v0, v1}, Lzo4;->K0(Ljava/util/List;)[Lcom/google/android/gms/cast/MediaQueueItem;

    move-result-object v1

    iget v2, v0, Lzo4;->y:I

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v5, :cond_1f

    if-eq v2, v3, :cond_1d

    move v8, v4

    goto :goto_20

    :cond_1d
    move v8, v5

    goto :goto_20

    :cond_1f
    move v8, v3

    :goto_20
    iget v13, v0, Lzo4;->z:F

    iget-boolean v2, v0, Lzo4;->C:Z

    const/4 v14, 0x3

    if-eqz v2, :cond_2f

    iget-byte v2, v0, Lzo4;->w:B

    if-eq v2, v14, :cond_2d

    if-ne v2, v3, :cond_2f

    :cond_2d
    move v12, v5

    goto :goto_30

    :cond_2f
    move v12, v4

    :goto_30
    iget v2, v0, Lzo4;->r:I

    array-length v6, v1

    const-wide/16 v15, 0x0

    if-ge v2, v6, :cond_3b

    iget-wide v6, v0, Lzo4;->s:J

    move-wide v10, v6

    goto :goto_3d

    :cond_3b
    array-length v2, v1

    move-wide v10, v15

    :goto_3d
    if-eqz v12, :cond_42

    invoke-virtual {v0, v3, v5}, Lzo4;->F0(IZ)V

    :cond_42
    iget-boolean v3, v0, Lzo4;->M:Z

    if-eqz v3, :cond_6d

    new-instance v3, Ljava/util/ArrayList;

    array-length v6, v1

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v6, v0, Lzo4;->N:Ljij;

    invoke-interface {v6}, Ljij;->getFirstIndex()I

    move-result v6

    move v7, v4

    :goto_53
    array-length v9, v1

    if-ge v7, v9, :cond_64

    aget-object v9, v1, v6

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v9, v0, Lzo4;->N:Ljij;

    invoke-interface {v9, v6}, Ljij;->getNextIndex(I)I

    move-result v6

    add-int/lit8 v7, v7, 0x1

    goto :goto_53

    :cond_64
    aget-object v1, v1, v2

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    :goto_6a
    move v9, v2

    move-object v7, v3

    goto :goto_72

    :cond_6d
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_6a

    :goto_72
    new-instance v6, Lro4;

    invoke-direct/range {v6 .. v13}, Lro4;-><init>(Ljava/util/List;IIJZF)V

    invoke-virtual {v0, v14, v6}, Lzo4;->D0(ILxo4;)V

    if-nez v12, :cond_95

    cmp-long v1, v10, v15

    if-lez v1, :cond_95

    new-instance v1, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;-><init>()V

    invoke-virtual {v1, v10, v11}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;->setPosition(J)Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    invoke-virtual {v1, v4}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;->setResumeState(I)Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    new-instance v2, Llo4;

    invoke-direct {v2, v1, v5}, Llo4;-><init>(Lcom/google/android/gms/cast/MediaSeekOptions$Builder;B)V

    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Lzo4;->D0(ILxo4;)V

    :cond_95
    return-void
.end method

.method public final I()Landroid/os/Looper;
    .registers 1

    iget-object p0, p0, Lzo4;->i:Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p0

    return-object p0
.end method

.method public final I0()V
    .registers 4

    iget-byte v0, p0, Lzo4;->w:B

    const/4 v1, 0x1

    const/16 v2, 0x1f

    if-eq v0, v1, :cond_2a

    const/4 v1, 0x2

    if-eq v0, v1, :cond_e

    const/4 v1, 0x3

    if-eq v0, v1, :cond_e

    return-void

    :cond_e
    iget-boolean v0, p0, Lzo4;->C:Z

    if-eqz v0, :cond_1f

    new-instance v0, Lt14;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    const/16 v1, 0x21

    invoke-virtual {p0, v1, v0}, Lzo4;->D0(ILxo4;)V

    return-void

    :cond_1f
    new-instance v0, Lt14;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    invoke-virtual {p0, v2, v0}, Lzo4;->D0(ILxo4;)V

    return-void

    :cond_2a
    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3f

    new-instance v0, Lt14;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    const/16 v1, 0x20

    invoke-virtual {p0, v1, v0}, Lzo4;->D0(ILxo4;)V

    return-void

    :cond_3f
    new-instance v0, Lt14;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    invoke-virtual {p0, v2, v0}, Lzo4;->D0(ILxo4;)V

    return-void
.end method

.method public final J()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lzo4;->setVolume(F)V

    return-void
.end method

.method public final J0(Ljyl;Ljava/util/List;)V
    .registers 11

    iget v0, p1, Ljyl;->a:I

    new-array v1, v0, [J

    const/4 v2, 0x0

    move v3, v2

    :goto_6
    if-ge v2, v0, :cond_2d

    iget-object v4, p1, Ljyl;->b:[Lbj8;

    aget-object v4, v4, v2

    if-eqz v4, :cond_2a

    iget-object v5, p0, Lzo4;->H:Lfyl;

    invoke-interface {v4}, Lbj8;->getTrackGroup()Leyl;

    move-result-object v4

    invoke-virtual {v5, v4}, Lfyl;->b(Leyl;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2a

    add-int/lit8 v5, v3, 0x1

    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/cast/MediaTrack;

    invoke-virtual {v4}, Lcom/google/android/gms/cast/MediaTrack;->getId()J

    move-result-wide v6

    aput-wide v6, v1, v3

    move v3, v5

    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_2d
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p1

    new-instance p2, Ljl4;

    const/4 v0, 0x5

    invoke-direct {p2, p1, v0}, Ljl4;-><init>(Ljava/lang/Object;B)V

    const/16 p1, 0x28

    invoke-virtual {p0, p1, p2}, Lzo4;->D0(ILxo4;)V

    return-void
.end method

.method public final K()V
    .registers 1

    return-void
.end method

.method public final K0(Ljava/util/List;)[Lcom/google/android/gms/cast/MediaQueueItem;
    .registers 18

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/cast/MediaQueueItem;

    const/4 v2, 0x0

    :goto_7
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_117

    move-object/from16 v3, p1

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqjd;

    move-object/from16 v5, p0

    iget-object v6, v5, Lzo4;->g:Lxmf;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v4, Lqjd;->c:Lmjd;

    iget-object v8, v4, Lqjd;->a:Ljava/lang/String;

    iget-object v4, v4, Lqjd;->e:Lvjd;

    iget-object v9, v7, Lmjd;->b:Ljava/lang/String;

    iget-object v10, v7, Lmjd;->a:Landroid/net/Uri;

    iget-object v11, v7, Lmjd;->b:Ljava/lang/String;

    const/4 v13, 0x4

    const/4 v14, 0x3

    if-eqz v9, :cond_4a

    const-string v15, "audio/"

    invoke-virtual {v9, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_36

    move v9, v14

    goto :goto_4b

    :cond_36
    const-string v9, "image/"

    invoke-virtual {v11, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_40

    move v9, v13

    goto :goto_4b

    :cond_40
    const-string v9, "video/"

    invoke-virtual {v11, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4a

    const/4 v9, 0x1

    goto :goto_4b

    :cond_4a
    const/4 v9, 0x0

    :goto_4b
    new-instance v15, Lcom/google/android/gms/cast/MediaMetadata;

    invoke-direct {v15, v9}, Lcom/google/android/gms/cast/MediaMetadata;-><init>(I)V

    iget-object v1, v4, Lvjd;->a:Ljava/lang/CharSequence;

    if-eqz v1, :cond_5d

    const-string v12, "com.google.android.gms.cast.metadata.TITLE"

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v12, v1}, Lcom/google/android/gms/cast/MediaMetadata;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5d
    iget-object v1, v4, Lvjd;->f:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_7c

    if-eq v9, v14, :cond_73

    if-eq v9, v13, :cond_73

    const-string v9, "com.google.android.gms.cast.metadata.SUBTITLE"

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v9, v1}, Lcom/google/android/gms/cast/MediaMetadata;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7c

    :cond_73
    const-string v9, "com.google.android.gms.cast.metadata.ARTIST"

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v9, v1}, Lcom/google/android/gms/cast/MediaMetadata;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7c
    :goto_7c
    iget-object v1, v4, Lvjd;->m:Landroid/net/Uri;

    if-nez v1, :cond_8c

    iget-object v6, v6, Lxmf;->a:Lmjg;

    if-eqz v6, :cond_8c

    iget-object v1, v6, Lmjg;->a:Lokg;

    iget-object v1, v1, Lokg;->c:Llkg;

    invoke-interface {v1, v8}, Llkg;->e(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :cond_8c
    if-eqz v1, :cond_96

    new-instance v6, Lcom/google/android/gms/common/images/WebImage;

    invoke-direct {v6, v1}, Lcom/google/android/gms/common/images/WebImage;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v15, v6}, Lcom/google/android/gms/cast/MediaMetadata;->addImage(Lcom/google/android/gms/common/images/WebImage;)V

    :cond_96
    new-instance v1, Lcom/google/android/gms/cast/MediaInfo$Builder;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/google/android/gms/cast/MediaInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lcom/google/android/gms/cast/MediaInfo$Builder;->setStreamType(I)Lcom/google/android/gms/cast/MediaInfo$Builder;

    move-result-object v1

    invoke-virtual {v1, v15}, Lcom/google/android/gms/cast/MediaInfo$Builder;->setMetadata(Lcom/google/android/gms/cast/MediaMetadata;)Lcom/google/android/gms/cast/MediaInfo$Builder;

    move-result-object v1

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const/4 v9, 0x0

    :try_start_ae
    const-string v12, "id"

    invoke-virtual {v6, v12, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v8, "title"

    iget-object v4, v4, Lvjd;->a:Ljava/lang/CharSequence;

    invoke-virtual {v6, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "uri"

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "mimeType"

    invoke-virtual {v6, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "drmConfig"

    iget-object v7, v7, Lmjd;->c:Ljjd;

    if-nez v7, :cond_d0

    move-object v8, v9

    goto :goto_f3

    :cond_d0
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "uuid"

    iget-object v12, v7, Ljjd;->b:Ljava/util/UUID;

    invoke-virtual {v12}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "licenseUri"

    iget-object v12, v7, Ljjd;->c:Landroid/net/Uri;

    invoke-virtual {v8, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "requestHeaders"

    new-instance v12, Lorg/json/JSONObject;

    iget-object v7, v7, Ljjd;->d:Ll1b;

    invoke-direct {v12, v7}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v8, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_f3
    invoke-virtual {v6, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_f6
    .catch Lorg/json/JSONException; {:try_start_ae .. :try_end_f6} :catch_112

    invoke-virtual {v1, v6}, Lcom/google/android/gms/cast/MediaInfo$Builder;->setCustomData(Lorg/json/JSONObject;)Lcom/google/android/gms/cast/MediaInfo$Builder;

    move-result-object v1

    if-eqz v11, :cond_ff

    invoke-virtual {v1, v11}, Lcom/google/android/gms/cast/MediaInfo$Builder;->setContentType(Ljava/lang/String;)Lcom/google/android/gms/cast/MediaInfo$Builder;

    :cond_ff
    new-instance v4, Lcom/google/android/gms/cast/MediaQueueItem$Builder;

    invoke-virtual {v1}, Lcom/google/android/gms/cast/MediaInfo$Builder;->build()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/google/android/gms/cast/MediaQueueItem$Builder;-><init>(Lcom/google/android/gms/cast/MediaInfo;)V

    invoke-virtual {v4}, Lcom/google/android/gms/cast/MediaQueueItem$Builder;->build()Lcom/google/android/gms/cast/MediaQueueItem;

    move-result-object v1

    aput-object v1, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7

    :catch_112
    move-exception v0

    invoke-static {v0}, Lrqd;->p(Ljava/lang/Throwable;)V

    return-object v9

    :cond_117
    return-object v0
.end method

.method public final L()Lnyl;
    .registers 1

    sget-object p0, Lnyl;->K:Lnyl;

    return-object p0
.end method

.method public final L0()V
    .registers 4

    iget-object v0, p0, Lzo4;->J:Lcig;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lnrl;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lnrl;-><init>(B)V

    iget-object v2, v0, Lcig;->a:Lw69;

    invoke-virtual {v1, v2}, Lnrl;->c(Lw69;)V

    sget-object v2, Lzo4;->R:Lcig;

    iget-object v2, v2, Lcig;->a:Lw69;

    invoke-virtual {v1, v2}, Lnrl;->c(Lw69;)V

    new-instance v2, Lcig;

    invoke-virtual {v1}, Lnrl;->j()Lw69;

    move-result-object v1

    invoke-direct {v2, v1}, Lcig;-><init>(Lw69;)V

    iput-object v2, p0, Lzo4;->J:Lcig;

    invoke-virtual {v2, v0}, Lcig;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_35

    new-instance v0, Lko4;

    invoke-direct {v0, p0}, Lko4;-><init>(Lzo4;)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    const/16 v1, 0xd

    invoke-virtual {p0, v1, v0}, Lijc;->d(ILfjc;)V

    :cond_35
    return-void
.end method

.method public final M0(Lcom/google/android/gms/cast/MediaStatus;)V
    .registers 20

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lzo4;->L:Z

    if-nez v1, :cond_3e

    new-instance v1, Lt14;

    const/16 v2, 0x1b

    invoke-direct {v1, v2}, Lt14;-><init>(B)V

    invoke-virtual {v0, v1}, Lzo4;->y0(Lt14;)Z

    move-result v1

    if-nez v1, :cond_3e

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getCurrentItemId()I

    move-result v1

    if-nez v1, :cond_1d

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getLoadingItemId()I

    move-result v1

    :cond_1d
    invoke-virtual {v0}, Lzo4;->z0()Lfig;

    move-result-object v2

    iget-object v3, v0, Lzo4;->k:Ljava/util/ArrayList;

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    if-nez v1, :cond_2e

    iput v6, v0, Lzo4;->r:I

    iput-wide v4, v0, Lzo4;->s:J

    const/4 v1, 0x0

    goto :goto_4b

    :cond_2e
    iget-object v7, v0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqjd;

    if-nez v1, :cond_3f

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_3f

    :cond_3e
    return-void

    :cond_3f
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v7

    iput v7, v0, Lzo4;->r:I

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getStreamPosition()J

    move-result-wide v7

    iput-wide v7, v0, Lzo4;->s:J

    :goto_4b
    const/4 v7, 0x2

    iget-object v9, v0, Lzo4;->j:Lijc;

    if-eqz v1, :cond_d4

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v10

    if-eqz v10, :cond_d4

    invoke-virtual {v10}, Lcom/google/android/gms/cast/MediaInfo;->getStreamDuration()J

    move-result-wide v11

    const-wide/16 v13, -0x1

    cmp-long v13, v11, v13

    if-eqz v13, :cond_d4

    cmp-long v13, v11, v4

    if-ltz v13, :cond_d4

    new-instance v13, Lfql;

    invoke-direct {v13}, Lfql;-><init>()V

    iget-object v14, v0, Lzo4;->t:Lrb3;

    iget v15, v0, Lzo4;->r:I

    invoke-virtual {v14, v15, v13}, Lgql;->n(ILfql;)V

    iget-wide v13, v13, Lfql;->l:J

    const-wide v15, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v13, v13, v15

    if-nez v13, :cond_d4

    const-wide/16 v13, 0x3e8

    mul-long/2addr v11, v13

    invoke-virtual {v10}, Lcom/google/android/gms/cast/MediaInfo;->getStreamType()I

    move-result v10

    if-ne v10, v7, :cond_86

    const/4 v10, 0x1

    goto :goto_87

    :cond_86
    move v10, v6

    :goto_87
    iget v13, v0, Lzo4;->r:I

    iget-object v14, v0, Lzo4;->t:Lrb3;

    new-instance v15, Ljava/util/ArrayList;

    move-wide/from16 v16, v4

    iget-object v4, v14, Lrb3;->f:[Lqb3;

    array-length v4, v4

    invoke-direct {v15, v4}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v4, v14, Lrb3;->f:[Lqb3;

    array-length v5, v4

    move v8, v6

    :goto_99
    if-ge v8, v5, :cond_a3

    aget-object v7, v4, v8

    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_99

    :cond_a3
    iget-object v4, v14, Lrb3;->e:Ljij;

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqjd;

    new-instance v5, Lqb3;

    invoke-direct {v5, v3, v11, v12, v10}, Lqb3;-><init>(Lqjd;JZ)V

    invoke-virtual {v15, v13, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lrb3;

    new-array v5, v6, [Lqb3;

    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lqb3;

    invoke-direct {v3, v5, v4}, Lrb3;-><init>([Lqb3;Ljij;)V

    iget-object v4, v0, Lzo4;->t:Lrb3;

    invoke-virtual {v3, v4}, Lgql;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d6

    iput-object v3, v0, Lzo4;->t:Lrb3;

    new-instance v4, Ljl4;

    const/4 v5, 0x4

    invoke-direct {v4, v3, v5}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v6, v4}, Lijc;->d(ILfjc;)V

    goto :goto_d6

    :cond_d4
    move-wide/from16 v16, v4

    :cond_d6
    :goto_d6
    invoke-virtual {v0}, Lzo4;->z0()Lfig;

    move-result-object v3

    iget-object v4, v0, Lzo4;->F:Lqjd;

    const/16 v5, 0xb

    if-ne v1, v4, :cond_116

    if-eqz v1, :cond_104

    iget-boolean v4, v0, Lzo4;->K:Z

    if-nez v4, :cond_104

    iget-wide v7, v0, Lzo4;->s:J

    cmp-long v4, v7, v16

    if-nez v4, :cond_104

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getQueueRepeatMode()I

    move-result v4

    const/4 v7, 0x2

    if-ne v4, v7, :cond_104

    new-instance v4, Lmo4;

    const/4 v7, 0x1

    invoke-direct {v4, v1, v7}, Lmo4;-><init>(Lqjd;B)V

    invoke-virtual {v9, v7, v4}, Lijc;->d(ILfjc;)V

    new-instance v1, Lno4;

    invoke-direct {v1, v2, v3, v7}, Lno4;-><init>(Lfig;Lfig;B)V

    invoke-virtual {v9, v5, v1}, Lijc;->d(ILfjc;)V

    :cond_104
    iget-wide v1, v0, Lzo4;->s:J

    cmp-long v1, v1, v16

    if-lez v1, :cond_10c

    iput-boolean v6, v0, Lzo4;->K:Z

    :cond_10c
    invoke-virtual/range {p0 .. p1}, Lzo4;->P0(Lcom/google/android/gms/cast/MediaStatus;)V

    invoke-virtual {v0}, Lzo4;->L0()V

    invoke-virtual {v9}, Lijc;->c()V

    return-void

    :cond_116
    iput-object v1, v0, Lzo4;->F:Lqjd;

    new-instance v4, Lmo4;

    const/4 v7, 0x2

    invoke-direct {v4, v1, v7}, Lmo4;-><init>(Lqjd;B)V

    const/4 v1, 0x1

    invoke-virtual {v9, v1, v4}, Lijc;->d(ILfjc;)V

    new-instance v1, Lno4;

    invoke-direct {v1, v2, v3, v7}, Lno4;-><init>(Lfig;Lfig;B)V

    invoke-virtual {v9, v5, v1}, Lijc;->d(ILfjc;)V

    invoke-virtual/range {p0 .. p1}, Lzo4;->P0(Lcom/google/android/gms/cast/MediaStatus;)V

    invoke-virtual {v0}, Lzo4;->L0()V

    invoke-virtual {v9}, Lijc;->c()V

    return-void
.end method

.method public final N()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final N0()Z
    .registers 8

    new-instance v0, Lt14;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    invoke-virtual {p0, v0}, Lzo4;->y0(Lt14;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_36

    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, p0, Lzo4;->l:[I

    array-length v3, v3

    const/4 v4, 0x1

    if-eq v2, v3, :cond_37

    iget-object v0, p0, Lzo4;->x:Lzh8;

    if-nez v0, :cond_36

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;

    move-result-object v0

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Lcom/google/android/gms/cast/MediaStatus;->getPlayerState()I

    move-result v0

    if-ne v0, v4, :cond_36

    invoke-virtual {p0, v4, v4}, Lzo4;->F0(IZ)V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lzo4;->s:J

    invoke-virtual {p0}, Lzo4;->H0()V

    :cond_36
    return v1

    :cond_37
    iget-object v2, p0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    iget-boolean v3, p0, Lzo4;->M:Z

    if-eqz v3, :cond_5f

    iget-object v3, p0, Lzo4;->N:Ljij;

    invoke-interface {v3}, Ljij;->getFirstIndex()I

    move-result v3

    :goto_46
    iget-object v5, p0, Lzo4;->l:[I

    array-length v6, v5

    if-ge v1, v6, :cond_72

    aget v5, v5, v1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqjd;

    invoke-virtual {v2, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v5, p0, Lzo4;->N:Ljij;

    invoke-interface {v5, v3}, Ljij;->getNextIndex(I)I

    move-result v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_46

    :cond_5f
    :goto_5f
    iget-object v3, p0, Lzo4;->l:[I

    array-length v5, v3

    if-ge v1, v5, :cond_72

    aget v3, v3, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqjd;

    invoke-virtual {v2, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    :cond_72
    return v4
.end method

.method public final O0(Lcom/google/android/gms/cast/MediaStatus;)V
    .registers 5

    iget-object v0, p0, Lzo4;->q:Lwo4;

    if-nez v0, :cond_17

    invoke-virtual {p1}, Lcom/google/android/gms/cast/MediaStatus;->getPlayerState()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_24

    const/4 v1, 0x2

    const/4 v2, 0x3

    if-eq p1, v1, :cond_20

    if-eq p1, v2, :cond_1c

    const/4 v2, 0x4

    if-eq p1, v2, :cond_18

    const/4 v2, 0x5

    if-eq p1, v2, :cond_18

    :cond_17
    return-void

    :cond_18
    invoke-virtual {p0, v1, v0}, Lzo4;->F0(IZ)V

    return-void

    :cond_1c
    invoke-virtual {p0, v2, v0}, Lzo4;->F0(IZ)V

    return-void

    :cond_20
    invoke-virtual {p0, v2, v0}, Lzo4;->F0(IZ)V

    return-void

    :cond_24
    invoke-virtual {p0, v0, v0}, Lzo4;->F0(IZ)V

    return-void
.end method

.method public final P()Lcig;
    .registers 1

    iget-object p0, p0, Lzo4;->J:Lcig;

    return-object p0
.end method

.method public final P0(Lcom/google/android/gms/cast/MediaStatus;)V
    .registers 22

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v1

    if-eqz v1, :cond_d

    invoke-virtual {v1}, Lcom/google/android/gms/cast/MediaInfo;->getMediaTracks()Ljava/util/List;

    move-result-object v1

    goto :goto_e

    :cond_d
    const/4 v1, 0x0

    :goto_e
    iget-object v3, v0, Lzo4;->j:Lijc;

    const/4 v4, 0x2

    if-eqz v1, :cond_1bc

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1bc

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/cast/MediaStatus;->getActiveTrackIds()[J

    move-result-object v5

    if-nez v5, :cond_21

    sget-object v5, Lzo4;->P:[J

    :cond_21
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Leyl;

    const/4 v7, 0x3

    new-array v8, v7, [Lbj8;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Lezl;

    const/4 v11, 0x0

    :goto_31
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    if-ge v11, v12, :cond_148

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/gms/cast/MediaTrack;

    new-instance v13, Leyl;

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentType()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_49

    invoke-static {v14}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    :cond_49
    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getType()I

    move-result v15

    const/4 v2, 0x1

    if-eq v15, v2, :cond_81

    if-eq v15, v4, :cond_6b

    if-ne v15, v7, :cond_58

    if-nez v14, :cond_5a

    const-string v14, "video/x-unknown"

    :cond_58
    :goto_58
    const/4 v15, 0x0

    goto :goto_ac

    :cond_5a
    invoke-static {v14}, Ldzd;->o(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_58

    invoke-static {v14}, Ldzd;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_58

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentType()Ljava/lang/String;

    move-result-object v15

    goto :goto_ac

    :cond_6b
    if-nez v14, :cond_70

    const-string v14, "audio/x-unknown"

    goto :goto_58

    :cond_70
    invoke-static {v14}, Ldzd;->k(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_58

    invoke-static {v14}, Ldzd;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_58

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentType()Ljava/lang/String;

    move-result-object v15

    goto :goto_ac

    :cond_81
    if-eqz v14, :cond_58

    invoke-static {v14}, Ldzd;->n(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_58

    invoke-static {v14}, Ltym;->Z(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    array-length v15, v14

    const/4 v10, 0x0

    :goto_8f
    if-ge v10, v15, :cond_a5

    aget-object v16, v14, v10

    invoke-static/range {v16 .. v16}, Ldzd;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_a2

    invoke-static/range {v16 .. v16}, Ldzd;->n(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_a2

    move-object/from16 v14, v16

    goto :goto_a6

    :cond_a2
    add-int/lit8 v10, v10, 0x1

    goto :goto_8f

    :cond_a5
    const/4 v14, 0x0

    :goto_a6
    if-eqz v14, :cond_58

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentType()Ljava/lang/String;

    move-result-object v15

    :goto_ac
    new-instance v10, Lnj9;

    invoke-direct {v10}, Lnj9;-><init>()V

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentId()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v10, Lnj9;->a:Ljava/lang/String;

    invoke-static {v14}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v10, Lnj9;->m:Ljava/lang/String;

    iput-object v15, v10, Lnj9;->j:Ljava/lang/String;

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getLanguage()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v10, Lnj9;->d:Ljava/lang/String;

    new-instance v7, Loj9;

    invoke-direct {v7, v10}, Loj9;-><init>(Lnj9;)V

    filled-new-array {v7}, [Loj9;

    move-result-object v7

    const-string v10, ""

    invoke-direct {v13, v10, v7}, Leyl;-><init>(Ljava/lang/String;[Loj9;)V

    aput-object v13, v6, v11

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getId()J

    move-result-wide v13

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getType()I

    move-result v7

    if-eq v7, v2, :cond_f1

    if-eq v7, v4, :cond_ef

    const/4 v10, 0x3

    if-eq v7, v10, :cond_ed

    invoke-virtual {v12}, Lcom/google/android/gms/cast/MediaTrack;->getContentType()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ldzd;->i(Ljava/lang/String;)I

    move-result v7

    goto :goto_f2

    :cond_ed
    move v7, v4

    goto :goto_f2

    :cond_ef
    move v7, v2

    goto :goto_f2

    :cond_f1
    const/4 v7, 0x3

    :goto_f2
    const/4 v10, -0x1

    if-ne v7, v4, :cond_f7

    const/4 v7, 0x0

    goto :goto_101

    :cond_f7
    if-ne v7, v2, :cond_fb

    move v7, v2

    goto :goto_101

    :cond_fb
    const/4 v12, 0x3

    if-ne v7, v12, :cond_100

    move v7, v4

    goto :goto_101

    :cond_100
    move v7, v10

    :goto_101
    if-eq v7, v10, :cond_105

    move v12, v2

    goto :goto_106

    :cond_105
    const/4 v12, 0x0

    :goto_106
    array-length v15, v5

    const/4 v4, 0x0

    :goto_108
    if-ge v4, v15, :cond_113

    aget-wide v18, v5, v4

    cmp-long v18, v18, v13

    if-eqz v18, :cond_114

    add-int/lit8 v4, v4, 0x1

    goto :goto_108

    :cond_113
    move v4, v10

    :cond_114
    if-eq v4, v10, :cond_11e

    if-eqz v12, :cond_11e

    aget-object v4, v8, v7

    if-nez v4, :cond_11e

    move v4, v2

    goto :goto_11f

    :cond_11e
    const/4 v4, 0x0

    :goto_11f
    if-eqz v4, :cond_12b

    new-instance v10, Lm69;

    aget-object v13, v6, v11

    const/4 v14, 0x0

    invoke-direct {v10, v13, v14}, Lm69;-><init>(Leyl;I)V

    aput-object v10, v8, v7

    :cond_12b
    new-instance v7, Lezl;

    aget-object v10, v6, v11

    if-eqz v12, :cond_133

    const/4 v14, 0x4

    goto :goto_134

    :cond_133
    const/4 v14, 0x0

    :goto_134
    filled-new-array {v14}, [I

    move-result-object v12

    new-array v2, v2, [Z

    const/4 v14, 0x0

    aput-boolean v4, v2, v14

    invoke-direct {v7, v10, v14, v12, v2}, Lezl;-><init>(Leyl;Z[I[Z)V

    aput-object v7, v9, v11

    add-int/lit8 v11, v11, 0x1

    const/4 v4, 0x2

    const/4 v7, 0x3

    goto/16 :goto_31

    :cond_148
    new-instance v2, Lfyl;

    invoke-direct {v2, v6}, Lfyl;-><init>([Leyl;)V

    new-instance v4, Ljyl;

    invoke-direct {v4, v8}, Ljyl;-><init>([Lbj8;)V

    new-instance v5, Lfzl;

    invoke-static {v9}, Lh1b;->t([Ljava/lang/Object;)Lcsh;

    move-result-object v6

    invoke-direct {v5, v6}, Lfzl;-><init>(Lcsh;)V

    iget-object v6, v0, Lzo4;->h:Ljx6;

    if-eqz v6, :cond_193

    iget-object v7, v0, Lzo4;->H:Lfyl;

    invoke-virtual {v2, v7}, Lfyl;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_193

    iget-object v7, v0, Lzo4;->t:Lrb3;

    iget v8, v0, Lzo4;->r:I

    iget-object v9, v7, Lrb3;->f:[Lqb3;

    aget-object v8, v9, v8

    :try_start_16f
    sget-object v9, Lzo4;->Q:[Lkuh;

    new-instance v10, Ljrd;

    invoke-direct {v10, v8}, Ljrd;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v9, v2, v10, v7}, Ljx6;->i([Lkuh;Lfyl;Ljrd;Lgql;)Lpyl;

    move-result-object v7

    new-instance v8, Ljyl;

    iget-object v9, v7, Lpyl;->d:Ljava/lang/Object;

    check-cast v9, [Lbj8;

    invoke-direct {v8, v9}, Ljyl;-><init>([Lbj8;)V

    invoke-virtual {v4, v8}, Ljyl;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_18c

    invoke-virtual {v0, v8, v1}, Lzo4;->J0(Ljyl;Ljava/util/List;)V
    :try_end_18c
    .catch Lrhg; {:try_start_16f .. :try_end_18c} :catch_193

    :cond_18c
    :try_start_18c
    iget-object v1, v7, Lpyl;->f:Ljava/lang/Object;

    check-cast v1, Lpr;

    iput-object v1, v6, Ljx6;->c:Lpr;
    :try_end_192
    .catch Lrhg; {:try_start_18c .. :try_end_192} :catch_192

    :catch_192
    move-object v4, v8

    :catch_193
    :cond_193
    iget-object v1, v0, Lzo4;->H:Lfyl;

    invoke-virtual {v2, v1}, Lfyl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1ab

    iget-object v1, v0, Lzo4;->G:Ljyl;

    invoke-virtual {v4, v1}, Ljyl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1ab

    iget-object v1, v0, Lzo4;->I:Lfzl;

    invoke-virtual {v5, v1}, Lfzl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c2

    :cond_1ab
    iput-object v4, v0, Lzo4;->G:Ljyl;

    iput-object v2, v0, Lzo4;->H:Lfyl;

    iput-object v5, v0, Lzo4;->I:Lfzl;

    new-instance v0, Ljl4;

    const/4 v10, 0x3

    invoke-direct {v0, v5, v10}, Ljl4;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x2

    invoke-virtual {v3, v1, v0}, Lijc;->d(ILfjc;)V

    goto :goto_1c2

    :cond_1bc
    iget-object v1, v0, Lzo4;->H:Lfyl;

    iget v1, v1, Lfyl;->a:I

    if-nez v1, :cond_1c3

    :cond_1c2
    :goto_1c2
    return-void

    :cond_1c3
    sget-object v1, Lfyl;->d:Lfyl;

    iput-object v1, v0, Lzo4;->H:Lfyl;

    sget-object v1, Lfzl;->b:Lfzl;

    iput-object v1, v0, Lzo4;->I:Lfzl;

    sget-object v1, Lzo4;->O:Ljyl;

    iput-object v1, v0, Lzo4;->G:Ljyl;

    new-instance v0, Lt14;

    const/16 v1, 0x1c

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    const/4 v1, 0x2

    invoke-virtual {v3, v1, v0}, Lijc;->d(ILfjc;)V

    return-void
.end method

.method public final Q0(Z)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_17

    iget-object v1, v0, Lzo4;->t:Lrb3;

    invoke-virtual {v1}, Lgql;->p()Z

    move-result v1

    if-nez v1, :cond_bd

    sget-object v1, Lrb3;->g:Lrb3;

    goto/16 :goto_be

    :cond_17
    iget-object v2, v0, Lzo4;->N:Ljij;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Lfql;

    invoke-direct {v6}, Lfql;-><init>()V

    iget-object v7, v0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v7, :cond_2c

    invoke-virtual {v7}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaQueue()Lcom/google/android/gms/cast/framework/media/MediaQueue;

    move-result-object v7

    goto :goto_2d

    :cond_2c
    const/4 v7, 0x0

    :goto_2d
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    :goto_32
    if-ge v9, v8, :cond_a7

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lqjd;

    const/4 v11, 0x0

    :goto_3d
    iget-object v12, v0, Lzo4;->t:Lrb3;

    iget-object v13, v12, Lrb3;->f:[Lqb3;

    array-length v13, v13

    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    if-ge v11, v13, :cond_5a

    invoke-virtual {v12, v11, v6}, Lgql;->n(ILfql;)V

    iget-object v12, v6, Lfql;->b:Lqjd;

    if-ne v12, v10, :cond_57

    iget-wide v11, v6, Lfql;->l:J

    invoke-virtual {v6}, Lfql;->a()Z

    move-result v13

    goto :goto_5c

    :cond_57
    add-int/lit8 v11, v11, 0x1

    goto :goto_3d

    :cond_5a
    move-wide v11, v14

    const/4 v13, 0x0

    :goto_5c
    cmp-long v14, v11, v14

    if-nez v14, :cond_9e

    if-nez v13, :cond_9e

    if-eqz v7, :cond_9e

    iget-object v14, v0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v14, v10}, Landroid/util/SparseArray;->indexOfValue(Ljava/lang/Object;)I

    move-result v15

    const/4 v4, -0x1

    if-eq v15, v4, :cond_9e

    invoke-virtual {v14, v15}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v14

    invoke-virtual {v7, v14}, Lcom/google/android/gms/cast/framework/media/MediaQueue;->indexOfItemWithId(I)I

    move-result v14

    if-eq v14, v4, :cond_9e

    invoke-virtual {v7, v14}, Lcom/google/android/gms/cast/framework/media/MediaQueue;->getItemAtIndex(I)Lcom/google/android/gms/cast/MediaQueueItem;

    move-result-object v4

    if-eqz v4, :cond_9e

    invoke-virtual {v4}, Lcom/google/android/gms/cast/MediaQueueItem;->getMedia()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/cast/MediaInfo;->getStreamDuration()J

    move-result-wide v13

    const-wide/16 v16, -0x1

    cmp-long v15, v13, v16

    if-eqz v15, :cond_94

    const-wide/16 v16, 0x0

    cmp-long v15, v13, v16

    if-ltz v15, :cond_94

    const-wide/16 v11, 0x3e8

    mul-long/2addr v11, v13

    :cond_94
    invoke-virtual {v4}, Lcom/google/android/gms/cast/MediaInfo;->getStreamType()I

    move-result v4

    if-ne v4, v3, :cond_9d

    const/4 v4, 0x1

    move v13, v4

    goto :goto_9e

    :cond_9d
    const/4 v13, 0x0

    :cond_9e
    :goto_9e
    new-instance v4, Lqb3;

    invoke-direct {v4, v10, v11, v12, v13}, Lqb3;-><init>(Lqjd;JZ)V

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    :cond_a7
    new-instance v1, Lrb3;

    const/4 v4, 0x0

    new-array v6, v4, [Lqb3;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lqb3;

    invoke-direct {v1, v4, v2}, Lrb3;-><init>([Lqb3;Ljij;)V

    iget-object v2, v0, Lzo4;->t:Lrb3;

    invoke-virtual {v1, v2}, Lgql;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_be

    :cond_bd
    return-void

    :cond_be
    :goto_be
    iput-object v1, v0, Lzo4;->t:Lrb3;

    new-instance v2, Lvw;

    move/from16 v4, p1

    invoke-direct {v2, v3, v1, v4}, Lvw;-><init>(BLjava/lang/Object;Z)V

    iget-object v0, v0, Lzo4;->j:Lijc;

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Lijc;->d(ILfjc;)V

    return-void
.end method

.method public final R()J
    .registers 3

    const-wide/16 v0, 0xbb8

    return-wide v0
.end method

.method public final S(Leig;)V
    .registers 2

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0, p1}, Lijc;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final U()Lr4n;
    .registers 1

    sget-object p0, Lr4n;->d:Lr4n;

    return-object p0
.end method

.method public final V()F
    .registers 1

    iget p0, p0, Lzo4;->A:F

    return p0
.end method

.method public final W()Lpf2;
    .registers 1

    sget-object p0, Lpf2;->i:Lpf2;

    return-object p0
.end method

.method public final X()Lu67;
    .registers 1

    sget-object p0, Lu67;->e:Lu67;

    return-object p0
.end method

.method public final Y(II)V
    .registers 3

    return-void
.end method

.method public final a()V
    .registers 3

    iget-byte v0, p0, Lzo4;->w:B

    const/4 v1, 0x1

    if-eq v0, v1, :cond_8

    const/4 v1, 0x4

    if-ne v0, v1, :cond_d

    :cond_8
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lzo4;->F0(IZ)V

    :cond_d
    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final a0()J
    .registers 3

    iget-short p0, p0, Lzo4;->p:S

    int-to-long v0, p0

    return-wide v0
.end method

.method public final b0(ILjava/util/List;)V
    .registers 11

    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    iget-object v2, p0, Lzo4;->N:Ljij;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, p1, v3}, Ljij;->cloneAndInsert(II)Ljij;

    move-result-object v3

    iput-object v3, p0, Lzo4;->N:Ljij;

    const/4 v3, 0x0

    if-eqz v1, :cond_1c

    invoke-virtual {p0}, Lzo4;->H0()V

    goto :goto_85

    :cond_1c
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-lez p2, :cond_85

    iget-object v1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v1, :cond_85

    add-int v1, p1, p2

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v1}, Lzo4;->K0(Ljava/util/List;)[Lcom/google/android/gms/cast/MediaQueueItem;

    move-result-object v1

    iget-boolean v4, p0, Lzo4;->M:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_7d

    if-ne p2, v5, :cond_49

    add-int/lit8 p2, p1, 0x1

    iget-object v0, p0, Lzo4;->N:Ljij;

    invoke-static {p1, p2, v0}, Lzo4;->B0(IILjij;)[I

    move-result-object p1

    new-instance p2, La32;

    const/4 v0, 0x3

    invoke-direct {p2, p0, p1, v1, v0}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v5, p2}, Lzo4;->D0(ILxo4;)V

    goto :goto_85

    :cond_49
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, p2

    invoke-static {v3, p1, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object p1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, p0, Lzo4;->N:Ljij;

    invoke-static {v3, v0, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object v0

    array-length v2, p1

    add-int/2addr v2, p2

    new-array v2, v2, [I

    array-length v4, p1

    invoke-static {p1, v3, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v4, v3

    :goto_65
    if-ge v4, p2, :cond_70

    array-length v6, p1

    add-int/2addr v6, v4

    array-length v7, p1

    add-int/2addr v7, v4

    aput v7, v2, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_65

    :cond_70
    new-instance p1, Ljl4;

    const/4 p2, 0x6

    invoke-direct {p1, v1, p2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v5, p1}, Lzo4;->D0(ILxo4;)V

    invoke-virtual {p0, v2, v0}, Lzo4;->E0([I[I)V

    goto :goto_85

    :cond_7d
    new-instance p2, Lso4;

    invoke-direct {p2, p0, p1, v1, v3}, Lso4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {p0, v5, p2}, Lzo4;->D0(ILxo4;)V

    :cond_85
    :goto_85
    invoke-virtual {p0, v3}, Lzo4;->Q0(Z)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final c(Lthg;)V
    .registers 4

    iget p1, p1, Lthg;->a:F

    const/high16 v0, 0x3f000000    # 0.5f

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p1, v0, v1}, Lcs5;->s(FFF)F

    move-result p1

    iget v0, p0, Lzo4;->z:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_11

    return-void

    :cond_11
    iput p1, p0, Lzo4;->z:F

    new-instance v0, Lio4;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lio4;-><init>(FB)V

    const/16 p1, 0x16

    invoke-virtual {p0, p1, v0}, Lzo4;->D0(ILxo4;)V

    return-void
.end method

.method public final clearVideoSurfaceView(Landroid/view/SurfaceView;)V
    .registers 2

    return-void
.end method

.method public final clearVideoTextureView(Landroid/view/TextureView;)V
    .registers 2

    return-void
.end method

.method public final d()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final d0()Lvjd;
    .registers 1

    sget-object p0, Lvjd;->K:Lvjd;

    return-object p0
.end method

.method public final f0()I
    .registers 1

    iget p0, p0, Lzo4;->r:I

    return p0
.end method

.method public final g0(Leig;)V
    .registers 2

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0, p1}, Lijc;->f(Leig;)V

    return-void
.end method

.method public final getBufferedPosition()J
    .registers 3

    iget-wide v0, p0, Lzo4;->s:J

    return-wide v0
.end method

.method public final getContentPosition()J
    .registers 3

    iget-wide v0, p0, Lzo4;->s:J

    return-wide v0
.end method

.method public final getCurrentAdGroupIndex()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final getCurrentAdIndexInAdGroup()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final getCurrentPeriodIndex()I
    .registers 1

    iget p0, p0, Lzo4;->r:I

    return p0
.end method

.method public final getCurrentPosition()J
    .registers 3

    iget-wide v0, p0, Lzo4;->s:J

    return-wide v0
.end method

.method public final getCurrentTimeline()Lgql;
    .registers 1

    iget-object p0, p0, Lzo4;->t:Lrb3;

    return-object p0
.end method

.method public final getDuration()J
    .registers 5

    iget-wide v0, p0, Lzo4;->E:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v0, v2

    if-eqz v2, :cond_c

    return-wide v0

    :cond_c
    invoke-virtual {p0}, Lg83;->T()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getPlayWhenReady()Z
    .registers 1

    iget-boolean p0, p0, Lzo4;->C:Z

    return p0
.end method

.method public final getPlaybackParameters()Lthg;
    .registers 3

    iget v0, p0, Lzo4;->z:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_b

    sget-object p0, Lthg;->d:Lthg;

    return-object p0

    :cond_b
    new-instance v0, Lthg;

    iget p0, p0, Lzo4;->z:F

    invoke-direct {v0, p0}, Lthg;-><init>(F)V

    return-object v0
.end method

.method public final getPlaybackState()I
    .registers 1

    iget-byte p0, p0, Lzo4;->w:B

    return p0
.end method

.method public final getRepeatMode()I
    .registers 1

    iget p0, p0, Lzo4;->y:I

    return p0
.end method

.method public final getShuffleModeEnabled()Z
    .registers 1

    iget-boolean p0, p0, Lzo4;->M:Z

    return p0
.end method

.method public final i(IZ)V
    .registers 3

    return-void
.end method

.method public final i0(III)V
    .registers 8

    iget v0, p0, Lzo4;->r:I

    iget-object v1, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_13

    iget v0, p0, Lzo4;->r:I

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjd;

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le p3, v2, :cond_2a

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_2d

    :cond_2a
    invoke-virtual {v1, p3, v3}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    :goto_2d
    if-eqz v0, :cond_35

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lzo4;->r:I

    :cond_35
    if-ge p1, p2, :cond_40

    new-instance v0, Ljo4;

    invoke-direct {v0, p1, p2, p3, p0}, Ljo4;-><init>(IIILjava/lang/Object;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1, v0}, Lzo4;->D0(ILxo4;)V

    :cond_40
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lzo4;->Q0(Z)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final isLoading()Z
    .registers 1

    iget-object p0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->isBuffering()Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final isPlayingAd()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 1

    return-void
.end method

.method public final k(I)V
    .registers 2

    return-void
.end method

.method public final k0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final l(IILjava/util/List;)V
    .registers 4

    invoke-virtual {p0, p1, p2}, Lzo4;->q(II)V

    invoke-virtual {p0, p1, p3}, Lzo4;->b0(ILjava/util/List;)V

    return-void
.end method

.method public final m(Lnyl;)V
    .registers 2

    return-void
.end method

.method public final m0()J
    .registers 3

    iget-wide v0, p0, Lzo4;->s:J

    return-wide v0
.end method

.method public final n0(I)V
    .registers 2

    return-void
.end method

.method public final q(II)V
    .registers 10

    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    if-lt p1, p2, :cond_d

    return-void

    :cond_d
    iget v1, p0, Lzo4;->r:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1e

    iget v1, p0, Lzo4;->r:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqjd;

    goto :goto_1f

    :cond_1e
    const/4 v1, 0x0

    :goto_1f
    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_27
    :goto_27
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_40

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqjd;

    iget-object v6, p0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v6, v4}, Landroid/util/SparseArray;->indexOfValue(Ljava/lang/Object;)I

    move-result v4

    if-eq v4, v5, :cond_27

    invoke-virtual {v6, v4}, Landroid/util/SparseArray;->removeAt(I)V

    goto :goto_27

    :cond_40
    invoke-interface {v2}, Ljava/util/List;->clear()V

    const/4 v2, 0x0

    if-eqz v1, :cond_6a

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, v5, :cond_4f

    iput v1, p0, Lzo4;->r:I

    goto :goto_6a

    :cond_4f
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const-wide/16 v3, 0x0

    if-ge p1, v1, :cond_5c

    iput p1, p0, Lzo4;->r:I

    iput-wide v3, p0, Lzo4;->s:J

    goto :goto_6a

    :cond_5c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lzo4;->r:I

    iput-wide v3, p0, Lzo4;->s:J

    :cond_6a
    :goto_6a
    if-ge p1, p2, :cond_99

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7f

    new-instance v0, Lt14;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    const/16 v1, 0x20

    invoke-virtual {p0, v1, v0}, Lzo4;->D0(ILxo4;)V

    goto :goto_99

    :cond_7f
    iget-boolean v0, p0, Lzo4;->M:Z

    if-eqz v0, :cond_8a

    iget-object v0, p0, Lzo4;->N:Ljij;

    invoke-static {p1, p2, v0}, Lzo4;->B0(IILjij;)[I

    move-result-object v0

    goto :goto_8e

    :cond_8a
    invoke-static {p1, p2}, Lzo4;->A0(II)[I

    move-result-object v0

    :goto_8e
    new-instance v1, Lxj;

    const/16 v3, 0x1b

    invoke-direct {v1, p0, v0, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v0, 0x2

    invoke-virtual {p0, v0, v1}, Lzo4;->D0(ILxo4;)V

    :cond_99
    :goto_99
    iget-object v0, p0, Lzo4;->N:Ljij;

    invoke-interface {v0, p1, p2}, Ljij;->a(II)Ljij;

    move-result-object p1

    iput-object p1, p0, Lzo4;->N:Ljij;

    invoke-virtual {p0, v2}, Lzo4;->Q0(Z)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final q0()Lvjd;
    .registers 1

    iget-object p0, p0, Lzo4;->F:Lqjd;

    if-nez p0, :cond_7

    sget-object p0, Lvjd;->K:Lvjd;

    return-object p0

    :cond_7
    iget-object p0, p0, Lqjd;->e:Lvjd;

    return-object p0
.end method

.method public final r0(Ljava/util/List;)V
    .registers 6

    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lzo4;->N:Ljij;

    invoke-interface {p1}, Ljij;->cloneAndClear()Ljij;

    move-result-object p1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    invoke-interface {p1, v1, v0}, Ljij;->cloneAndInsert(II)Ljij;

    move-result-object p1

    iput-object p1, p0, Lzo4;->N:Ljij;

    iget-boolean v0, p0, Lzo4;->M:Z

    if-eqz v0, :cond_27

    invoke-interface {p1}, Ljij;->getFirstIndex()I

    move-result p1

    goto :goto_28

    :cond_27
    move p1, v1

    :goto_28
    iput p1, p0, Lzo4;->r:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2f

    iput v1, p0, Lzo4;->r:I

    :cond_2f
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lzo4;->s:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v2, p0, Lzo4;->E:J

    invoke-virtual {p0}, Lzo4;->H0()V

    invoke-virtual {p0, v1}, Lzo4;->Q0(Z)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final release()V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    iget-object v1, p0, Lzo4;->u:Lcom/google/android/gms/cast/framework/SessionManager;

    if-eqz v1, :cond_11

    iget-object v2, p0, Lzo4;->c:Lwth;

    const-class v3, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/cast/framework/SessionManager;->removeSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    iput-object v0, p0, Lzo4;->u:Lcom/google/android/gms/cast/framework/SessionManager;

    :cond_11
    return-void
.end method

.method public final s()Lrhg;
    .registers 3

    iget-byte v0, p0, Lzo4;->w:B

    const/4 v1, 0x1

    if-eq v0, v1, :cond_7

    const/4 p0, 0x0

    return-object p0

    :cond_7
    iget-object p0, p0, Lzo4;->x:Lzh8;

    return-object p0
.end method

.method public final s0()J
    .registers 3

    iget-short p0, p0, Lzo4;->o:S

    int-to-long v0, p0

    return-wide v0
.end method

.method public final setPlayWhenReady(Z)V
    .registers 5

    iget-boolean v0, p0, Lzo4;->C:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lzo4;->C:Z

    new-instance v0, Lgo4;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lgo4;-><init>(BZ)V

    iget-object p1, p0, Lzo4;->j:Lijc;

    const/4 v1, 0x5

    invoke-virtual {p1, v1, v0}, Lijc;->d(ILfjc;)V

    invoke-virtual {p0}, Lg83;->e0()Z

    move-result v0

    iget-boolean v1, p0, Lzo4;->D:Z

    const/4 v2, 0x2

    if-eq v1, v0, :cond_27

    iput-boolean v0, p0, Lzo4;->D:Z

    new-instance v1, Lgo4;

    invoke-direct {v1, v2, v0}, Lgo4;-><init>(BZ)V

    const/4 v0, 0x7

    invoke-virtual {p1, v0, v1}, Lijc;->d(ILfjc;)V

    :cond_27
    iget-byte v0, p0, Lzo4;->w:B

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2e

    if-ne v0, v2, :cond_31

    :cond_2e
    invoke-virtual {p0}, Lzo4;->I0()V

    :cond_31
    invoke-virtual {p1}, Lijc;->c()V

    return-void
.end method

.method public final setRepeatMode(I)V
    .registers 4

    iget v0, p0, Lzo4;->y:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lzo4;->y:I

    new-instance v0, Lgz3;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lgz3;-><init>(BI)V

    iget-object p1, p0, Lzo4;->j:Lijc;

    const/16 v1, 0x8

    invoke-virtual {p1, v1, v0}, Lijc;->i(ILfjc;)V

    iget p1, p0, Lzo4;->y:I

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1f

    if-eq p1, v0, :cond_1e

    const/4 v0, 0x0

    goto :goto_1f

    :cond_1e
    move v0, v1

    :cond_1f
    :goto_1f
    new-instance p1, Lgz3;

    const/4 v1, 0x2

    invoke-direct {p1, v1, v0}, Lgz3;-><init>(BI)V

    const/16 v0, 0x15

    invoke-virtual {p0, v0, p1}, Lzo4;->D0(ILxo4;)V

    return-void
.end method

.method public final setShuffleModeEnabled(Z)V
    .registers 5

    iget-boolean v0, p0, Lzo4;->M:Z

    if-eq v0, p1, :cond_4b

    iput-boolean p1, p0, Lzo4;->M:Z

    new-instance v0, Lgo4;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lgo4;-><init>(BZ)V

    iget-object p1, p0, Lzo4;->j:Lijc;

    const/16 v2, 0x9

    invoke-virtual {p1, v2, v0}, Lijc;->i(ILfjc;)V

    iget-object p1, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v0, :cond_4b

    iget-boolean v0, p0, Lzo4;->M:Z

    if-eqz v0, :cond_36

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v1, v0}, Lzo4;->A0(II)[I

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object v2, p0, Lzo4;->N:Ljij;

    invoke-static {v1, p1, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object p1

    goto :goto_48

    :cond_36
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, p0, Lzo4;->N:Ljij;

    invoke-static {v1, v0, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-static {v1, p1}, Lzo4;->A0(II)[I

    move-result-object p1

    :goto_48
    invoke-virtual {p0, v0, p1}, Lzo4;->E0([I[I)V

    :cond_4b
    return-void
.end method

.method public final setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .registers 2

    return-void
.end method

.method public final setVideoSurfaceView(Landroid/view/SurfaceView;)V
    .registers 2

    return-void
.end method

.method public final setVideoTextureView(Landroid/view/TextureView;)V
    .registers 2

    return-void
.end method

.method public final setVolume(F)V
    .registers 4

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Lcs5;->s(FFF)F

    move-result p1

    iput p1, p0, Lzo4;->A:F

    cmpl-float v0, p1, v1

    if-eqz v0, :cond_f

    iput p1, p0, Lzo4;->B:F

    :cond_f
    new-instance v0, Lio4;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lio4;-><init>(FB)V

    const/16 p1, 0x17

    invoke-virtual {p0, p1, v0}, Lzo4;->D0(ILxo4;)V

    return-void
.end method

.method public final stop()V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lzo4;->F0(IZ)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final t()V
    .registers 2

    iget v0, p0, Lzo4;->B:F

    invoke-virtual {p0, v0}, Lzo4;->setVolume(F)V

    return-void
.end method

.method public final v(I)V
    .registers 2

    return-void
.end method

.method public final w()Lfzl;
    .registers 1

    iget-object p0, p0, Lzo4;->I:Lfzl;

    return-object p0
.end method

.method public final w0(IJZ)V
    .registers 16

    invoke-virtual {p0}, Lzo4;->z0()Lfig;

    move-result-object p4

    iget v0, p0, Lzo4;->r:I

    const/4 v1, 0x1

    iget-object v2, p0, Lzo4;->j:Lijc;

    const/16 v3, 0xb

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    if-ne v0, p1, :cond_42

    cmp-long p1, p2, v7

    if-nez p1, :cond_1a

    move-wide p2, v5

    :cond_1a
    iget-wide v7, p0, Lzo4;->s:J

    cmp-long p1, v7, p2

    if-nez p1, :cond_21

    return-void

    :cond_21
    iput-wide p2, p0, Lzo4;->s:J

    new-instance p1, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;-><init>()V

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;->setPosition(J)Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    invoke-virtual {p1, v4}, Lcom/google/android/gms/cast/MediaSeekOptions$Builder;->setResumeState(I)Lcom/google/android/gms/cast/MediaSeekOptions$Builder;

    iget-wide p2, p0, Lzo4;->s:J

    cmp-long p2, p2, v5

    if-eqz p2, :cond_35

    move v1, v4

    :cond_35
    iput-boolean v1, p0, Lzo4;->K:Z

    new-instance p2, Llo4;

    invoke-direct {p2, p1, v4}, Llo4;-><init>(Lcom/google/android/gms/cast/MediaSeekOptions$Builder;B)V

    const/16 p1, 0xc

    invoke-virtual {p0, p1, p2}, Lzo4;->D0(ILxo4;)V

    goto :goto_9d

    :cond_42
    cmp-long v0, p2, v7

    const/4 v9, -0x1

    iget-object v10, p0, Lzo4;->k:Ljava/util/ArrayList;

    if-nez v0, :cond_64

    if-eq p1, v9, :cond_54

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_54

    iput p1, p0, Lzo4;->r:I

    goto :goto_57

    :cond_54
    iput v4, p0, Lzo4;->r:I

    move p1, v4

    :goto_57
    iput-wide v5, p0, Lzo4;->s:J

    iput-wide v7, p0, Lzo4;->E:J

    new-instance p2, Lg00;

    invoke-direct {p2, p0, p1, v1}, Lg00;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, v3, p2}, Lzo4;->D0(ILxo4;)V

    goto :goto_81

    :cond_64
    if-eq p1, v9, :cond_71

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_71

    iput p1, p0, Lzo4;->r:I

    iput-wide p2, p0, Lzo4;->s:J

    goto :goto_77

    :cond_71
    iput v4, p0, Lzo4;->r:I

    iput-wide v5, p0, Lzo4;->s:J

    move p1, v4

    move-wide p2, v5

    :goto_77
    iput-wide v7, p0, Lzo4;->E:J

    new-instance v0, Loo4;

    invoke-direct {v0, p1, p2, p3, p0}, Loo4;-><init>(IJLjava/lang/Object;)V

    invoke-virtual {p0, v3, v0}, Lzo4;->D0(ILxo4;)V

    :goto_81
    iget p1, p0, Lzo4;->r:I

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_92

    iget p1, p0, Lzo4;->r:I

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqjd;

    goto :goto_93

    :cond_92
    const/4 p1, 0x0

    :goto_93
    iput-object p1, p0, Lzo4;->F:Lqjd;

    new-instance p2, Lmo4;

    invoke-direct {p2, p1, v4}, Lmo4;-><init>(Lqjd;B)V

    invoke-virtual {v2, v1, p2}, Lijc;->d(ILfjc;)V

    :goto_9d
    invoke-virtual {p0}, Lzo4;->z0()Lfig;

    move-result-object p1

    new-instance p2, Lno4;

    invoke-direct {p2, p4, p1, v4}, Lno4;-><init>(Lfig;Lfig;B)V

    invoke-virtual {v2, v3, p2}, Lijc;->d(ILfjc;)V

    invoke-virtual {p0}, Lzo4;->L0()V

    invoke-virtual {v2}, Lijc;->c()V

    return-void
.end method

.method public final x(ILjava/util/List;J)V
    .registers 8

    iget-object v0, p0, Lzo4;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p2, p0, Lzo4;->N:Ljij;

    invoke-interface {p2}, Ljij;->cloneAndClear()Ljij;

    move-result-object p2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {p2, v2, v1}, Ljij;->cloneAndInsert(II)Ljij;

    move-result-object p2

    iput-object p2, p0, Lzo4;->N:Ljij;

    const/4 p2, -0x1

    if-eq p1, p2, :cond_2c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_2c

    iput p1, p0, Lzo4;->r:I

    iput-wide p3, p0, Lzo4;->s:J

    goto :goto_3e

    :cond_2c
    iget-boolean p1, p0, Lzo4;->M:Z

    if-eqz p1, :cond_37

    iget-object p1, p0, Lzo4;->N:Ljij;

    invoke-interface {p1}, Ljij;->getFirstIndex()I

    move-result p1

    goto :goto_38

    :cond_37
    move p1, v2

    :goto_38
    iput p1, p0, Lzo4;->r:I

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lzo4;->s:J

    :goto_3e
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide p1, p0, Lzo4;->E:J

    invoke-virtual {p0}, Lzo4;->H0()V

    invoke-virtual {p0, v2}, Lzo4;->Q0(Z)V

    iget-object p0, p0, Lzo4;->j:Lijc;

    invoke-virtual {p0}, Lijc;->c()V

    return-void
.end method

.method public final y0(Lt14;)Z
    .registers 3

    iget-object v0, p0, Lzo4;->q:Lwo4;

    if-eqz v0, :cond_28

    iget-byte v0, v0, Lwo4;->a:B

    invoke-virtual {p1, v0}, Lt14;->j(I)Z

    move-result v0

    if-nez v0, :cond_26

    iget-object p0, p0, Lzo4;->n:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyo4;

    iget-byte v0, v0, Lyo4;->a:B

    invoke-virtual {p1, v0}, Lt14;->j(I)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_26
    const/4 p0, 0x1

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public final z()Ly36;
    .registers 1

    sget-object p0, Ly36;->d:Ly36;

    return-object p0
.end method

.method public final z0()Lfig;
    .registers 13

    new-instance v0, Lfig;

    iget-object v1, p0, Lzo4;->t:Lrb3;

    invoke-virtual {v1}, Lgql;->p()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    move-object v1, v2

    move-object v3, v1

    goto :goto_17

    :cond_e
    iget-object v1, p0, Lzo4;->t:Lrb3;

    iget v3, p0, Lzo4;->r:I

    iget-object v1, v1, Lrb3;->f:[Lqb3;

    aget-object v1, v1, v3

    move-object v3, v2

    :goto_17
    iget v2, p0, Lzo4;->r:I

    iget-object v4, p0, Lzo4;->t:Lrb3;

    invoke-virtual {v4}, Lgql;->p()Z

    move-result v4

    if-eqz v4, :cond_23

    :goto_21
    move-object v4, v3

    goto :goto_2b

    :cond_23
    iget-object v3, p0, Lzo4;->t:Lrb3;

    const/4 v4, 0x0

    iget-object v3, v3, Lrb3;->f:[Lqb3;

    aget-object v3, v3, v4

    goto :goto_21

    :goto_2b
    iget-wide v6, p0, Lzo4;->s:J

    const/4 v11, -0x1

    sget-object v3, Lqjd;->h:Lqjd;

    const/4 v5, 0x0

    const/4 v10, -0x1

    move-wide v8, v6

    invoke-direct/range {v0 .. v11}, Lfig;-><init>(Ljava/lang/Object;ILqjd;Ljava/lang/Object;IJJII)V

    return-object v0
.end method
