.class public final Ll/feg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ll/txg0;

.field public static volatile j:Ll/feg0;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Landroid/content/Context;

.field public final c:Ll/jeg0;

.field public final d:Ll/cng0;

.field public final e:Ll/zyg0;

.field public final f:Ljava/util/WeakHashMap;

.field public final g:Ljava/util/WeakHashMap;

.field public final h:Ljava/lang/ref/ReferenceQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/txg0;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/txg0;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/feg0;->i:Ll/txg0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    sput-object v0, Ll/feg0;->j:Ll/feg0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/jeg0;Ll/cng0;Ll/zyg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/feg0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/feg0;->c:Ll/jeg0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/feg0;->d:Ll/cng0;

    .line 9
    .line 10
    new-instance p3, Ljava/util/ArrayList;

    .line 11
    .line 12
    const/4 v0, 0x7

    .line 13
    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/l0h0;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/l0h0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/ohg0;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ll/ohg0;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/vxg0;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/vxg0;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/pmg0;

    .line 41
    .line 42
    invoke-direct {v0, p1}, Ll/pmg0;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/ong0;

    .line 49
    .line 50
    invoke-direct {v0, p1}, Ll/ong0;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/rgg0;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Ll/rgg0;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    new-instance p1, Ll/tvg0;

    .line 65
    .line 66
    iget-object p2, p2, Ll/jeg0;->c:Ll/nxg0;

    .line 67
    .line 68
    invoke-direct {p1, p2, p4}, Ll/tvg0;-><init>(Ll/nxg0;Ll/zyg0;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ll/feg0;->a:Ljava/util/List;

    .line 79
    .line 80
    iput-object p4, p0, Ll/feg0;->e:Ll/zyg0;

    .line 81
    .line 82
    new-instance p1, Ljava/util/WeakHashMap;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 88
    .line 89
    new-instance p1, Ljava/util/WeakHashMap;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Ll/feg0;->g:Ljava/util/WeakHashMap;

    .line 95
    .line 96
    new-instance p1, Ljava/lang/ref/ReferenceQueue;

    .line 97
    .line 98
    invoke-direct {p1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object p1, p0, Ll/feg0;->h:Ljava/lang/ref/ReferenceQueue;

    .line 102
    .line 103
    new-instance p0, Ll/yyg0;

    .line 104
    .line 105
    sget-object p2, Ll/feg0;->i:Ll/txg0;

    .line 106
    .line 107
    invoke-direct {p0, p1, p2}, Ll/yyg0;-><init>(Ljava/lang/ref/ReferenceQueue;Landroid/os/Handler;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 111
    .line 112
    .line 113
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;ILl/wqg0;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-boolean p4, p3, Ll/wqg0;->h:Z

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean p4, p3, Ll/wqg0;->g:Z

    .line 7
    .line 8
    if-nez p4, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p0, p4}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    :cond_1
    if-eqz p1, :cond_4

    .line 20
    .line 21
    if-eqz p2, :cond_3

    .line 22
    .line 23
    check-cast p3, Ll/vhg0;

    .line 24
    .line 25
    iget-object p0, p3, Ll/wqg0;->c:Ll/ljg0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Landroid/widget/ImageView;

    .line 32
    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_2
    iget-object p3, p3, Ll/wqg0;->a:Ll/feg0;

    .line 37
    .line 38
    iget-object p3, p3, Ll/feg0;->b:Landroid/content/Context;

    .line 39
    .line 40
    invoke-static {p0, p3, p1, p2}, Ll/big0;->b(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    const-string p0, "LoadedFrom cannot be null."

    .line 45
    .line 46
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_4
    invoke-virtual {p3}, Ll/wqg0;->a()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final b(Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/yuq0;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/wqg0;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move-object v1, v0

    .line 15
    check-cast v1, Ll/vhg0;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iput-boolean v2, v1, Ll/wqg0;->h:Z

    .line 19
    .line 20
    iget-object v1, p0, Ll/feg0;->c:Ll/jeg0;

    .line 21
    .line 22
    iget-object v1, v1, Ll/jeg0;->h:Ll/nvg0;

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    instance-of v0, p1, Landroid/widget/ImageView;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    check-cast p1, Landroid/widget/ImageView;

    .line 37
    .line 38
    iget-object p0, p0, Ll/feg0;->g:Ljava/util/WeakHashMap;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance p0, Ljava/lang/ClassCastException;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :cond_2
    :goto_0
    return-void
.end method
