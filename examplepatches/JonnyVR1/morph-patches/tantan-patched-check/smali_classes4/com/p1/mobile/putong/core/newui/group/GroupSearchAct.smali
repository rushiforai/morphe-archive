.class public Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;
.super Lcom/p1/mobile/putong/core/PutongCoreAct;
.source "SourceFile"


# instance fields
.field public d:Ll/clk;

.field public e:Ll/mlk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/PutongCoreAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Y1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public Z1()Ll/mlk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->e:Ll/mlk;

    .line 2
    .line 3
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->d:Ll/clk;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/clk;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/clk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/clk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->d:Ll/clk;

    .line 10
    .line 11
    new-instance v0, Ll/mlk;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/mlk;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->e:Ll/mlk;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->d:Ll/clk;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->e:Ll/mlk;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/mlk;->a0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_search_result"

    .line 2
    .line 3
    return-object p0
.end method
