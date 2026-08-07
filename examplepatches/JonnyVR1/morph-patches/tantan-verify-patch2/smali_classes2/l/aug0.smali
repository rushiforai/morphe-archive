.class public final Ll/aug0;
.super Ll/tjg0;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Landroid/net/Uri;

.field public final e:Ljava/util/Map;

.field public f:Ll/bog0;

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:Ljava/lang/Integer;

.field public final m:Z

.field public final n:Z

.field public final o:I

.field public volatile p:Ll/eog0;

.field public final q:Ljava/util/concurrent/atomic/AtomicLong;

.field public final r:Z

.field public final s:Ll/mhg0;

.field public final t:Ljava/io/File;

.field public final u:Ljava/io/File;

.field public v:Ljava/io/File;

.field public w:Ljava/lang/String;

.field public final x:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/net/Uri;IIIIIZILjava/util/HashMap;Ljava/lang/String;ZLjava/lang/Boolean;Ljava/lang/Integer;Ljava/util/HashMap;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/tjg0;-><init>()V

    .line 2
    iput-object p1, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Ll/aug0;->d:Landroid/net/Uri;

    .line 4
    iput p3, p0, Ll/aug0;->g:I

    .line 5
    iput p4, p0, Ll/aug0;->h:I

    .line 6
    iput p5, p0, Ll/aug0;->i:I

    .line 7
    iput p6, p0, Ll/aug0;->j:I

    .line 8
    iput p7, p0, Ll/aug0;->k:I

    .line 9
    iput-boolean p8, p0, Ll/aug0;->n:Z

    .line 10
    iput p9, p0, Ll/aug0;->o:I

    .line 11
    iput-object p10, p0, Ll/aug0;->e:Ljava/util/Map;

    .line 12
    new-instance p3, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p3, p0, Ll/aug0;->q:Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    iput-boolean p12, p0, Ll/aug0;->m:Z

    move-object/from16 p3, p14

    .line 14
    iput-object p3, p0, Ll/aug0;->l:Ljava/lang/Integer;

    move-object/from16 p3, p15

    .line 15
    iput-object p3, p0, Ll/aug0;->x:Ljava/util/Map;

    .line 16
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p3

    const-string p4, "file"

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 p4, 0x0

    const/4 p5, 0x0

    if-eqz p3, :cond_10

    .line 17
    new-instance p3, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p6

    invoke-direct {p3, p6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    if-eqz p13, :cond_8

    .line 18
    invoke-virtual {p13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p6

    if-eqz p6, :cond_3

    .line 19
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p6

    if-eqz p6, :cond_1

    invoke-virtual {p3}, Ljava/io/File;->isFile()Z

    move-result p6

    if-nez p6, :cond_0

    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "If you want filename from response please make sure you provide path is directory "

    .line 21
    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    throw p4

    .line 22
    :cond_1
    :goto_0
    invoke-static {p11}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result p6

    if-nez p6, :cond_2

    move-object p6, p4

    goto :goto_1

    :cond_2
    move-object p6, p11

    .line 23
    :goto_1
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    :goto_2
    move-object v0, p6

    :goto_3
    move-object p6, p13

    goto/16 :goto_7

    .line 24
    :cond_3
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p6

    if-eqz p6, :cond_5

    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result p6

    if-eqz p6, :cond_5

    invoke-static {p11}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result p6

    if-nez p6, :cond_4

    goto :goto_4

    .line 25
    :cond_4
    const-string p0, "If you don\'t want filename from response please make sure you have already provided valid filename or not directory path "

    .line 26
    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    throw p4

    .line 27
    :cond_5
    :goto_4
    invoke-static {p11}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result p6

    if-eqz p6, :cond_7

    .line 28
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p6

    .line 29
    invoke-virtual {p3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p3

    if-nez p3, :cond_6

    .line 30
    new-instance p3, Ljava/io/File;

    const-string v0, "/"

    invoke-direct {p3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    :cond_6
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    goto :goto_2

    .line 32
    :cond_7
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    move-object v0, p11

    goto :goto_3

    .line 33
    :cond_8
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p6

    if-eqz p6, :cond_9

    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result p6

    if-eqz p6, :cond_9

    .line 34
    sget-object p6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    :goto_5
    move-object v0, p11

    goto :goto_7

    .line 36
    :cond_9
    sget-object p6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 38
    invoke-static {p11}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_6

    .line 39
    :cond_a
    const-string p0, "Uri already provided filename!"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw p4

    .line 40
    :cond_b
    :goto_6
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-virtual {p3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p3

    if-nez p3, :cond_c

    .line 42
    new-instance p3, Ljava/io/File;

    const-string v1, "/"

    invoke-direct {p3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    :cond_c
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    goto :goto_7

    .line 44
    :cond_d
    invoke-static {p11}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 45
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-virtual {p3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p3

    if-nez p3, :cond_e

    .line 47
    new-instance p3, Ljava/io/File;

    const-string v1, "/"

    invoke-direct {p3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 48
    :cond_e
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    goto :goto_7

    .line 49
    :cond_f
    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    goto :goto_5

    .line 50
    :goto_7
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    iput-boolean p3, p0, Ll/aug0;->r:Z

    goto :goto_8

    .line 51
    :cond_10
    iput-boolean p5, p0, Ll/aug0;->r:Z

    .line 52
    new-instance p3, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p6

    invoke-direct {p3, p6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    move-object v0, p11

    .line 53
    :goto_8
    invoke-static {v0}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_11

    .line 54
    new-instance p3, Ll/mhg0;

    invoke-direct {p3}, Ll/mhg0;-><init>()V

    iput-object p3, p0, Ll/aug0;->s:Ll/mhg0;

    .line 55
    iget-object p3, p0, Ll/aug0;->u:Ljava/io/File;

    iput-object p3, p0, Ll/aug0;->t:Ljava/io/File;

    goto :goto_9

    .line 56
    :cond_11
    new-instance p3, Ll/mhg0;

    invoke-direct {p3, v0}, Ll/mhg0;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Ll/aug0;->s:Ll/mhg0;

    .line 57
    new-instance p3, Ljava/io/File;

    iget-object p6, p0, Ll/aug0;->u:Ljava/io/File;

    invoke-direct {p3, p6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p3, p0, Ll/aug0;->v:Ljava/io/File;

    .line 58
    iput-object p3, p0, Ll/aug0;->t:Ljava/io/File;

    .line 59
    :goto_9
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    move-result-object p3

    .line 60
    iget-object p3, p3, Ll/jwg0;->c:Ll/agg0;

    .line 61
    iget-object p3, p3, Ll/agg0;->b:Ll/izg0;

    monitor-enter p3

    .line 62
    :try_start_0
    iget-object p6, p3, Ll/izg0;->c:Ll/fmg0;

    .line 63
    iget-object p6, p6, Ll/fmg0;->a:Ljava/util/HashMap;

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    iget-object p1, p0, Ll/aug0;->s:Ll/mhg0;

    .line 68
    iget-object p1, p1, Ll/mhg0;->a:Ljava/lang/String;

    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 70
    invoke-virtual {p6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_12

    move-object p4, p1

    :cond_12
    if-eqz p4, :cond_13

    .line 71
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p1

    monitor-exit p3

    goto/16 :goto_d

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_e

    .line 72
    :cond_13
    iget-object p1, p3, Ll/izg0;->a:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    move p2, p5

    :goto_a
    if-ge p2, p1, :cond_15

    .line 73
    iget-object p4, p3, Ll/izg0;->a:Landroid/util/SparseArray;

    invoke-virtual {p4, p2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ll/bog0;

    if-eqz p4, :cond_14

    .line 74
    invoke-virtual {p4, p0}, Ll/bog0;->b(Ll/aug0;)Z

    move-result p6

    if-eqz p6, :cond_14

    .line 75
    iget p1, p4, Ll/bog0;->a:I

    monitor-exit p3

    goto :goto_d

    :cond_14
    add-int/lit8 p2, p2, 0x1

    goto :goto_a

    .line 76
    :cond_15
    iget-object p1, p3, Ll/izg0;->d:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    :goto_b
    if-ge p5, p1, :cond_18

    .line 77
    iget-object p2, p3, Ll/izg0;->d:Landroid/util/SparseArray;

    invoke-virtual {p2, p5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ll/tjg0;

    if-nez p2, :cond_16

    goto :goto_c

    .line 78
    :cond_16
    invoke-virtual {p2, p0}, Ll/tjg0;->b(Ll/aug0;)Z

    move-result p4

    if-eqz p4, :cond_17

    invoke-virtual {p2}, Ll/tjg0;->g()I

    move-result p1

    monitor-exit p3

    goto :goto_d

    :cond_17
    :goto_c
    add-int/lit8 p5, p5, 0x1

    goto :goto_b

    .line 79
    :cond_18
    invoke-virtual {p3}, Ll/izg0;->i()I

    move-result p1

    .line 80
    iget-object p2, p3, Ll/izg0;->d:Landroid/util/SparseArray;

    .line 81
    new-instance p4, Ll/xng0;

    invoke-direct {p4, p1, p0}, Ll/xng0;-><init>(ILl/aug0;)V

    .line 82
    invoke-virtual {p2, p1, p4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 83
    iget-object p2, p3, Ll/izg0;->c:Ll/fmg0;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    iget-object p5, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 86
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    iget-object p5, p0, Ll/aug0;->d:Landroid/net/Uri;

    .line 88
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    iget-object p5, p0, Ll/aug0;->s:Ll/mhg0;

    .line 90
    iget-object p5, p5, Ll/mhg0;->a:Ljava/lang/String;

    .line 91
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 92
    iget-object p5, p2, Ll/fmg0;->a:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-virtual {p5, p4, p6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    iget-object p2, p2, Ll/fmg0;->b:Landroid/util/SparseArray;

    invoke-virtual {p2, p1, p4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 94
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    :goto_d
    iput p1, p0, Ll/aug0;->b:I

    return-void

    .line 96
    :goto_e
    monitor-exit p3

    throw p0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aug0;->s:Ll/mhg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mhg0;->a:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/aug0;

    .line 2
    .line 3
    iget p1, p1, Ll/aug0;->g:I

    .line 4
    .line 5
    iget p0, p0, Ll/aug0;->g:I

    .line 6
    .line 7
    sub-int/2addr p1, p0

    .line 8
    return p1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, p1, :cond_2

    .line 3
    .line 4
    instance-of v1, p1, Ll/aug0;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    check-cast p1, Ll/aug0;

    .line 9
    .line 10
    iget v1, p1, Ll/aug0;->b:I

    .line 11
    .line 12
    iget v2, p0, Ll/aug0;->b:I

    .line 13
    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Ll/tjg0;->b(Ll/aug0;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_2
    return v0
.end method

.method public final f()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aug0;->u:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/aug0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aug0;->t:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/aug0;->t:Ljava/io/File;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/aug0;->s:Ll/mhg0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/mhg0;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public final i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()Ljava/io/File;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aug0;->s:Ll/mhg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mhg0;->a:Ljava/lang/String;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/aug0;->v:Ljava/io/File;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    new-instance v1, Ljava/io/File;

    .line 14
    .line 15
    iget-object v2, p0, Ll/aug0;->u:Ljava/io/File;

    .line 16
    .line 17
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/aug0;->v:Ljava/io/File;

    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Ll/aug0;->v:Ljava/io/File;

    .line 23
    .line 24
    return-object p0
.end method

.method public final m(Ll/eog0;)V
    .locals 14

    .line 1
    iput-object p1, p0, Ll/aug0;->p:Ll/eog0;

    .line 2
    .line 3
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Ll/jwg0;->a:Ll/ieg0;

    .line 8
    .line 9
    iget-object v0, p1, Ll/ieg0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 12
    .line 13
    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Ll/aug0;->m:Z

    .line 19
    .line 20
    if-eqz v0, :cond_a

    .line 21
    .line 22
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Ll/jwg0;->c:Ll/agg0;

    .line 27
    .line 28
    iget v1, p0, Ll/aug0;->b:I

    .line 29
    .line 30
    iget-object v2, v0, Ll/agg0;->b:Ll/izg0;

    .line 31
    .line 32
    iget-object v2, v2, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ll/bog0;

    .line 39
    .line 40
    iget-object v2, p0, Ll/aug0;->s:Ll/mhg0;

    .line 41
    .line 42
    iget-object v2, v2, Ll/mhg0;->a:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v3, p0, Ll/aug0;->u:Ljava/io/File;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/aug0;->j()Ljava/io/File;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const-wide/16 v5, 0x0

    .line 51
    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget-boolean v0, v1, Ll/bog0;->i:Z

    .line 55
    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/bog0;->c()J

    .line 59
    .line 60
    .line 61
    move-result-wide v7

    .line 62
    cmp-long v0, v7, v5

    .line 63
    .line 64
    if-gtz v0, :cond_0

    .line 65
    .line 66
    goto/16 :goto_4

    .line 67
    .line 68
    :catchall_0
    move-exception v0

    .line 69
    move-object p0, v0

    .line 70
    goto/16 :goto_7

    .line 71
    .line 72
    :cond_0
    if-eqz v4, :cond_1

    .line 73
    .line 74
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v4, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/bog0;->e()J

    .line 91
    .line 92
    .line 93
    move-result-wide v7

    .line 94
    invoke-virtual {v1}, Ll/bog0;->c()J

    .line 95
    .line 96
    .line 97
    move-result-wide v9

    .line 98
    cmp-long v0, v7, v9

    .line 99
    .line 100
    if-nez v0, :cond_1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    if-nez v2, :cond_2

    .line 104
    .line 105
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_2

    .line 120
    .line 121
    goto/16 :goto_4

    .line 122
    .line 123
    :cond_2
    if-eqz v4, :cond_a

    .line 124
    .line 125
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v4, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_a

    .line 134
    .line 135
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 136
    .line 137
    .line 138
    goto/16 :goto_4

    .line 139
    .line 140
    :cond_3
    iget v1, p0, Ll/aug0;->b:I

    .line 141
    .line 142
    iget-object v2, v0, Ll/agg0;->b:Ll/izg0;

    .line 143
    .line 144
    iget-object v2, v2, Ll/izg0;->f:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    goto/16 :goto_4

    .line 157
    .line 158
    :cond_4
    if-eqz v4, :cond_5

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_5

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_5
    iget-object v1, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v0, v0, Ll/agg0;->b:Ll/izg0;

    .line 170
    .line 171
    iget-object v0, v0, Ll/izg0;->b:Ljava/util/HashMap;

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Ljava/lang/String;

    .line 178
    .line 179
    if-eqz v0, :cond_a

    .line 180
    .line 181
    new-instance v1, Ljava/io/File;

    .line 182
    .line 183
    invoke-direct {v1, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_a

    .line 191
    .line 192
    :goto_0
    iget-object v0, p0, Ll/aug0;->s:Ll/mhg0;

    .line 193
    .line 194
    iget-object v0, v0, Ll/mhg0;->a:Ljava/lang/String;

    .line 195
    .line 196
    if-nez v0, :cond_7

    .line 197
    .line 198
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iget-object v0, v0, Ll/jwg0;->g:Ll/nmg0;

    .line 203
    .line 204
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iget-object v0, v0, Ll/jwg0;->c:Ll/agg0;

    .line 209
    .line 210
    iget-object v1, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 211
    .line 212
    iget-object v0, v0, Ll/agg0;->b:Ll/izg0;

    .line 213
    .line 214
    iget-object v0, v0, Ll/izg0;->b:Ljava/util/HashMap;

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ljava/lang/String;

    .line 221
    .line 222
    if-nez v0, :cond_6

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_6
    iget-object v1, p0, Ll/aug0;->s:Ll/mhg0;

    .line 226
    .line 227
    iput-object v0, v1, Ll/mhg0;->a:Ljava/lang/String;

    .line 228
    .line 229
    :cond_7
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iget-object v0, v0, Ll/jwg0;->g:Ll/nmg0;

    .line 234
    .line 235
    iget-object v0, p1, Ll/ieg0;->i:Ll/ehg0;

    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 238
    .line 239
    .line 240
    new-instance v0, Ll/bog0;

    .line 241
    .line 242
    iget v1, p0, Ll/aug0;->b:I

    .line 243
    .line 244
    iget-object v2, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 245
    .line 246
    iget-object v3, p0, Ll/aug0;->u:Ljava/io/File;

    .line 247
    .line 248
    iget-object v4, p0, Ll/aug0;->s:Ll/mhg0;

    .line 249
    .line 250
    iget-object v4, v4, Ll/mhg0;->a:Ljava/lang/String;

    .line 251
    .line 252
    invoke-direct {v0, v1, v2, v3, v4}, Ll/bog0;-><init>(ILjava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    iget-object v1, p0, Ll/aug0;->d:Landroid/net/Uri;

    .line 256
    .line 257
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    const-string v2, "content"

    .line 262
    .line 263
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_8

    .line 268
    .line 269
    iget-object v1, p0, Ll/aug0;->d:Landroid/net/Uri;

    .line 270
    .line 271
    invoke-static {v1}, Ll/ytg0;->a(Landroid/net/Uri;)J

    .line 272
    .line 273
    .line 274
    move-result-wide v1

    .line 275
    :goto_1
    move-wide v5, v1

    .line 276
    goto :goto_2

    .line 277
    :cond_8
    invoke-virtual {p0}, Ll/aug0;->j()Ljava/io/File;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    if-nez v1, :cond_9

    .line 282
    .line 283
    invoke-virtual {p0}, Ll/aug0;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    :goto_2
    move-wide v10, v5

    .line 287
    goto :goto_3

    .line 288
    :cond_9
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 289
    .line 290
    .line 291
    move-result-wide v1

    .line 292
    goto :goto_1

    .line 293
    :goto_3
    new-instance v7, Ll/akg0;

    .line 294
    .line 295
    const-wide/16 v8, 0x0

    .line 296
    .line 297
    move-wide v12, v10

    .line 298
    invoke-direct/range {v7 .. v13}, Ll/akg0;-><init>(JJJ)V

    .line 299
    .line 300
    .line 301
    iget-object v1, v0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 302
    .line 303
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    iput-object v0, p0, Ll/aug0;->f:Ll/bog0;

    .line 307
    .line 308
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iget-object v0, v0, Ll/jwg0;->b:Ll/d0h0;

    .line 313
    .line 314
    iget-object v0, v0, Ll/d0h0;->a:Ll/oyg0;

    .line 315
    .line 316
    const/4 v1, 0x1

    .line 317
    const/4 v2, 0x0

    .line 318
    invoke-virtual {v0, p0, v1, v2}, Ll/oyg0;->d(Ll/aug0;ILjava/lang/Exception;)V

    .line 319
    .line 320
    .line 321
    monitor-exit p1

    .line 322
    goto :goto_6

    .line 323
    :cond_a
    :goto_4
    iget-object v0, p1, Ll/ieg0;->b:Ljava/util/ArrayList;

    .line 324
    .line 325
    invoke-virtual {p1, p0, v0}, Ll/ieg0;->g(Ll/aug0;Ljava/util/Collection;)Z

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-nez v0, :cond_d

    .line 330
    .line 331
    iget-object v0, p1, Ll/ieg0;->c:Ljava/util/ArrayList;

    .line 332
    .line 333
    invoke-virtual {p1, p0, v0}, Ll/ieg0;->g(Ll/aug0;Ljava/util/Collection;)Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    if-nez v0, :cond_d

    .line 338
    .line 339
    iget-object v0, p1, Ll/ieg0;->d:Ljava/util/ArrayList;

    .line 340
    .line 341
    invoke-virtual {p1, p0, v0}, Ll/ieg0;->g(Ll/aug0;Ljava/util/Collection;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-eqz v0, :cond_b

    .line 346
    .line 347
    goto :goto_5

    .line 348
    :cond_b
    iget-object v0, p1, Ll/ieg0;->b:Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    invoke-virtual {p1, p0}, Ll/ieg0;->c(Ll/aug0;)V

    .line 355
    .line 356
    .line 357
    iget-object p0, p1, Ll/ieg0;->b:Ljava/util/ArrayList;

    .line 358
    .line 359
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 360
    .line 361
    .line 362
    move-result p0

    .line 363
    if-eq v0, p0, :cond_c

    .line 364
    .line 365
    iget-object p0, p1, Ll/ieg0;->b:Ljava/util/ArrayList;

    .line 366
    .line 367
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 368
    .line 369
    .line 370
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 371
    goto :goto_6

    .line 372
    :cond_c
    monitor-exit p1

    .line 373
    goto :goto_6

    .line 374
    :cond_d
    :goto_5
    monitor-exit p1

    .line 375
    :goto_6
    iget-object p0, p1, Ll/ieg0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 376
    .line 377
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 378
    .line 379
    .line 380
    return-void

    .line 381
    :goto_7
    monitor-exit p1

    .line 382
    throw p0
.end method

.method public final n()V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/jwg0;->a:Ll/ieg0;

    .line 6
    .line 7
    iget-object v1, v0, Ll/ieg0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 10
    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    :try_start_1
    invoke-virtual {v0, p0, v1, v2}, Ll/ieg0;->d(Ll/aug0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 24
    .line 25
    .line 26
    :try_start_2
    invoke-virtual {v0, v1, v2}, Ll/ieg0;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-gtz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit v0

    .line 42
    iget-object p0, v0, Ll/ieg0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ll/ieg0;->h()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    :try_start_3
    invoke-virtual {v0, v1, v2}, Ll/ieg0;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 53
    .line 54
    .line 55
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 56
    :goto_1
    monitor-exit v0

    .line 57
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "@"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ll/aug0;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/aug0;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/aug0;->u:Ljava/io/File;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "/"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/aug0;->s:Ll/mhg0;

    .line 49
    .line 50
    iget-object p0, p0, Ll/mhg0;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method
