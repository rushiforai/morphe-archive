.class public Lcom/p1/mobile/putong/core/util/DebugUtil$l1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Oi(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/q83;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    sget-object v0, Ll/y9;->Companion:Ll/y9$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/y9$a;->s(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/m93;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "p_home,accelerate_guide"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ll/m93;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/m93;->show()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic d()V
    .locals 1

    .line 1
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/q83;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/q83;->a()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Ll/gfd;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/gfd;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "\u6e05\u9664boost\u5f15\u5bfc\u76f8\u5173\u672c\u5730\u6570\u636e"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 25
    .line 26
    new-instance v2, Ll/hfd;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Ll/hfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 29
    .line 30
    .line 31
    const-string v1, "boost\u65b0\u5f15\u5bfc\u5f39\u7a97"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 43
    .line 44
    new-instance v2, Ll/ifd;

    .line 45
    .line 46
    invoke-direct {v2, v1}, Ll/ifd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 47
    .line 48
    .line 49
    const-string v1, "boost\u7ed3\u675f\u5e95\u90e8\u5f39\u7a97"

    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 59
    .line 60
    new-instance v1, Ll/jfd;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/jfd;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v2, "\u63d2\u5165boost\u5f15\u5bfc\u5361"

    .line 66
    .line 67
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 77
    .line 78
    new-instance v2, Ll/kfd;

    .line 79
    .line 80
    invoke-direct {v2, v1}, Ll/kfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 81
    .line 82
    .line 83
    const-string v1, "boost\u5f15\u5bfc\u5165\u53e3push"

    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$l1;->a:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
