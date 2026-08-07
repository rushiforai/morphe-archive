.class public Lcom/p1/mobile/putong/core/util/DebugUtil$j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->vj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IjhCRDkzRjE5QkQ0MzQ5RDU4N0JCNTQ3NzQwRTBGMzhEIiwidyI6MTIwLCJoIjoxMjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzQ1MTAyODQzNTQ3NjQ4LCJwdCI6MjAyNTA2MTMxOH0.png"

    .line 10
    .line 11
    const-string v6, "https://auto.tancdn.com/v1/images/eyJpZCI6IjU0NTA3MkQ2N0MwQTRFN0ZCOEY0QzY2OTUzQUE1ODY1IiwidyI6NzUwLCJoIjoxNjI0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzQ4MzU1MDEyNjY2NDAwMDcxNiwicHQiOjIwMjUwNjEzMTh9.png"

    .line 12
    .line 13
    const-string v2, "pursue"

    .line 14
    .line 15
    const-string v3, "short-term-fun"

    .line 16
    .line 17
    const-string v4, "short-term-fun"

    .line 18
    .line 19
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    new-instance v2, Ll/tdd;

    .line 11
    .line 12
    invoke-direct {v2, v1}, Ll/tdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "tribe \u5212\u5361\u9875"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$a;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$j0;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "\u6e05\u9664\u6c14\u6ce1\u9891\u63a7"

    .line 32
    .line 33
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$b;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$b;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$j0;)V

    .line 45
    .line 46
    .line 47
    const-string v2, "\u4ea4\u53cb\u76ee\u7684\u5f39\u7a97"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->a:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
