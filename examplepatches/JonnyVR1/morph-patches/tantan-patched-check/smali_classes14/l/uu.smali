.class public Ll/uu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ou;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VText;

.field public d:Lv/VRecyclerView;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Lv/VCheckBox;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VButton;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/account/AccountProtocolAct;

.field public l:Ll/zu;

.field public m:Ll/bm5;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/AccountProtocolAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uu;->k:Lcom/p1/mobile/putong/core/ui/account/AccountProtocolAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/uu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/uu;->n()V

    return-void
.end method

.method public static synthetic b(Ll/uu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uu;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/uu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uu;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/uu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uu;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/uu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uu;->q(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/uu;)Ll/bm5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uu;->m:Ll/bm5;

    return-object p0
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uu;->m:Ll/bm5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bm5;->show()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/pf60;

    .line 10
    .line 11
    const-string v0, "select_click_type"

    .line 12
    .line 13
    const-string v1, "policy"

    .line 14
    .line 15
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    filled-new-array {p1}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "e_delete_account_interact_block_button"

    .line 23
    .line 24
    invoke-static {v0, p0, p1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_delete_account_interact_block_cancel"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_delete_account_interact_block_confirm"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/uu;->l()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/uu;->g:Lv/VCheckBox;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;->Z1(Lcom/p1/mobile/android/app/Act;I)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const-string p0, "\u8bf7\u786e\u8ba4\u5e76\u52fe\u9009\u5168\u90e8\u6ce8\u9500\u6761\u4ef6"

    .line 53
    .line 54
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uu;->k:Lcom/p1/mobile/putong/core/ui/account/AccountProtocolAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vu;->b(Ll/uu;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ou;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uu;->j(Ll/ou;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uu;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/ou;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "\u8d26\u53f7\u5185\u94b1\u5305\u7ed3\u6e05"

    .line 12
    .line 13
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "\u901a\u8fc7\u4f7f\u7528\u63a2\u63a2\u670d\u52a1\u83b7\u5f97\u7684\u8d44\u4ea7\u6216\u865a\u62df\u6743\u76ca\u7b49\u8d22\u4ea7\u6027\u5229\u76ca\uff08\u5305\u62ec\u4e0d\u9650\u4e8e\u63a2\u63a2\u94b1\u5305\u4f59\u989d\u3001\u76f4\u64ad\u6536\u76ca\u3001\u865a\u62df\u793c\u7269\u6536\u76ca\u7b49\uff09\uff0c\u60a8\u53ef\u4ee5\u9009\u62e9\u63d0\u73b0\u540e\u8fdb\u884c\u6ce8\u9500\u6216\u540c\u610f\u653e\u5f03\u540e\u8fdb\u884c\u6ce8\u9500\u3002\u5176\u4e2d\u63a2\u63a2\u5e01\u4e0d\u53ef\u63d0\u73b0\uff0c\u60a8\u53ef\u4ee5\u8fdb\u884c\u6d88\u8d39\u540e\u518d\u8fdb\u884c\u6ce8\u9500\uff0c\u5982\u76f4\u63a5\u6ce8\u9500\u5219\u89c6\u4e3a\u60a8\u540c\u610f\u653e\u5f03\uff0c\u5c06\u65e0\u6cd5\u7ee7\u7eed\u4f7f\u7528"

    .line 16
    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 21
    .line 22
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 28
    .line 29
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "\u4f1a\u5458\u670d\u52a1\u7ed3\u6e05"

    .line 33
    .line 34
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 35
    .line 36
    const-string v3, "\u60a8\u7684VIP\u7279\u6743\u3001SVIP\u7279\u6743\u53ca\u670d\u52a1\uff08\u5305\u62ec\u5c1a\u672a\u4f7f\u7528\u5b8c\u6bd5\u7684\u8d85\u7ea7\u559c\u6b22\u3001\u4f18\u5148\u63a8\u8350\u3001\u95ea\u804a\u6b21\u6570\u7b49\u589e\u503c\u670d\u52a1\uff09\u6709\u6548\u671f\u5c06\u4f5c\u5e9f"

    .line 37
    .line 38
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 39
    .line 40
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 41
    .line 42
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 43
    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 48
    .line 49
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v3, "\u76f8\u5173\u4fe1\u606f\u8d44\u4ea7"

    .line 53
    .line 54
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "\u6ce8\u9500\u8d26\u6237\u540e\uff0c\u60a8\u5c06\u6c38\u8fdc\u5931\u53bb\u8be5\u8d26\u6237\u7684\u6240\u6709\u804a\u5929\u8bb0\u5f55\u3001\u914d\u5bf9\u4fe1\u606f\u3001\u4e2a\u4eba\u8d44\u6599\u3001\u52a8\u6001\u3001\u8d22\u5bcc\u7b49\u7ea7\u3001\u83b7\u8d60\u793c\u7269\u3001\u8d26\u5355\u8bb0\u5f55\u3001\u7ea2\u5305\u8bb0\u5f55\u7b49\uff0c\u4e14\u65e0\u6cd5\u6062\u590d\uff0c\u8bf7\u8c28\u614e\u64cd\u4f5c"

    .line 57
    .line 58
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 59
    .line 60
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 61
    .line 62
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 68
    .line 69
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v3, "\u81ea\u52a8\u8ba2\u9605\u670d\u52a1\u548c\u81ea\u52a8\u7eed\u8d39"

    .line 73
    .line 74
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 75
    .line 76
    const-string v3, "App Store\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u8bf7\u5728iTunes\u5546\u5e97\u5185\u624b\u52a8\u53d6\u6d88\u7eed\u8d39\u670d\u52a1\uff0c\u5176\u4ed6\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u5c06\u5728\u6ce8\u9500\u540e\u81ea\u52a8\u5173\u95ed\u7eed\u8d39\u670d\u52a1"

    .line 77
    .line 78
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 79
    .line 80
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 81
    .line 82
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 83
    .line 84
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    new-instance v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 88
    .line 89
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v3, "\u5b89\u5168\u98ce\u9669\u5ba1\u6838"

    .line 93
    .line 94
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 95
    .line 96
    const-string v3, "\u8d26\u53f7\u5904\u4e8e\u6b63\u5e38\u4f7f\u7528\u72b6\u6001\uff0c30\u5929\u5185\u65e0\u5f02\u5e38\u767b\u5f55/\u4fee\u6539\u5bc6\u7801\u64cd\u4f5c\uff0c\u8d26\u53f7\u65e0\u672a\u5904\u7406\u5b8c\u7684\u6295\u8bc9/\u4e3e\u62a5"

    .line 97
    .line 98
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 99
    .line 100
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 101
    .line 102
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 103
    .line 104
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/uu;->l:Ll/zu;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Ll/zu;->H(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public l()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uu;->l:Ll/zu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zu;->C()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Ll/uu;->l:Ll/zu;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zu;->C()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 35
    .line 36
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    return v1

    .line 41
    :cond_1
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_2
    return v1
.end method

.method public r()V
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_delete_account_interact_block_confirm"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/uu;->b:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    const-string v1, "\u6ce8\u9500\u8d26\u53f7"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/uu;->b:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    new-instance v1, Ll/pu;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/pu;-><init>(Ll/uu;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/uu;->d:Lv/VRecyclerView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/zu;

    .line 46
    .line 47
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-direct {v0, v1}, Ll/zu;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/uu;->l:Ll/zu;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/uu;->k()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/uu;->d:Lv/VRecyclerView;

    .line 60
    .line 61
    iget-object v1, p0, Ll/uu;->l:Ll/zu;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/bm5;

    .line 67
    .line 68
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x5

    .line 73
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Ll/uu;->m:Ll/bm5;

    .line 77
    .line 78
    new-instance v1, Ll/uu$a;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/uu$a;-><init>(Ll/uu;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/uu;->h:Landroid/widget/TextView;

    .line 87
    .line 88
    const-string v1, "#4c000000"

    .line 89
    .line 90
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    new-instance v2, Ll/qu;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/qu;-><init>(Ll/uu;)V

    .line 97
    .line 98
    .line 99
    const-string v3, "\u300a\u63a2\u63a2\u6ce8\u9500\u8d26\u6237\u987b\u77e5\u300b"

    .line 100
    .line 101
    invoke-static {v0, v3, v1, v2}, Ll/fsj0;->a(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/uu;->h:Landroid/widget/TextView;

    .line 105
    .line 106
    const/4 v1, 0x3

    .line 107
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const/4 v2, 0x1

    .line 112
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/uu;->g:Lv/VCheckBox;

    .line 116
    .line 117
    new-instance v1, Ll/ru;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/ru;-><init>(Ll/uu;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/uu;->i:Lv/VButton;

    .line 126
    .line 127
    new-instance v1, Ll/su;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/su;-><init>(Ll/uu;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/uu;->j:Lv/VText;

    .line 136
    .line 137
    new-instance v1, Ll/tu;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/tu;-><init>(Ll/uu;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method
