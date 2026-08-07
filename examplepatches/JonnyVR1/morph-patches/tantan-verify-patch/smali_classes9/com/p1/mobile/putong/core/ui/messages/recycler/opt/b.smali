.class public abstract Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;
.super Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;


# instance fields
.field public t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

.field public u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;Ll/fsq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->v0(Ll/fsq;)V

    return-void
.end method

.method private x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/orc0;

    .line 22
    .line 23
    iget v1, v0, Ll/orc0;->a:I

    .line 24
    .line 25
    iget v0, v0, Ll/orc0;->c:I

    .line 26
    .line 27
    add-int/2addr v1, v0

    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 29
    .line 30
    add-int/2addr v1, v0

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sub-int/2addr v0, v1

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sub-int/2addr v0, v1

    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->B0(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 4
    .line 5
    return-void
.end method

.method public B0(I)V
    .locals 4

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const v1, 0x3fd9999a    # 1.7f

    .line 7
    .line 8
    .line 9
    div-float/2addr v0, v1

    .line 10
    float-to-int v0, v0

    .line 11
    const/16 v1, 0x15e

    .line 12
    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    :goto_0
    move v0, v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/16 v1, 0x320

    .line 18
    .line 19
    if-le v0, v1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    :goto_1
    const/4 v1, 0x2

    .line 23
    int-to-long v2, v0

    .line 24
    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->C0(IIJ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public C0(IIJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->k(II)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i(J)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public D0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onAnimScrollEnd \u5269\u4f59\u4efb\u52a1\u6570\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->l()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " : "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "lllll"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->b(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public c(IFIIZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 10
    .line 11
    move v2, p1

    .line 12
    move v3, p2

    .line 13
    move v4, p3

    .line 14
    move v5, p4

    .line 15
    move v6, p5

    .line 16
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->c(IFIIZ)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v4, p3

    .line 21
    move v5, p4

    .line 22
    move v6, p5

    .line 23
    :goto_0
    if-nez v6, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->w0(II)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->f()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$c;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    move-object v0, p1

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$c;->a:Ll/fsq;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->m0(Ll/fsq;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 27
    .line 28
    if-ne p1, v0, :cond_2

    .line 29
    .line 30
    const-string p1, "lllll"

    .line 31
    .line 32
    const-string v0, "\u6267\u884c\u6eda\u52a8\u5230\u5e95\u90e8\u7684\u903b\u8f91"

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->y()V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->x0()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final j0(ZLl/orc0;ZZILjava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/orc0;",
            "ZZI",
            "Ljava/util/List<",
            "Ll/orc0;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_5

    .line 7
    .line 8
    invoke-interface {p6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/orc0;

    .line 13
    .line 14
    invoke-static {p6}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p6

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget p1, p2, Ll/orc0;->a:I

    .line 21
    .line 22
    invoke-interface {p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result p6

    .line 30
    if-eqz p6, :cond_1

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p6

    .line 36
    check-cast p6, Ll/orc0;

    .line 37
    .line 38
    iget v2, p6, Ll/orc0;->c:I

    .line 39
    .line 40
    sub-int/2addr p1, v2

    .line 41
    iput p1, p6, Ll/orc0;->a:I

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1, v1, p6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget p1, p6, Ll/orc0;->a:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget p1, p2, Ll/orc0;->a:I

    .line 52
    .line 53
    iget p2, p2, Ll/orc0;->c:I

    .line 54
    .line 55
    add-int/2addr p1, p2

    .line 56
    invoke-interface {p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result p6

    .line 64
    if-eqz p6, :cond_1

    .line 65
    .line 66
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p6

    .line 70
    check-cast p6, Ll/orc0;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v1, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iput p1, p6, Ll/orc0;->a:I

    .line 78
    .line 79
    iget p6, p6, Ll/orc0;->c:I

    .line 80
    .line 81
    add-int/2addr p1, p6

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    if-eqz p3, :cond_3

    .line 84
    .line 85
    if-eqz p4, :cond_2

    .line 86
    .line 87
    iget p1, v0, Ll/orc0;->a:I

    .line 88
    .line 89
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 90
    .line 91
    add-int/2addr p1, p0

    .line 92
    neg-int p0, p1

    .line 93
    return p0

    .line 94
    :cond_2
    iget p1, v0, Ll/orc0;->a:I

    .line 95
    .line 96
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 97
    .line 98
    add-int/2addr p1, p0

    .line 99
    neg-int p0, p1

    .line 100
    iget p1, v0, Ll/orc0;->c:I

    .line 101
    .line 102
    sub-int/2addr p0, p1

    .line 103
    return p0

    .line 104
    :cond_3
    if-eqz p4, :cond_4

    .line 105
    .line 106
    iget p1, v0, Ll/orc0;->a:I

    .line 107
    .line 108
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 109
    .line 110
    add-int/2addr p1, p0

    .line 111
    neg-int p0, p1

    .line 112
    add-int/2addr p0, p5

    .line 113
    return p0

    .line 114
    :cond_4
    iget p1, v0, Ll/orc0;->a:I

    .line 115
    .line 116
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 117
    .line 118
    add-int/2addr p1, p0

    .line 119
    neg-int p0, p1

    .line 120
    iget p1, v0, Ll/orc0;->c:I

    .line 121
    .line 122
    sub-int/2addr p0, p1

    .line 123
    add-int/2addr p0, p5

    .line 124
    return p0

    .line 125
    :cond_5
    return v1
.end method

.method public k0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l0(I)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dxi0;->m()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final m0(Ll/fsq;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Ll/fsq;->e:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->n0(Ll/fsq;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->D0()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->q0(Ll/fsq;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final n0(Ll/fsq;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/fsq;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->o0(Ll/fsq;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x3

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->o0(Ll/fsq;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->o0(Ll/fsq;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    if-nez v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->p0(Ll/fsq;)V

    .line 27
    .line 28
    .line 29
    :cond_3
    return-void
.end method

.method public final o0(Ll/fsq;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->E()Ll/orc0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v1, v1, Ll/orc0;->f:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->F()Ll/orc0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget v2, v2, Ll/orc0;->f:I

    .line 18
    .line 19
    iget v3, p1, Ll/fsq;->a:I

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x2

    .line 23
    if-ne v3, v5, :cond_0

    .line 24
    .line 25
    move v9, v4

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 v6, 0x3

    .line 28
    if-ne v3, v6, :cond_1

    .line 29
    .line 30
    add-int/lit8 v3, v0, -0x1

    .line 31
    .line 32
    :goto_0
    move v9, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget v3, p1, Ll/fsq;->b:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    if-ltz v9, :cond_2

    .line 38
    .line 39
    if-lt v9, v0, :cond_3

    .line 40
    .line 41
    :cond_2
    move-object v6, p0

    .line 42
    goto/16 :goto_7

    .line 43
    .line 44
    :cond_3
    const/4 v0, 0x1

    .line 45
    if-lt v9, v1, :cond_8

    .line 46
    .line 47
    if-gt v9, v2, :cond_8

    .line 48
    .line 49
    invoke-virtual {p0, v9}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->s0(I)Ll/orc0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-nez v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    iget v2, v1, Ll/orc0;->a:I

    .line 60
    .line 61
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 62
    .line 63
    add-int/2addr v2, v3

    .line 64
    iget-boolean v3, p1, Ll/fsq;->c:Z

    .line 65
    .line 66
    if-nez v3, :cond_5

    .line 67
    .line 68
    iget v1, v1, Ll/orc0;->c:I

    .line 69
    .line 70
    add-int/2addr v2, v1

    .line 71
    :cond_5
    iget-boolean v1, p1, Ll/fsq;->d:Z

    .line 72
    .line 73
    if-eqz v1, :cond_6

    .line 74
    .line 75
    neg-int v1, v2

    .line 76
    goto :goto_2

    .line 77
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr v1, v2

    .line 84
    :goto_2
    iget v2, p1, Ll/fsq;->f:I

    .line 85
    .line 86
    add-int/2addr v1, v2

    .line 87
    iget-boolean v2, p1, Ll/fsq;->g:Z

    .line 88
    .line 89
    if-eqz v2, :cond_7

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_7
    move v5, v0

    .line 93
    :goto_3
    iget-wide v2, p1, Ll/fsq;->e:J

    .line 94
    .line 95
    invoke-virtual {p0, v1, v5, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->C0(IIJ)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->F()Ll/orc0;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    if-ge v9, v1, :cond_9

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->E()Ll/orc0;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    move v7, v0

    .line 110
    move v8, v1

    .line 111
    :goto_4
    move-object v13, v3

    .line 112
    goto :goto_5

    .line 113
    :cond_9
    move v8, v2

    .line 114
    move v7, v4

    .line 115
    goto :goto_4

    .line 116
    :goto_5
    iget-boolean v10, p1, Ll/fsq;->c:Z

    .line 117
    .line 118
    iget-boolean v11, p1, Ll/fsq;->d:Z

    .line 119
    .line 120
    iget v12, p1, Ll/fsq;->f:I

    .line 121
    .line 122
    move-object v6, p0

    .line 123
    invoke-virtual/range {v6 .. v13}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->r0(ZIIZZILl/orc0;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    iget-object v1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v1, Ljava/lang/Integer;

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast p0, Ljava/lang/Boolean;

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_a

    .line 144
    .line 145
    goto :goto_6

    .line 146
    :cond_a
    iget-boolean p0, p1, Ll/fsq;->g:Z

    .line 147
    .line 148
    if-eqz p0, :cond_b

    .line 149
    .line 150
    goto :goto_6

    .line 151
    :cond_b
    move v5, v0

    .line 152
    :goto_6
    iget-wide p0, p1, Ll/fsq;->e:J

    .line 153
    .line 154
    invoke-virtual {v6, v1, v5, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->C0(IIJ)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :goto_7
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final p0(Ll/fsq;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    iget v0, p1, Ll/fsq;->b:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->k(II)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-wide v0, p1, Ll/fsq;->e:J

    .line 11
    .line 12
    long-to-int p1, v0

    .line 13
    int-to-long v0, p1

    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i(J)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->l()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final q0(Ll/fsq;)V
    .locals 5

    .line 1
    iget v0, p1, Ll/fsq;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nr2;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/nr2;-><init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;Ll/fsq;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "doSelectInner"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->R(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v1, 0x2

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iget v0, p1, Ll/fsq;->f:I

    .line 22
    .line 23
    :goto_0
    move v1, v3

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    const/4 v1, 0x3

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/dxi0;->m()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-int/2addr v0, v3

    .line 35
    iget v1, p1, Ll/fsq;->f:I

    .line 36
    .line 37
    move v3, v2

    .line 38
    :goto_1
    move v2, v0

    .line 39
    move v0, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    if-ne v0, v3, :cond_3

    .line 42
    .line 43
    iget v2, p1, Ll/fsq;->b:I

    .line 44
    .line 45
    iget-boolean v0, p1, Ll/fsq;->c:Z

    .line 46
    .line 47
    iget-boolean v1, p1, Ll/fsq;->d:Z

    .line 48
    .line 49
    iget v3, p1, Ll/fsq;->f:I

    .line 50
    .line 51
    move v4, v3

    .line 52
    move v3, v0

    .line 53
    move v0, v4

    .line 54
    goto :goto_2

    .line 55
    :cond_3
    const/4 v0, -0x1

    .line 56
    move v1, v2

    .line 57
    goto :goto_1

    .line 58
    :goto_2
    invoke-virtual {p1}, Ll/fsq;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Ll/yor;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->l0(I)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0, v2, v3, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->y0(IZZI)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->y()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->N()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final r0(ZIIZZILl/orc0;)Ll/pf60;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZIIZZI",
            "Ll/orc0;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    new-instance v6, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    move v4, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v4, -0x1

    .line 28
    :goto_0
    const/4 v7, 0x0

    .line 29
    move/from16 v8, p3

    .line 30
    .line 31
    move v9, v7

    .line 32
    :goto_1
    const/4 v10, 0x3

    .line 33
    const/4 v11, 0x2

    .line 34
    if-ge v9, v5, :cond_5

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    if-lt v8, v1, :cond_2

    .line 39
    .line 40
    :cond_1
    if-nez p1, :cond_5

    .line 41
    .line 42
    if-le v8, v1, :cond_5

    .line 43
    .line 44
    :cond_2
    invoke-virtual {v0, v8, v2, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 45
    .line 46
    .line 47
    move-result-object v12

    .line 48
    iput v8, v12, Ll/orc0;->f:I

    .line 49
    .line 50
    iget v13, v12, Ll/orc0;->h:I

    .line 51
    .line 52
    if-ne v13, v3, :cond_3

    .line 53
    .line 54
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 55
    .line 56
    iget-object v13, v12, Ll/orc0;->g:Ll/ns2;

    .line 57
    .line 58
    iget-object v13, v13, Ll/ns2;->a:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v11, v13, v7}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    if-ne v13, v11, :cond_4

    .line 65
    .line 66
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 67
    .line 68
    iget-object v13, v12, Ll/orc0;->g:Ll/ns2;

    .line 69
    .line 70
    iget-object v13, v13, Ll/ns2;->a:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v14

    .line 76
    invoke-virtual {v11, v13, v7, v14}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    :cond_4
    :goto_2
    iput v10, v12, Ll/orc0;->h:I

    .line 80
    .line 81
    invoke-interface {v6, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget v10, v12, Ll/orc0;->c:I

    .line 85
    .line 86
    add-int/2addr v9, v10

    .line 87
    add-int/2addr v8, v4

    .line 88
    goto :goto_1

    .line 89
    :cond_5
    if-eq v8, v1, :cond_d

    .line 90
    .line 91
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    if-nez v12, :cond_c

    .line 96
    .line 97
    mul-int v12, p6, v4

    .line 98
    .line 99
    if-lez v12, :cond_a

    .line 100
    .line 101
    invoke-static/range {p6 .. p6}, Ljava/lang/Math;->abs(I)I

    .line 102
    .line 103
    .line 104
    move-result v12

    .line 105
    add-int/2addr v12, v5

    .line 106
    :goto_3
    if-ge v9, v12, :cond_a

    .line 107
    .line 108
    if-eqz p1, :cond_6

    .line 109
    .line 110
    if-lt v8, v1, :cond_7

    .line 111
    .line 112
    :cond_6
    if-nez p1, :cond_a

    .line 113
    .line 114
    if-le v8, v1, :cond_a

    .line 115
    .line 116
    :cond_7
    invoke-virtual {v0, v8, v2, v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 117
    .line 118
    .line 119
    move-result-object v13

    .line 120
    iput v8, v13, Ll/orc0;->f:I

    .line 121
    .line 122
    iget v14, v13, Ll/orc0;->h:I

    .line 123
    .line 124
    if-ne v14, v3, :cond_8

    .line 125
    .line 126
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 127
    .line 128
    iget-object v15, v13, Ll/orc0;->g:Ll/ns2;

    .line 129
    .line 130
    iget-object v15, v15, Ll/ns2;->a:Landroid/view/View;

    .line 131
    .line 132
    invoke-virtual {v14, v15, v7}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_8
    if-ne v14, v11, :cond_9

    .line 137
    .line 138
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 139
    .line 140
    iget-object v15, v13, Ll/orc0;->g:Ll/ns2;

    .line 141
    .line 142
    iget-object v15, v15, Ll/ns2;->a:Landroid/view/View;

    .line 143
    .line 144
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v14, v15, v7, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 149
    .line 150
    .line 151
    :cond_9
    :goto_4
    iput v10, v13, Ll/orc0;->h:I

    .line 152
    .line 153
    invoke-interface {v6, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget v3, v13, Ll/orc0;->c:I

    .line 157
    .line 158
    add-int/2addr v9, v3

    .line 159
    add-int/2addr v8, v4

    .line 160
    const/4 v3, 0x1

    .line 161
    goto :goto_3

    .line 162
    :cond_a
    if-eq v8, v1, :cond_b

    .line 163
    .line 164
    const/16 v16, 0x1

    .line 165
    .line 166
    :goto_5
    move/from16 v1, p1

    .line 167
    .line 168
    move/from16 v4, p4

    .line 169
    .line 170
    move/from16 v3, p5

    .line 171
    .line 172
    move-object/from16 v2, p7

    .line 173
    .line 174
    goto :goto_6

    .line 175
    :cond_b
    move/from16 v16, v7

    .line 176
    .line 177
    goto :goto_5

    .line 178
    :goto_6
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->j0(ZLl/orc0;ZZILjava/util/List;)I

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    move v0, v7

    .line 183
    move/from16 v7, v16

    .line 184
    .line 185
    goto :goto_7

    .line 186
    :cond_c
    move v0, v7

    .line 187
    goto :goto_7

    .line 188
    :cond_d
    move/from16 v1, p1

    .line 189
    .line 190
    move/from16 v4, p4

    .line 191
    .line 192
    move/from16 v3, p5

    .line 193
    .line 194
    move-object/from16 v2, p7

    .line 195
    .line 196
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->j0(ZLl/orc0;ZZILjava/util/List;)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    add-int v0, v0, p6

    .line 201
    .line 202
    :goto_7
    new-instance v1, Ll/pf60;

    .line 203
    .line 204
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-direct {v1, v2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    return-object v1
.end method

.method public final s0(I)Ll/orc0;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/orc0;

    .line 18
    .line 19
    iget v1, v0, Ll/orc0;->f:I

    .line 20
    .line 21
    if-ne v1, p1, :cond_0

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public t0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 4
    .line 5
    return p0
.end method

.method public final synthetic v0(Ll/fsq;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 2
    .line 3
    iget p1, p1, Ll/fsq;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, p1

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 7
    .line 8
    return-void
.end method

.method public final w0(II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->d0(II)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final y0(IZZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/qrc0;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/qrc0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-boolean p2, v0, Ll/qrc0;->m:Z

    .line 14
    .line 15
    iput p1, v0, Ll/qrc0;->k:I

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ll/dxi0;->d(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, v0, Ll/qrc0;->j:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 26
    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iput p4, p1, Ll/qrc0;->l:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    add-int/2addr p2, p4

    .line 39
    iput p2, p1, Ll/qrc0;->l:I

    .line 40
    .line 41
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 42
    .line 43
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 44
    .line 45
    int-to-float p2, p2

    .line 46
    iput p2, p1, Ll/qrc0;->i:F

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 50
    .line 51
    return-void
.end method

.method public final z0(Ll/fsq;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$c;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$c;-><init>(Ll/fsq;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
