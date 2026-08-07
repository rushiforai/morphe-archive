.class public final Lcom/google/android/exoplayer2/source/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/h;
.implements Lcom/google/android/exoplayer2/source/h$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/l$b;,
        Lcom/google/android/exoplayer2/source/l$a;,
        Lcom/google/android/exoplayer2/source/l$c;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:[Lcom/google/android/exoplayer2/source/h;

.field public final b:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Ll/xwd0;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/et5;

.field public final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/source/h;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ll/dfj0;",
            "Ll/dfj0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/google/android/exoplayer2/source/h$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/ffj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:[Lcom/google/android/exoplayer2/source/h;

.field public i:Lcom/google/android/exoplayer2/source/r;


# direct methods
.method public varargs constructor <init>(Ll/et5;[J[Lcom/google/android/exoplayer2/source/h;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l;->c:Ll/et5;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/l;->e:Ljava/util/HashMap;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    new-array v1, v0, [Lcom/google/android/exoplayer2/source/r;

    .line 24
    .line 25
    invoke-interface {p1, v1}, Ll/et5;->a([Lcom/google/android/exoplayer2/source/r;)Lcom/google/android/exoplayer2/source/r;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 30
    .line 31
    new-instance p1, Ljava/util/IdentityHashMap;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/IdentityHashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l;->b:Ljava/util/IdentityHashMap;

    .line 37
    .line 38
    new-array p1, v0, [Lcom/google/android/exoplayer2/source/h;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 41
    .line 42
    :goto_0
    array-length p1, p3

    .line 43
    if-ge v0, p1, :cond_1

    .line 44
    .line 45
    aget-wide v1, p2, v0

    .line 46
    .line 47
    const-wide/16 v3, 0x0

    .line 48
    .line 49
    cmp-long p1, v1, v3

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 54
    .line 55
    new-instance v3, Lcom/google/android/exoplayer2/source/l$b;

    .line 56
    .line 57
    aget-object v4, p3, v0

    .line 58
    .line 59
    invoke-direct {v3, v4, v1, v2}, Lcom/google/android/exoplayer2/source/l$b;-><init>(Lcom/google/android/exoplayer2/source/h;J)V

    .line 60
    .line 61
    .line 62
    aput-object v3, p1, v0

    .line 63
    .line 64
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    return-void
.end method


# virtual methods
.method public b(I)Lcom/google/android/exoplayer2/source/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    instance-of p1, p0, Lcom/google/android/exoplayer2/source/l$b;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/google/android/exoplayer2/source/l$b;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/l$b;->b(Lcom/google/android/exoplayer2/source/l$b;)Lcom/google/android/exoplayer2/source/h;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    return-object p0
.end method

.method public c(J)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_0

    .line 18
    .line 19
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/google/android/exoplayer2/source/h;

    .line 26
    .line 27
    invoke-interface {v3, p1, p2}, Lcom/google/android/exoplayer2/source/h;->c(J)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 35
    .line 36
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/r;->c(J)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->d()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public e(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/r;->e(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public g(JLl/nke0;)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    aget-object p0, v0, v2

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 11
    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    :goto_0
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/h;->g(JLl/nke0;)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method

.method public h(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1

    .line 10
    const/4 v0, 0x1

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    if-ge v0, v2, :cond_1

    .line 15
    .line 16
    aget-object v1, v1, v0

    .line 17
    .line 18
    invoke-interface {v1, p1, p2}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    cmp-long v1, v1, p1

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "Unexpected child seekToUs result."

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 p0, 0x0

    .line 35
    .line 36
    return-wide p0

    .line 37
    :cond_1
    return-wide p1
.end method

.method public i()J
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    move-wide v7, v3

    .line 13
    move v6, v5

    .line 14
    :goto_0
    if-ge v6, v2, :cond_8

    .line 15
    .line 16
    aget-object v9, v1, v6

    .line 17
    .line 18
    invoke-interface {v9}, Lcom/google/android/exoplayer2/source/h;->i()J

    .line 19
    .line 20
    .line 21
    move-result-wide v10

    .line 22
    cmp-long v12, v10, v3

    .line 23
    .line 24
    const-wide/16 v13, 0x0

    .line 25
    .line 26
    const-string v15, "Unexpected child seekToUs result."

    .line 27
    .line 28
    if-eqz v12, :cond_5

    .line 29
    .line 30
    cmp-long v12, v7, v3

    .line 31
    .line 32
    if-nez v12, :cond_3

    .line 33
    .line 34
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 35
    .line 36
    array-length v8, v7

    .line 37
    move v12, v5

    .line 38
    :goto_1
    move-wide/from16 v16, v3

    .line 39
    .line 40
    if-ge v12, v8, :cond_2

    .line 41
    .line 42
    aget-object v3, v7, v12

    .line 43
    .line 44
    if-ne v3, v9, :cond_0

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_0
    invoke-interface {v3, v10, v11}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    cmp-long v3, v3, v10

    .line 52
    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    add-int/lit8 v12, v12, 0x1

    .line 56
    .line 57
    move-wide/from16 v3, v16

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-static {v15}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-wide v13

    .line 64
    :cond_2
    :goto_2
    move-wide v7, v10

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move-wide/from16 v16, v3

    .line 67
    .line 68
    cmp-long v3, v10, v7

    .line 69
    .line 70
    if-nez v3, :cond_4

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    const-string v0, "Conflicting discontinuities."

    .line 74
    .line 75
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-wide v13

    .line 79
    :cond_5
    move-wide/from16 v16, v3

    .line 80
    .line 81
    cmp-long v3, v7, v16

    .line 82
    .line 83
    if-eqz v3, :cond_7

    .line 84
    .line 85
    invoke-interface {v9, v7, v8}, Lcom/google/android/exoplayer2/source/h;->h(J)J

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    cmp-long v3, v3, v7

    .line 90
    .line 91
    if-nez v3, :cond_6

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_6
    invoke-static {v15}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-wide v13

    .line 98
    :cond_7
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 99
    .line 100
    move-wide/from16 v3, v16

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_8
    return-wide v7
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->isLoading()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic j(Lcom/google/android/exoplayer2/source/r;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/l;->n(Lcom/google/android/exoplayer2/source/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/google/android/exoplayer2/source/h;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 16
    .line 17
    array-length v0, p1

    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    move v3, v2

    .line 21
    :goto_0
    if-ge v2, v0, :cond_1

    .line 22
    .line 23
    aget-object v4, p1, v2

    .line 24
    .line 25
    invoke-interface {v4}, Lcom/google/android/exoplayer2/source/h;->m()Ll/ffj0;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iget v4, v4, Ll/ffj0;->a:I

    .line 30
    .line 31
    add-int/2addr v3, v4

    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-array p1, v3, [Ll/dfj0;

    .line 36
    .line 37
    move v0, v1

    .line 38
    move v2, v0

    .line 39
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 40
    .line 41
    array-length v4, v3

    .line 42
    if-ge v0, v4, :cond_3

    .line 43
    .line 44
    aget-object v3, v3, v0

    .line 45
    .line 46
    invoke-interface {v3}, Lcom/google/android/exoplayer2/source/h;->m()Ll/ffj0;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget v4, v3, Ll/ffj0;->a:I

    .line 51
    .line 52
    move v5, v1

    .line 53
    :goto_2
    if-ge v5, v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {v3, v5}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    new-instance v7, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v8, ":"

    .line 68
    .line 69
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v8, v6, Ll/dfj0;->b:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    invoke-virtual {v6, v7}, Ll/dfj0;->b(Ljava/lang/String;)Ll/dfj0;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/l;->e:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v8, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    add-int/lit8 v6, v2, 0x1

    .line 91
    .line 92
    aput-object v7, p1, v2

    .line 93
    .line 94
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    move v2, v6

    .line 97
    goto :goto_2

    .line 98
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    new-instance v0, Ll/ffj0;

    .line 102
    .line 103
    invoke-direct {v0, p1}, Ll/ffj0;-><init>([Ll/dfj0;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/l;->g:Ll/ffj0;

    .line 107
    .line 108
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->f:Lcom/google/android/exoplayer2/source/h$a;

    .line 109
    .line 110
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/google/android/exoplayer2/source/h$a;

    .line 115
    .line 116
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/h$a;->l(Lcom/google/android/exoplayer2/source/h;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public m()Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->g:Ll/ffj0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ffj0;

    .line 8
    .line 9
    return-object p0
.end method

.method public n(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->f:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/source/h$a;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p(Lcom/google/android/exoplayer2/source/h$a;J)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l;->f:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->d:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 6
    .line 7
    invoke-static {p1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 11
    .line 12
    array-length v0, p1

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    if-ge v1, v0, :cond_0

    .line 15
    .line 16
    aget-object v2, p1, v1

    .line 17
    .line 18
    invoke-interface {v2, p0, p2, p3}, Lcom/google/android/exoplayer2/source/h;->p(Lcom/google/android/exoplayer2/source/h$a;J)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    array-length v3, v1

    .line 8
    new-array v3, v3, [I

    .line 9
    .line 10
    array-length v4, v1

    .line 11
    new-array v4, v4, [I

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    move v6, v5

    .line 15
    :goto_0
    array-length v7, v1

    .line 16
    if-ge v6, v7, :cond_3

    .line 17
    .line 18
    aget-object v7, v2, v6

    .line 19
    .line 20
    if-nez v7, :cond_0

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v8, v0, Lcom/google/android/exoplayer2/source/l;->b:Ljava/util/IdentityHashMap;

    .line 25
    .line 26
    invoke-virtual {v8, v7}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    move-object v8, v7

    .line 31
    check-cast v8, Ljava/lang/Integer;

    .line 32
    .line 33
    :goto_1
    const/4 v7, -0x1

    .line 34
    if-nez v8, :cond_1

    .line 35
    .line 36
    move v8, v7

    .line 37
    goto :goto_2

    .line 38
    :cond_1
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    :goto_2
    aput v8, v3, v6

    .line 43
    .line 44
    aget-object v8, v1, v6

    .line 45
    .line 46
    if-eqz v8, :cond_2

    .line 47
    .line 48
    invoke-interface {v8}, Ll/vfj0;->h()Ll/dfj0;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    iget-object v7, v7, Ll/dfj0;->b:Ljava/lang/String;

    .line 53
    .line 54
    const-string v8, ":"

    .line 55
    .line 56
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    invoke-virtual {v7, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    aput v7, v4, v6

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_2
    aput v7, v4, v6

    .line 72
    .line 73
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/l;->b:Ljava/util/IdentityHashMap;

    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/util/IdentityHashMap;->clear()V

    .line 79
    .line 80
    .line 81
    array-length v6, v1

    .line 82
    new-array v7, v6, [Ll/xwd0;

    .line 83
    .line 84
    array-length v9, v1

    .line 85
    new-array v13, v9, [Ll/xwd0;

    .line 86
    .line 87
    array-length v9, v1

    .line 88
    new-array v11, v9, [Ll/u9f;

    .line 89
    .line 90
    new-instance v9, Ljava/util/ArrayList;

    .line 91
    .line 92
    iget-object v10, v0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 93
    .line 94
    array-length v10, v10

    .line 95
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    .line 97
    .line 98
    move-wide/from16 v15, p5

    .line 99
    .line 100
    move v10, v5

    .line 101
    :goto_4
    iget-object v12, v0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 102
    .line 103
    array-length v12, v12

    .line 104
    if-ge v10, v12, :cond_e

    .line 105
    .line 106
    move v12, v5

    .line 107
    :goto_5
    array-length v14, v1

    .line 108
    if-ge v12, v14, :cond_6

    .line 109
    .line 110
    aget v14, v3, v12

    .line 111
    .line 112
    if-ne v14, v10, :cond_4

    .line 113
    .line 114
    aget-object v14, v2, v12

    .line 115
    .line 116
    goto :goto_6

    .line 117
    :cond_4
    const/4 v14, 0x0

    .line 118
    :goto_6
    aput-object v14, v13, v12

    .line 119
    .line 120
    aget v14, v4, v12

    .line 121
    .line 122
    if-ne v14, v10, :cond_5

    .line 123
    .line 124
    aget-object v14, v1, v12

    .line 125
    .line 126
    invoke-static {v14}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v14

    .line 130
    check-cast v14, Ll/u9f;

    .line 131
    .line 132
    const/16 v17, 0x0

    .line 133
    .line 134
    invoke-interface {v14}, Ll/vfj0;->h()Ll/dfj0;

    .line 135
    .line 136
    .line 137
    move-result-object v8

    .line 138
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/l;->e:Ljava/util/HashMap;

    .line 139
    .line 140
    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    check-cast v5, Ll/dfj0;

    .line 145
    .line 146
    invoke-static {v5}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    check-cast v5, Ll/dfj0;

    .line 151
    .line 152
    new-instance v8, Lcom/google/android/exoplayer2/source/l$a;

    .line 153
    .line 154
    invoke-direct {v8, v14, v5}, Lcom/google/android/exoplayer2/source/l$a;-><init>(Ll/u9f;Ll/dfj0;)V

    .line 155
    .line 156
    .line 157
    aput-object v8, v11, v12

    .line 158
    .line 159
    goto :goto_7

    .line 160
    :cond_5
    const/16 v17, 0x0

    .line 161
    .line 162
    aput-object v17, v11, v12

    .line 163
    .line 164
    :goto_7
    add-int/lit8 v12, v12, 0x1

    .line 165
    .line 166
    const/4 v5, 0x0

    .line 167
    goto :goto_5

    .line 168
    :cond_6
    const/16 v17, 0x0

    .line 169
    .line 170
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 171
    .line 172
    aget-object v5, v5, v10

    .line 173
    .line 174
    move v12, v10

    .line 175
    move-object v10, v5

    .line 176
    move v5, v12

    .line 177
    move-object/from16 v12, p2

    .line 178
    .line 179
    move-object/from16 v14, p4

    .line 180
    .line 181
    invoke-interface/range {v10 .. v16}, Lcom/google/android/exoplayer2/source/h;->r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J

    .line 182
    .line 183
    .line 184
    move-result-wide v18

    .line 185
    if-nez v5, :cond_7

    .line 186
    .line 187
    move-wide/from16 v15, v18

    .line 188
    .line 189
    goto :goto_8

    .line 190
    :cond_7
    cmp-long v8, v18, v15

    .line 191
    .line 192
    if-nez v8, :cond_d

    .line 193
    .line 194
    :goto_8
    const/4 v8, 0x0

    .line 195
    const/4 v10, 0x0

    .line 196
    :goto_9
    array-length v12, v1

    .line 197
    if-ge v8, v12, :cond_b

    .line 198
    .line 199
    aget v12, v4, v8

    .line 200
    .line 201
    if-ne v12, v5, :cond_8

    .line 202
    .line 203
    aget-object v10, v13, v8

    .line 204
    .line 205
    invoke-static {v10}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    check-cast v10, Ll/xwd0;

    .line 210
    .line 211
    aget-object v12, v13, v8

    .line 212
    .line 213
    aput-object v12, v7, v8

    .line 214
    .line 215
    iget-object v12, v0, Lcom/google/android/exoplayer2/source/l;->b:Ljava/util/IdentityHashMap;

    .line 216
    .line 217
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v14

    .line 221
    invoke-virtual {v12, v10, v14}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    const/4 v10, 0x1

    .line 225
    goto :goto_b

    .line 226
    :cond_8
    aget v12, v3, v8

    .line 227
    .line 228
    if-ne v12, v5, :cond_a

    .line 229
    .line 230
    aget-object v12, v13, v8

    .line 231
    .line 232
    if-nez v12, :cond_9

    .line 233
    .line 234
    const/4 v14, 0x1

    .line 235
    goto :goto_a

    .line 236
    :cond_9
    const/4 v14, 0x0

    .line 237
    :goto_a
    invoke-static {v14}, Ll/w11;->g(Z)V

    .line 238
    .line 239
    .line 240
    :cond_a
    :goto_b
    add-int/lit8 v8, v8, 0x1

    .line 241
    .line 242
    goto :goto_9

    .line 243
    :cond_b
    if-eqz v10, :cond_c

    .line 244
    .line 245
    iget-object v8, v0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 246
    .line 247
    aget-object v8, v8, v5

    .line 248
    .line 249
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    :cond_c
    add-int/lit8 v10, v5, 0x1

    .line 253
    .line 254
    const/4 v5, 0x0

    .line 255
    goto/16 :goto_4

    .line 256
    .line 257
    :cond_d
    const-string v0, "Children enabled at different positions."

    .line 258
    .line 259
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    const-wide/16 v0, 0x0

    .line 263
    .line 264
    return-wide v0

    .line 265
    :cond_e
    move v1, v5

    .line 266
    invoke-static {v7, v1, v2, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 267
    .line 268
    .line 269
    new-array v1, v1, [Lcom/google/android/exoplayer2/source/h;

    .line 270
    .line 271
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    check-cast v1, [Lcom/google/android/exoplayer2/source/h;

    .line 276
    .line 277
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 278
    .line 279
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/l;->c:Ll/et5;

    .line 280
    .line 281
    invoke-interface {v2, v1}, Ll/et5;->a([Lcom/google/android/exoplayer2/source/r;)Lcom/google/android/exoplayer2/source/r;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/l;->i:Lcom/google/android/exoplayer2/source/r;

    .line 286
    .line 287
    return-wide v15
.end method

.method public s()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->a:[Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2}, Lcom/google/android/exoplayer2/source/h;->s()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public t(JZ)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l;->h:[Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2, p1, p2, p3}, Lcom/google/android/exoplayer2/source/h;->t(JZ)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method
