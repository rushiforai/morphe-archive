.class public Lcom/p1/mobile/putong/core/util/DebugUtil$q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Wj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->c3:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/util/DebugUtil$q0;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->c(Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method

.method private synthetic c(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$q0$a;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$q0;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "xxx"

    .line 13
    .line 14
    invoke-static {p1, p0, v1, v2, v0}, Ll/upm;->F(Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/y20;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object v1, v1, Ll/dkb;->c3:Ll/jxd0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const-string v1, "true"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v1, "false"

    .line 30
    .line 31
    :goto_0
    const-string v2, "\u5b9e\u9a8c\u7ec4\uff0c\u5f53\u524d\uff1a"

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/bed;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/bed;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->a:Ljava/util/ArrayList;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 52
    .line 53
    new-instance v2, Ll/ced;

    .line 54
    .line 55
    invoke-direct {v2, p0, v1}, Ll/ced;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$q0;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 56
    .line 57
    .line 58
    const-string v1, " \u975esvpi \u5f39svpi"

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->a:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
