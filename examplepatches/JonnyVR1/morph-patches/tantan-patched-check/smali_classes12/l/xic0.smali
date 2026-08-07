.class public final Ll/xic0;
.super Ll/s7;
.source "SourceFile"


# static fields
.field public static final i:[I

.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I

.field public static final n:[I

.field public static final o:[[I


# instance fields
.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nf60;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nf60;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    const/16 v0, 0x46

    .line 2
    .line 3
    const/16 v1, 0x7e

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/16 v3, 0xa

    .line 7
    .line 8
    const/16 v4, 0x22

    .line 9
    .line 10
    filled-new-array {v2, v3, v4, v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Ll/xic0;->i:[I

    .line 15
    .line 16
    const/16 v0, 0x30

    .line 17
    .line 18
    const/16 v1, 0x51

    .line 19
    .line 20
    const/4 v3, 0x4

    .line 21
    const/16 v4, 0x14

    .line 22
    .line 23
    filled-new-array {v3, v4, v0, v1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/xic0;->j:[I

    .line 28
    .line 29
    const/16 v0, 0x7df

    .line 30
    .line 31
    const/16 v1, 0xa9b

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    const/16 v5, 0xa1

    .line 35
    .line 36
    const/16 v6, 0x3c1

    .line 37
    .line 38
    filled-new-array {v4, v5, v6, v0, v1}, [I

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sput-object v0, Ll/xic0;->k:[I

    .line 43
    .line 44
    const/16 v0, 0x40c

    .line 45
    .line 46
    const/16 v1, 0x5ec

    .line 47
    .line 48
    const/16 v5, 0x150

    .line 49
    .line 50
    filled-new-array {v4, v5, v0, v1}, [I

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/xic0;->l:[I

    .line 55
    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    const/4 v4, 0x3

    .line 60
    filled-new-array {v0, v1, v3, v4, v2}, [I

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    sput-object v5, Ll/xic0;->m:[I

    .line 65
    .line 66
    const/4 v5, 0x2

    .line 67
    filled-new-array {v5, v3, v1, v0}, [I

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    sput-object v6, Ll/xic0;->n:[I

    .line 72
    .line 73
    filled-new-array {v4, v0, v5, v2}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    const/4 v6, 0x5

    .line 78
    filled-new-array {v4, v6, v6, v2}, [I

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    const/4 v9, 0x7

    .line 83
    move v10, v9

    .line 84
    filled-new-array {v4, v4, v10, v2}, [I

    .line 85
    .line 86
    .line 87
    move-result-object v9

    .line 88
    const/16 v11, 0x9

    .line 89
    .line 90
    move v12, v10

    .line 91
    filled-new-array {v4, v2, v11, v2}, [I

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    filled-new-array {v5, v12, v3, v2}, [I

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    filled-new-array {v5, v6, v1, v2}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    filled-new-array {v5, v4, v0, v2}, [I

    .line 104
    .line 105
    .line 106
    move-result-object v13

    .line 107
    filled-new-array {v2, v6, v12, v2}, [I

    .line 108
    .line 109
    .line 110
    move-result-object v14

    .line 111
    filled-new-array {v2, v4, v11, v2}, [I

    .line 112
    .line 113
    .line 114
    move-result-object v15

    .line 115
    move-object v12, v1

    .line 116
    move-object v11, v3

    .line 117
    filled-new-array/range {v7 .. v15}, [[I

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sput-object v0, Ll/xic0;->o:[[I

    .line 122
    .line 123
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/s7;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xic0;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/xic0;->h:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static q(Ljava/util/Collection;Ll/nf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ll/nf60;",
            ">;",
            "Ll/nf60;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/nf60;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/q5c;->b()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p1}, Ll/q5c;->b()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-ne v2, v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/nf60;->e()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static s(Ll/nf60;Ll/nf60;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/q5c;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/q5c;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    mul-int/lit8 v1, v1, 0x10

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    rem-int/lit8 v0, v0, 0x4f

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/nf60;->d()Ll/joi;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/joi;->c()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    mul-int/lit8 p0, p0, 0x9

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/nf60;->d()Ll/joi;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/joi;->c()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/2addr p0, p1

    .line 33
    const/16 p1, 0x48

    .line 34
    .line 35
    if-le p0, p1, :cond_0

    .line 36
    .line 37
    add-int/lit8 p0, p0, -0x1

    .line 38
    .line 39
    :cond_0
    const/16 p1, 0x8

    .line 40
    .line 41
    if-le p0, p1, :cond_1

    .line 42
    .line 43
    add-int/lit8 p0, p0, -0x1

    .line 44
    .line 45
    :cond_1
    if-ne v0, p0, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public static t(Ll/nf60;Ll/nf60;)Ll/r5d0;
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/q5c;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const-wide/32 v2, 0x453af5

    .line 7
    .line 8
    .line 9
    mul-long/2addr v0, v2

    .line 10
    invoke-virtual {p1}, Ll/q5c;->b()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    int-to-long v2, v2

    .line 15
    add-long/2addr v0, v2

    .line 16
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const/16 v2, 0xe

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/16 v3, 0xd

    .line 32
    .line 33
    rsub-int/lit8 v2, v2, 0xd

    .line 34
    .line 35
    :goto_0
    const/16 v4, 0x30

    .line 36
    .line 37
    if-lez v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    add-int/lit8 v2, v2, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    move v2, v0

    .line 50
    move v5, v2

    .line 51
    :goto_1
    if-ge v2, v3, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    sub-int/2addr v6, v4

    .line 58
    and-int/lit8 v7, v2, 0x1

    .line 59
    .line 60
    if-nez v7, :cond_1

    .line 61
    .line 62
    mul-int/lit8 v6, v6, 0x3

    .line 63
    .line 64
    :cond_1
    add-int/2addr v5, v6

    .line 65
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const/16 v2, 0xa

    .line 69
    .line 70
    rem-int/2addr v5, v2

    .line 71
    rsub-int/lit8 v3, v5, 0xa

    .line 72
    .line 73
    if-ne v3, v2, :cond_3

    .line 74
    .line 75
    move v3, v0

    .line 76
    :cond_3
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/nf60;->d()Ll/joi;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/joi;->a()[Ll/s5d0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1}, Ll/nf60;->d()Ll/joi;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ll/joi;->a()[Ll/s5d0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v2, Ll/r5d0;

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    aget-object v3, p0, v0

    .line 102
    .line 103
    const/4 v4, 0x1

    .line 104
    aget-object p0, p0, v4

    .line 105
    .line 106
    aget-object v0, p1, v0

    .line 107
    .line 108
    aget-object p1, p1, v4

    .line 109
    .line 110
    filled-new-array {v3, p0, v0, p1}, [Ll/s5d0;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget-object p1, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    .line 115
    .line 116
    const/4 v0, 0x0

    .line 117
    invoke-direct {v2, v1, v0, p0, p1}, Ll/r5d0;-><init>(Ljava/lang/String;[B[Ll/s5d0;Lcom/google/zxing/BarcodeFormat;)V

    .line 118
    .line 119
    .line 120
    return-object v2
.end method


# virtual methods
.method public b(ILl/b13;Ljava/util/Map;)Ll/r5d0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/b13;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, v0, p1, p3}, Ll/xic0;->v(Ll/b13;ZILjava/util/Map;)Ll/nf60;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Ll/xic0;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/xic0;->q(Ljava/util/Collection;Ll/nf60;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ll/b13;->q()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, p2, v0, p1, p3}, Ll/xic0;->v(Ll/b13;ZILjava/util/Map;)Ll/nf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p3, p0, Ll/xic0;->h:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p3, p1}, Ll/xic0;->q(Ljava/util/Collection;Ll/nf60;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ll/b13;->q()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/xic0;->g:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/nf60;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/nf60;->c()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    if-le p3, v0, :cond_0

    .line 50
    .line 51
    iget-object p3, p0, Ll/xic0;->h:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    :cond_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ll/nf60;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/nf60;->c()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-le v2, v0, :cond_1

    .line 74
    .line 75
    invoke-static {p2, v1}, Ll/xic0;->s(Ll/nf60;Ll/nf60;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    invoke-static {p2, v1}, Ll/xic0;->t(Ll/nf60;Ll/nf60;)Ll/r5d0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    throw p0
.end method

.method public final r(ZI)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s7;->l()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/ihx;->d([I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Ll/s7;->j()[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/ihx;->d([I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x4

    .line 18
    const/4 v3, 0x1

    .line 19
    const/4 v4, 0x0

    .line 20
    if-eqz p1, :cond_4

    .line 21
    .line 22
    const/16 v5, 0xc

    .line 23
    .line 24
    if-le v0, v5, :cond_0

    .line 25
    .line 26
    move v7, v3

    .line 27
    move v6, v4

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-ge v0, v2, :cond_1

    .line 30
    .line 31
    move v6, v3

    .line 32
    move v7, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move v6, v4

    .line 35
    move v7, v6

    .line 36
    :goto_0
    if-le v1, v5, :cond_2

    .line 37
    .line 38
    :goto_1
    move v5, v3

    .line 39
    move v2, v4

    .line 40
    goto :goto_4

    .line 41
    :cond_2
    if-ge v1, v2, :cond_3

    .line 42
    .line 43
    :goto_2
    move v2, v3

    .line 44
    move v5, v4

    .line 45
    goto :goto_4

    .line 46
    :cond_3
    move v2, v4

    .line 47
    move v5, v2

    .line 48
    goto :goto_4

    .line 49
    :cond_4
    const/16 v5, 0xb

    .line 50
    .line 51
    if-le v0, v5, :cond_5

    .line 52
    .line 53
    move v7, v3

    .line 54
    move v6, v4

    .line 55
    goto :goto_3

    .line 56
    :cond_5
    const/4 v5, 0x5

    .line 57
    if-ge v0, v5, :cond_6

    .line 58
    .line 59
    move v6, v3

    .line 60
    move v7, v4

    .line 61
    goto :goto_3

    .line 62
    :cond_6
    move v6, v4

    .line 63
    move v7, v6

    .line 64
    :goto_3
    const/16 v5, 0xa

    .line 65
    .line 66
    if-le v1, v5, :cond_7

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_7
    if-ge v1, v2, :cond_3

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :goto_4
    add-int v8, v0, v1

    .line 73
    .line 74
    sub-int/2addr v8, p2

    .line 75
    and-int/lit8 p2, v0, 0x1

    .line 76
    .line 77
    if-ne p2, p1, :cond_8

    .line 78
    .line 79
    move p1, v3

    .line 80
    goto :goto_5

    .line 81
    :cond_8
    move p1, v4

    .line 82
    :goto_5
    and-int/lit8 p2, v1, 0x1

    .line 83
    .line 84
    if-ne p2, v3, :cond_9

    .line 85
    .line 86
    move v4, v3

    .line 87
    :cond_9
    if-ne v8, v3, :cond_d

    .line 88
    .line 89
    if-eqz p1, :cond_b

    .line 90
    .line 91
    if-nez v4, :cond_a

    .line 92
    .line 93
    move v7, v3

    .line 94
    :goto_6
    move v3, v6

    .line 95
    goto :goto_7

    .line 96
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    throw p0

    .line 101
    :cond_b
    if-eqz v4, :cond_c

    .line 102
    .line 103
    move v5, v3

    .line 104
    goto :goto_6

    .line 105
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    throw p0

    .line 110
    :cond_d
    const/4 p2, -0x1

    .line 111
    if-ne v8, p2, :cond_11

    .line 112
    .line 113
    if-eqz p1, :cond_f

    .line 114
    .line 115
    if-nez v4, :cond_e

    .line 116
    .line 117
    goto :goto_7

    .line 118
    :cond_e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    throw p0

    .line 123
    :cond_f
    if-eqz v4, :cond_10

    .line 124
    .line 125
    move v2, v3

    .line 126
    goto :goto_6

    .line 127
    :cond_10
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    throw p0

    .line 132
    :cond_11
    if-nez v8, :cond_1c

    .line 133
    .line 134
    if-eqz p1, :cond_14

    .line 135
    .line 136
    if-eqz v4, :cond_13

    .line 137
    .line 138
    if-ge v0, v1, :cond_12

    .line 139
    .line 140
    move v5, v3

    .line 141
    goto :goto_7

    .line 142
    :cond_12
    move v2, v3

    .line 143
    move v7, v2

    .line 144
    goto :goto_6

    .line 145
    :cond_13
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    throw p0

    .line 150
    :cond_14
    if-nez v4, :cond_1b

    .line 151
    .line 152
    goto :goto_6

    .line 153
    :goto_7
    if-eqz v3, :cond_16

    .line 154
    .line 155
    if-nez v7, :cond_15

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/s7;->l()[I

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p0}, Ll/s7;->m()[F

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-static {p1, p2}, Ll/s7;->n([I[F)V

    .line 166
    .line 167
    .line 168
    goto :goto_8

    .line 169
    :cond_15
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    throw p0

    .line 174
    :cond_16
    :goto_8
    if-eqz v7, :cond_17

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/s7;->l()[I

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p0}, Ll/s7;->m()[F

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-static {p1, p2}, Ll/s7;->g([I[F)V

    .line 185
    .line 186
    .line 187
    :cond_17
    if-eqz v2, :cond_19

    .line 188
    .line 189
    if-nez v5, :cond_18

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/s7;->j()[I

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p0}, Ll/s7;->m()[F

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-static {p1, p2}, Ll/s7;->n([I[F)V

    .line 200
    .line 201
    .line 202
    goto :goto_9

    .line 203
    :cond_18
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    throw p0

    .line 208
    :cond_19
    :goto_9
    if-eqz v5, :cond_1a

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/s7;->j()[I

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p0}, Ll/s7;->k()[F

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {p1, p0}, Ll/s7;->g([I[F)V

    .line 219
    .line 220
    .line 221
    :cond_1a
    return-void

    .line 222
    :cond_1b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    throw p0

    .line 227
    :cond_1c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    throw p0
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xic0;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xic0;->h:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final u(Ll/b13;Ll/joi;Z)Ll/q5c;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s7;->h()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    array-length v3, v0

    .line 8
    if-ge v2, v3, :cond_0

    .line 9
    .line 10
    aput v1, v0, v2

    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v2, 0x1

    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    invoke-virtual {p2}, Ll/joi;->b()[I

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    aget p2, p2, v1

    .line 23
    .line 24
    invoke-static {p1, p2, v0}, Ll/sp50;->f(Ll/b13;I[I)V

    .line 25
    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_1
    invoke-virtual {p2}, Ll/joi;->b()[I

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    aget p2, p2, v2

    .line 33
    .line 34
    add-int/2addr p2, v2

    .line 35
    invoke-static {p1, p2, v0}, Ll/sp50;->e(Ll/b13;I[I)V

    .line 36
    .line 37
    .line 38
    array-length p1, v0

    .line 39
    sub-int/2addr p1, v2

    .line 40
    move p2, v1

    .line 41
    :goto_1
    if-ge p2, p1, :cond_2

    .line 42
    .line 43
    aget v3, v0, p2

    .line 44
    .line 45
    aget v4, v0, p1

    .line 46
    .line 47
    aput v4, v0, p2

    .line 48
    .line 49
    aput v3, v0, p1

    .line 50
    .line 51
    add-int/lit8 p2, p2, 0x1

    .line 52
    .line 53
    add-int/lit8 p1, p1, -0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_2
    if-eqz p3, :cond_3

    .line 57
    .line 58
    const/16 p1, 0x10

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    const/16 p1, 0xf

    .line 62
    .line 63
    :goto_3
    invoke-static {v0}, Ll/ihx;->d([I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    int-to-float p2, p2

    .line 68
    int-to-float v3, p1

    .line 69
    div-float/2addr p2, v3

    .line 70
    invoke-virtual {p0}, Ll/s7;->l()[I

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {p0}, Ll/s7;->j()[I

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {p0}, Ll/s7;->m()[F

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {p0}, Ll/s7;->k()[F

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    move v7, v1

    .line 87
    :goto_4
    array-length v8, v0

    .line 88
    if-ge v7, v8, :cond_7

    .line 89
    .line 90
    aget v8, v0, v7

    .line 91
    .line 92
    int-to-float v8, v8

    .line 93
    div-float/2addr v8, p2

    .line 94
    const/high16 v9, 0x3f000000    # 0.5f

    .line 95
    .line 96
    add-float/2addr v9, v8

    .line 97
    float-to-int v9, v9

    .line 98
    if-gtz v9, :cond_4

    .line 99
    .line 100
    move v9, v2

    .line 101
    goto :goto_5

    .line 102
    :cond_4
    const/16 v10, 0x8

    .line 103
    .line 104
    if-le v9, v10, :cond_5

    .line 105
    .line 106
    move v9, v10

    .line 107
    :cond_5
    :goto_5
    div-int/lit8 v10, v7, 0x2

    .line 108
    .line 109
    and-int/lit8 v11, v7, 0x1

    .line 110
    .line 111
    if-nez v11, :cond_6

    .line 112
    .line 113
    aput v9, v3, v10

    .line 114
    .line 115
    int-to-float v9, v9

    .line 116
    sub-float/2addr v8, v9

    .line 117
    aput v8, v5, v10

    .line 118
    .line 119
    goto :goto_6

    .line 120
    :cond_6
    aput v9, v4, v10

    .line 121
    .line 122
    int-to-float v9, v9

    .line 123
    sub-float/2addr v8, v9

    .line 124
    aput v8, v6, v10

    .line 125
    .line 126
    :goto_6
    add-int/lit8 v7, v7, 0x1

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_7
    invoke-virtual {p0, p3, p1}, Ll/xic0;->r(ZI)V

    .line 130
    .line 131
    .line 132
    array-length p0, v3

    .line 133
    sub-int/2addr p0, v2

    .line 134
    move p1, v1

    .line 135
    move p2, p1

    .line 136
    :goto_7
    if-ltz p0, :cond_8

    .line 137
    .line 138
    mul-int/lit8 p1, p1, 0x9

    .line 139
    .line 140
    aget v0, v3, p0

    .line 141
    .line 142
    add-int/2addr p1, v0

    .line 143
    add-int/2addr p2, v0

    .line 144
    add-int/lit8 p0, p0, -0x1

    .line 145
    .line 146
    goto :goto_7

    .line 147
    :cond_8
    array-length p0, v4

    .line 148
    sub-int/2addr p0, v2

    .line 149
    move v0, v1

    .line 150
    move v5, v0

    .line 151
    :goto_8
    if-ltz p0, :cond_9

    .line 152
    .line 153
    mul-int/lit8 v0, v0, 0x9

    .line 154
    .line 155
    aget v6, v4, p0

    .line 156
    .line 157
    add-int/2addr v0, v6

    .line 158
    add-int/2addr v5, v6

    .line 159
    add-int/lit8 p0, p0, -0x1

    .line 160
    .line 161
    goto :goto_8

    .line 162
    :cond_9
    mul-int/lit8 v0, v0, 0x3

    .line 163
    .line 164
    add-int/2addr p1, v0

    .line 165
    const/4 p0, 0x4

    .line 166
    if-eqz p3, :cond_b

    .line 167
    .line 168
    and-int/lit8 p3, p2, 0x1

    .line 169
    .line 170
    if-nez p3, :cond_a

    .line 171
    .line 172
    const/16 p3, 0xc

    .line 173
    .line 174
    if-gt p2, p3, :cond_a

    .line 175
    .line 176
    if-lt p2, p0, :cond_a

    .line 177
    .line 178
    sub-int/2addr p3, p2

    .line 179
    div-int/lit8 p3, p3, 0x2

    .line 180
    .line 181
    sget-object p0, Ll/xic0;->m:[I

    .line 182
    .line 183
    aget p0, p0, p3

    .line 184
    .line 185
    rsub-int/lit8 p2, p0, 0x9

    .line 186
    .line 187
    invoke-static {v3, p0, v1}, Ll/zic0;->b([IIZ)I

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    invoke-static {v4, p2, v2}, Ll/zic0;->b([IIZ)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    sget-object v0, Ll/xic0;->i:[I

    .line 196
    .line 197
    aget v0, v0, p3

    .line 198
    .line 199
    sget-object v1, Ll/xic0;->k:[I

    .line 200
    .line 201
    aget p3, v1, p3

    .line 202
    .line 203
    new-instance v1, Ll/q5c;

    .line 204
    .line 205
    mul-int/2addr p0, v0

    .line 206
    add-int/2addr p0, p2

    .line 207
    add-int/2addr p0, p3

    .line 208
    invoke-direct {v1, p0, p1}, Ll/q5c;-><init>(II)V

    .line 209
    .line 210
    .line 211
    return-object v1

    .line 212
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    throw p0

    .line 217
    :cond_b
    and-int/lit8 p2, v5, 0x1

    .line 218
    .line 219
    if-nez p2, :cond_c

    .line 220
    .line 221
    const/16 p2, 0xa

    .line 222
    .line 223
    if-gt v5, p2, :cond_c

    .line 224
    .line 225
    if-lt v5, p0, :cond_c

    .line 226
    .line 227
    sub-int/2addr p2, v5

    .line 228
    div-int/lit8 p2, p2, 0x2

    .line 229
    .line 230
    sget-object p0, Ll/xic0;->n:[I

    .line 231
    .line 232
    aget p0, p0, p2

    .line 233
    .line 234
    rsub-int/lit8 p3, p0, 0x9

    .line 235
    .line 236
    invoke-static {v3, p0, v2}, Ll/zic0;->b([IIZ)I

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    invoke-static {v4, p3, v1}, Ll/zic0;->b([IIZ)I

    .line 241
    .line 242
    .line 243
    move-result p3

    .line 244
    sget-object v0, Ll/xic0;->j:[I

    .line 245
    .line 246
    aget v0, v0, p2

    .line 247
    .line 248
    sget-object v1, Ll/xic0;->l:[I

    .line 249
    .line 250
    aget p2, v1, p2

    .line 251
    .line 252
    new-instance v1, Ll/q5c;

    .line 253
    .line 254
    mul-int/2addr p3, v0

    .line 255
    add-int/2addr p3, p0

    .line 256
    add-int/2addr p3, p2

    .line 257
    invoke-direct {v1, p3, p1}, Ll/q5c;-><init>(II)V

    .line 258
    .line 259
    .line 260
    return-object v1

    .line 261
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    throw p0
.end method

.method public final v(Ll/b13;ZILjava/util/Map;)Ll/nf60;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b13;",
            "ZI",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/nf60;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ll/xic0;->w(Ll/b13;Z)[I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0, p1, p3, p2, v1}, Ll/xic0;->x(Ll/b13;IZ[I)Ll/joi;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    move-object p4, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v3, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    .line 15
    .line 16
    invoke-interface {p4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    check-cast p4, Ll/t5d0;

    .line 21
    .line 22
    :goto_0
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x1

    .line 24
    if-eqz p4, :cond_2

    .line 25
    .line 26
    aget v5, v1, v3

    .line 27
    .line 28
    aget v1, v1, v4

    .line 29
    .line 30
    add-int/2addr v5, v1

    .line 31
    int-to-float v1, v5

    .line 32
    const/high16 v5, 0x40000000    # 2.0f

    .line 33
    .line 34
    div-float/2addr v1, v5

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/b13;->m()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sub-int/2addr p2, v4

    .line 42
    int-to-float p2, p2

    .line 43
    sub-float v1, p2, v1

    .line 44
    .line 45
    :cond_1
    new-instance p2, Ll/s5d0;

    .line 46
    .line 47
    int-to-float p3, p3

    .line 48
    invoke-direct {p2, v1, p3}, Ll/s5d0;-><init>(FF)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p4, p2}, Ll/t5d0;->a(Ll/s5d0;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p0, p1, v2, v4}, Ll/xic0;->u(Ll/b13;Ll/joi;Z)Ll/q5c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p0, p1, v2, v3}, Ll/xic0;->u(Ll/b13;Ll/joi;Z)Ll/q5c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p1, Ll/nf60;

    .line 63
    .line 64
    invoke-virtual {p2}, Ll/q5c;->b()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    mul-int/lit16 p3, p3, 0x63d

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/q5c;->b()I

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    add-int/2addr p3, p4

    .line 75
    invoke-virtual {p2}, Ll/q5c;->a()I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-virtual {p0}, Ll/q5c;->a()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    mul-int/lit8 p0, p0, 0x4

    .line 84
    .line 85
    add-int/2addr p2, p0

    .line 86
    invoke-direct {p1, p3, p2, v2}, Ll/nf60;-><init>(IILl/joi;)V
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    return-object p1

    .line 90
    :catch_0
    return-object v0
.end method

.method public final w(Ll/b13;Z)[I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s7;->i()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    aput v0, p0, v0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aput v0, p0, v1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aput v0, p0, v2

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    aput v0, p0, v3

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/b13;->m()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    move v5, v0

    .line 22
    move v6, v5

    .line 23
    :goto_0
    if-ge v5, v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, v5}, Ll/b13;->f(I)Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    xor-int/2addr v6, v1

    .line 30
    if-eq p2, v6, :cond_0

    .line 31
    .line 32
    add-int/lit8 v5, v5, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v7, v0

    .line 36
    move p2, v5

    .line 37
    :goto_1
    if-ge v5, v4, :cond_4

    .line 38
    .line 39
    invoke-virtual {p1, v5}, Ll/b13;->f(I)Z

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-eq v8, v6, :cond_1

    .line 44
    .line 45
    aget v8, p0, v7

    .line 46
    .line 47
    add-int/2addr v8, v1

    .line 48
    aput v8, p0, v7

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_1
    if-ne v7, v3, :cond_3

    .line 52
    .line 53
    invoke-static {p0}, Ll/s7;->o([I)Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-eqz v8, :cond_2

    .line 58
    .line 59
    filled-new-array {p2, v5}, [I

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    aget v8, p0, v0

    .line 65
    .line 66
    aget v9, p0, v1

    .line 67
    .line 68
    add-int/2addr v8, v9

    .line 69
    add-int/2addr p2, v8

    .line 70
    aget v8, p0, v2

    .line 71
    .line 72
    aput v8, p0, v0

    .line 73
    .line 74
    aget v8, p0, v3

    .line 75
    .line 76
    aput v8, p0, v1

    .line 77
    .line 78
    aput v0, p0, v2

    .line 79
    .line 80
    aput v0, p0, v3

    .line 81
    .line 82
    add-int/lit8 v7, v7, -0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 86
    .line 87
    :goto_2
    aput v1, p0, v7

    .line 88
    .line 89
    xor-int/lit8 v6, v6, 0x1

    .line 90
    .line 91
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    throw p0
.end method

.method public final x(Ll/b13;IZ[I)Ll/joi;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p4, v0

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Ll/b13;->f(I)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    aget v2, p4, v0

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    sub-int/2addr v2, v3

    .line 12
    :goto_0
    if-ltz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Ll/b13;->f(I)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eq v1, v4, :cond_0

    .line 19
    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    add-int/2addr v2, v3

    .line 24
    aget v1, p4, v0

    .line 25
    .line 26
    sub-int/2addr v1, v2

    .line 27
    invoke-virtual {p0}, Ll/s7;->i()[I

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    array-length v4, p0

    .line 32
    sub-int/2addr v4, v3

    .line 33
    invoke-static {p0, v0, p0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    aput v1, p0, v0

    .line 37
    .line 38
    sget-object v0, Ll/xic0;->o:[[I

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/s7;->p([I[[I)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    aget p0, p4, v3

    .line 45
    .line 46
    if-eqz p3, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/b13;->m()I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    sub-int/2addr p3, v3

    .line 53
    sub-int/2addr p3, v2

    .line 54
    invoke-virtual {p1}, Ll/b13;->m()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    sub-int/2addr p1, v3

    .line 59
    sub-int p0, p1, p0

    .line 60
    .line 61
    move v7, p3

    .line 62
    :goto_1
    move v8, p0

    .line 63
    goto :goto_2

    .line 64
    :cond_1
    move v7, v2

    .line 65
    goto :goto_1

    .line 66
    :goto_2
    new-instance v4, Ll/joi;

    .line 67
    .line 68
    aget p0, p4, v3

    .line 69
    .line 70
    filled-new-array {v2, p0}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    move v9, p2

    .line 75
    invoke-direct/range {v4 .. v9}, Ll/joi;-><init>(I[IIII)V

    .line 76
    .line 77
    .line 78
    return-object v4
.end method
