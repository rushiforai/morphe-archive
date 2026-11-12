.class public final Lms7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqp5;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 15
    const/4 v0, 0x0

    iput-byte v0, p0, Lms7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 14
    iput-byte p2, p0, Lms7;->a:B

    iput-object p1, p0, Lms7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Llfh;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lms7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lms7;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Lms7;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_19a

    check-cast p1, Lmf3;

    new-instance v0, Lyqa;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/16 v3, 0x1c

    invoke-direct {v0, v1, v2, v3}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Lcz8;

    invoke-virtual {p0, p1, v0}, Lcz8;->a(Lmf3;Lyqa;)V

    return-void

    :pswitch_22
    check-cast p1, Li3e;

    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llfh;

    if-eqz p0, :cond_11c

    if-eqz p1, :cond_5c

    iget-object v0, p0, Llfh;->e:Lysp;

    if-nez v0, :cond_37

    move-object v0, v2

    :cond_37
    iget-object v3, p1, Li3e;->a:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_47

    iget-object p1, p1, Li3e;->b:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_48

    :cond_47
    const/4 v1, 0x1

    :cond_48
    const-string p1, "The detector does not exist"

    invoke-static {v1, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_5c

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    goto :goto_5d

    :cond_5c
    move-object p1, v2

    :goto_5d
    iget-object v0, p0, Llfh;->a:Landroidx/camera/view/PreviewView;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    if-eqz p1, :cond_b8

    move-object v3, p1

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const v4, 0x7f7fffff    # Float.MAX_VALUE

    move-object v5, v2

    :cond_7a
    :goto_7a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf33;

    iget-object v7, v6, Lf33;->b:Landroid/graphics/Rect;

    iget-object v8, v6, Lf33;->a:Lwtp;

    invoke-virtual {v8}, Lwtp;->b()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_7a

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_7a

    if-nez v7, :cond_9c

    if-nez v5, :cond_7a

    move-object v5, v6

    goto :goto_7a

    :cond_9c
    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v7

    sub-float v8, v1, v8

    sub-float v7, v0, v7

    mul-float/2addr v8, v8

    mul-float/2addr v7, v7

    add-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    cmpg-float v8, v7, v4

    if-gez v8, :cond_7a

    move-object v5, v6

    move v4, v7

    goto :goto_7a

    :cond_b8
    move-object v5, v2

    :cond_b9
    if-eqz v5, :cond_c4

    iput-object v5, p0, Llfh;->h:Lf33;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Llfh;->i:J

    goto :goto_d9

    :cond_c4
    if-eqz p1, :cond_d9

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v3, p0, Llfh;->i:J

    sget-wide v6, Llfh;->m:J

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v6

    add-long/2addr v6, v3

    cmp-long p1, v0, v6

    if-gez p1, :cond_d9

    iget-object v5, p0, Llfh;->h:Lf33;

    :cond_d9
    :goto_d9
    if-eqz v5, :cond_102

    iget-object p1, v5, Lf33;->a:Lwtp;

    invoke-virtual {p1}, Lwtp;->b()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e5

    const-string v0, ""

    :cond_e5
    invoke-virtual {p1}, Lwtp;->c()I

    move-result v1

    invoke-virtual {p1}, Lwtp;->a()I

    move-result p1

    const/16 v3, 0x1000

    if-gt p1, v3, :cond_f3

    if-nez p1, :cond_f4

    :cond_f3
    const/4 p1, -0x1

    :cond_f4
    const/16 v3, 0x100

    if-ne p1, v3, :cond_fb

    sget-object p1, Lgmi;->a:Lgmi;

    goto :goto_fd

    :cond_fb
    sget-object p1, Lgmi;->b:Lgmi;

    :goto_fd
    invoke-static {v0, v1, p1}, Ly4h;->e(Ljava/lang/String;ILgmi;)Lhmi;

    move-result-object p1

    goto :goto_103

    :cond_102
    move-object p1, v2

    :goto_103
    iget-object v0, p0, Llfh;->j:Lpde;

    new-instance v1, Lffh;

    invoke-direct {v1, p1}, Lffh;-><init>(Lhmi;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    if-eqz v5, :cond_111

    iget-object v2, v5, Lf33;->b:Landroid/graphics/Rect;

    :cond_111
    iget-object p0, p0, Llfh;->g:Lgcl;

    if-nez v2, :cond_119

    invoke-virtual {p0}, Lgcl;->a()V

    goto :goto_11c

    :cond_119
    invoke-virtual {p0, v2}, Lgcl;->b(Landroid/graphics/Rect;)V

    :cond_11c
    :goto_11c
    return-void

    :pswitch_11d
    check-cast p1, Landroid/location/Location;

    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Lnh4;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lc0f;

    if-eqz v0, :cond_14a

    sget-object v0, Lt0i;->b:Lp0i;

    if-eqz p1, :cond_147

    new-instance v3, Luv9;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    sget-object v0, Lebb;->c:Lebb;

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lj06;->m(J)Lebb;

    move-result-object v8

    invoke-direct/range {v3 .. v8}, Luv9;-><init>(DDLebb;)V

    move-object v2, v3

    :cond_147
    invoke-virtual {p0, v2}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_14a
    return-void

    :pswitch_14b
    check-cast p1, Lxh9;

    sget-object v2, Lyh9;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_150
    sget-object v0, Lyh9;->d:Lhkj;

    iget-object v3, p0, Lms7;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-nez v3, :cond_160

    monitor-exit v2

    goto :goto_17a

    :cond_160
    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_168
    .catchall {:try_start_150 .. :try_end_168} :catchall_17d

    :goto_168
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v1, p0, :cond_17a

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqp5;

    invoke-interface {p0, p1}, Lqp5;->accept(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_168

    :cond_17a
    :goto_17a
    return-void

    :goto_17b
    :try_start_17b
    monitor-exit v2
    :try_end_17c
    .catchall {:try_start_17b .. :try_end_17c} :catchall_17d

    throw p0

    :catchall_17d
    move-exception v0

    move-object p0, v0

    goto :goto_17b

    :pswitch_180
    check-cast p1, Lxh9;

    if-nez p1, :cond_18a

    new-instance p1, Lxh9;

    const/4 v0, -0x3

    invoke-direct {p1, v0}, Lxh9;-><init>(I)V

    :cond_18a
    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Ls6h;

    invoke-virtual {p0, p1}, Ls6h;->M(Lxh9;)V

    return-void

    :pswitch_192
    iget-object p0, p0, Lms7;->b:Ljava/lang/Object;

    check-cast p0, Lqp5;

    invoke-interface {p0, p1}, Lqp5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_data_19a
    .packed-switch 0x0
        :pswitch_192
        :pswitch_180
        :pswitch_14b
        :pswitch_11d
        :pswitch_22
    .end packed-switch
.end method
