.class public Ll/jzk0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/jzk0;->e:I

    .line 5
    .line 6
    iput-object p1, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 4
    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, -0x1

    .line 14
    move v3, v1

    .line 15
    :goto_0
    iget-object v4, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 16
    .line 17
    iget v5, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 18
    .line 19
    if-ge v3, v5, :cond_1

    .line 20
    .line 21
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 22
    .line 23
    aget-object v4, v4, v3

    .line 24
    .line 25
    iget-object v4, v4, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 31
    .line 32
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 33
    .line 34
    aget-object v4, v4, v3

    .line 35
    .line 36
    iget-object v4, v4, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 37
    .line 38
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 39
    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    if-gez v2, :cond_0

    .line 43
    .line 44
    move v2, v3

    .line 45
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget v3, p0, Ll/jzk0;->e:I

    .line 49
    .line 50
    if-ge v2, v3, :cond_2

    .line 51
    .line 52
    if-ltz v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 58
    .line 59
    invoke-virtual {v0, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_1
    iget-object v2, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 63
    .line 64
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 65
    .line 66
    if-ge v1, v3, :cond_3

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 69
    .line 70
    aget-object v2, v2, v1

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ll/jzk0;->f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 84
    .line 85
    aget-object v2, v2, v1

    .line 86
    .line 87
    iget-object v2, v2, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->y()V

    .line 90
    .line 91
    .line 92
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 98
    .line 99
    if-eqz p0, :cond_4

    .line 100
    .line 101
    invoke-interface {p0}, Ll/t4m;->c()V

    .line 102
    .line 103
    .line 104
    :cond_4
    return-void
.end method

.method public b()I
    .locals 1

    .line 1
    iget v0, p0, Ll/jzk0;->c:I

    .line 2
    .line 3
    iget p0, p0, Ll/jzk0;->a:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    return v0
.end method

.method public c()I
    .locals 1

    .line 1
    iget v0, p0, Ll/jzk0;->b:I

    .line 2
    .line 3
    iget p0, p0, Ll/jzk0;->d:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    return v0
.end method

.method public d(II)Z
    .locals 1

    .line 1
    iget v0, p0, Ll/jzk0;->a:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/jzk0;->c:I

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    iget p1, p0, Ll/jzk0;->b:I

    .line 10
    .line 11
    if-lt p2, p1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Ll/jzk0;->d:I

    .line 14
    .line 15
    if-gt p2, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public e()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    iget-object v4, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 14
    .line 15
    iget v5, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 16
    .line 17
    if-ge v3, v5, :cond_2

    .line 18
    .line 19
    iget v5, p0, Ll/jzk0;->e:I

    .line 20
    .line 21
    if-eq v3, v5, :cond_1

    .line 22
    .line 23
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 24
    .line 25
    aget-object v4, v4, v3

    .line 26
    .line 27
    iget-object v4, v4, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 28
    .line 29
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b:Z

    .line 30
    .line 31
    if-nez v5, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v3, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    :goto_2
    iget-object v1, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 52
    .line 53
    iget v3, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 54
    .line 55
    if-ge v2, v3, :cond_3

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 58
    .line 59
    aget-object v1, v1, v2

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ll/jzk0;->f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->p:[Ll/jzk0;

    .line 73
    .line 74
    aget-object v1, v1, v2

    .line 75
    .line 76
    iget-object v1, v1, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->g()V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_3
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 85
    .line 86
    if-eqz p0, :cond_4

    .line 87
    .line 88
    invoke-interface {p0}, Ll/t4m;->b()V

    .line 89
    .line 90
    .line 91
    :cond_4
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jzk0;->g:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 4
    .line 5
    return-void
.end method

.method public g(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jzk0;->a:I

    .line 2
    .line 3
    iput p2, p0, Ll/jzk0;->b:I

    .line 4
    .line 5
    iput p3, p0, Ll/jzk0;->c:I

    .line 6
    .line 7
    iput p4, p0, Ll/jzk0;->d:I

    .line 8
    .line 9
    return-void
.end method

.method public h()I
    .locals 1

    .line 1
    iget v0, p0, Ll/jzk0;->c:I

    .line 2
    .line 3
    iget p0, p0, Ll/jzk0;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method
