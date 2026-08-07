.class public Ll/kfe0;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Lcom/p1/mobile/putong/core/newui/home/b;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:I

.field public n:Lcom/p1/mobile/putong/core/data/Figure;

.field public o:D

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Ljava/lang/String;Ljava/lang/String;IILcom/p1/mobile/putong/core/data/Figure;DLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kfe0;->i:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kfe0;->j:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/kfe0;->k:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/kfe0;->l:I

    .line 11
    .line 12
    iput p5, p0, Ll/kfe0;->m:I

    .line 13
    .line 14
    iput-object p6, p0, Ll/kfe0;->n:Lcom/p1/mobile/putong/core/data/Figure;

    .line 15
    .line 16
    iput-wide p7, p0, Ll/kfe0;->o:D

    .line 17
    .line 18
    iput-object p9, p0, Ll/kfe0;->p:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic B(Ll/kfe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kfe0;->C()V

    return-void
.end method

.method private synthetic C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

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
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public A()I
    .locals 11

    .line 1
    iget-object v0, p0, Ll/kfe0;->i:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v1, p0, Ll/kfe0;->i:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 17
    .line 18
    iget-object v2, p0, Ll/kfe0;->j:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p0, Ll/kfe0;->k:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p0, Ll/kfe0;->p:Ljava/lang/String;

    .line 23
    .line 24
    iget v5, p0, Ll/kfe0;->l:I

    .line 25
    .line 26
    iget v6, p0, Ll/kfe0;->m:I

    .line 27
    .line 28
    iget-object v7, p0, Ll/kfe0;->n:Lcom/p1/mobile/putong/core/data/Figure;

    .line 29
    .line 30
    iget-wide v8, p0, Ll/kfe0;->o:D

    .line 31
    .line 32
    new-instance v10, Ll/jfe0;

    .line 33
    .line 34
    invoke-direct {v10, p0}, Ll/jfe0;-><init>(Ll/kfe0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual/range {v1 .. v10}, Lcom/p1/mobile/putong/core/newui/home/b;->u6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILcom/p1/mobile/putong/core/data/Figure;DLl/x20;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/jlb0;->a:Ll/x20;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Ll/jlb0;->a:Ll/x20;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/x20;->call()V

    .line 51
    .line 52
    .line 53
    :cond_1
    const/16 p0, 0x1388

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 65
    .line 66
    invoke-interface {p0}, Ll/x20;->call()V

    .line 67
    .line 68
    .line 69
    :cond_3
    const/4 p0, 0x0

    .line 70
    return p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfe0;->i:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfe0;->i:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->SEE_ANIM:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->SEE_ANIM:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
