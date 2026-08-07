.class public Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

.field public b:Lv/VLinear;

.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VLinear;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/lang/Runnable;

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->m:Ljava/util/HashSet;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->o:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->m:Ljava/util/HashSet;

    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->m:Ljava/util/HashSet;

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->o:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "shortcut_type"

    .line 15
    .line 16
    const-string p2, "ice_break_write"

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p2, "e_close_click"

    .line 27
    .line 28
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->f(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l3q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/g;->e0:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p4}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 36
    .line 37
    invoke-virtual {p0, p4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->j(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 38
    .line 39
    .line 40
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p4, p2, p1}, Ll/dkb;->I9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 79
    .line 80
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public final synthetic f(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/g;->e0:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p4}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 37
    .line 38
    invoke-virtual {p0, p4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->j(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 39
    .line 40
    .line 41
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p4, p2, p1}, Ll/dkb;->I9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_0

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 80
    .line 81
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->f:Lv/VImage;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->d:Lv/VImage;

    .line 58
    .line 59
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->i(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 66
    .line 67
    sget v3, Ll/ibc0;->D1:I

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 73
    .line 74
    const/high16 v3, 0x41700000    # 15.0f

    .line 75
    .line 76
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 80
    .line 81
    const-string v3, "#9C6F7B"

    .line 82
    .line 83
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->d:Lv/VImage;

    .line 95
    .line 96
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 100
    .line 101
    sget v3, Ll/ibc0;->w5:I

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 107
    .line 108
    const/high16 v3, 0x41600000    # 14.0f

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 114
    .line 115
    const-string v3, "#66000000"

    .line 116
    .line 117
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-ne v2, v4, :cond_2

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->j:Lv/VLinear;

    .line 131
    .line 132
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 136
    .line 137
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->M5:I

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    const-string v4, "1"

    .line 144
    .line 145
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 157
    .line 158
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 163
    .line 164
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 174
    .line 175
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 176
    .line 177
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 182
    .line 183
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 184
    .line 185
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    check-cast v1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 190
    .line 191
    invoke-virtual {p0, p2, v2, v3, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_1

    .line 195
    .line 196
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-le v2, v4, :cond_3

    .line 201
    .line 202
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->j:Lv/VLinear;

    .line 203
    .line 204
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 208
    .line 209
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->M5:I

    .line 210
    .line 211
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    const-string v5, "2"

    .line 216
    .line 217
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 229
    .line 230
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 235
    .line 236
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k:Lv/VText;

    .line 242
    .line 243
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 248
    .line 249
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    new-instance v2, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 264
    .line 265
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    const-string v3, ";"

    .line 271
    .line 272
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    check-cast v5, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 280
    .line 281
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    new-instance v5, Ljava/lang/StringBuilder;

    .line 291
    .line 292
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 293
    .line 294
    .line 295
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v6

    .line 299
    check-cast v6, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 300
    .line 301
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    check-cast v3, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 314
    .line 315
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v3

    .line 324
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    check-cast v1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 329
    .line 330
    invoke-virtual {p0, p2, v2, v3, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 331
    .line 332
    .line 333
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->g:Lv/VLinear;

    .line 334
    .line 335
    new-instance v2, Ll/i3q;

    .line 336
    .line 337
    invoke-direct {v2, p0, v0, p2, p1}, Ll/i3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1, v2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 341
    .line 342
    .line 343
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->j:Lv/VLinear;

    .line 344
    .line 345
    new-instance v2, Ll/j3q;

    .line 346
    .line 347
    invoke-direct {v2, p0, v0, p2, p1}, Ll/j3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v1, v2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 351
    .line 352
    .line 353
    :cond_4
    :goto_2
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->g(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/h39;->J()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    const-string p2, "\u5979"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p2, "\u4ed6"

    .line 40
    .line 41
    :goto_0
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v1, "\u548c%s\u6253\u4e2a\u62db\u547c\u5427"

    .line 46
    .line 47
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 55
    .line 56
    sget v0, Ll/qa00;->g:I

    .line 57
    .line 58
    invoke-static {p2, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 62
    .line 63
    sget v0, Ll/qa00;->m:I

    .line 64
    .line 65
    invoke-static {p2, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-static {p2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 75
    .line 76
    invoke-static {p2, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->f:Lv/VImage;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->f:Lv/VImage;

    .line 86
    .line 87
    new-instance p2, Ll/k3q;

    .line 88
    .line 89
    invoke-direct {p2, p3, p1}, Ll/k3q;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/hcm;->s()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/hcm;->D(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->o:Z

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 54
    .line 55
    sget p2, Ll/ibc0;->V1:I

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const-string v0, "message_id"

    .line 14
    .line 15
    const-string v1, "chat_content"

    .line 16
    .line 17
    const-string v2, "p_chat_view"

    .line 18
    .line 19
    const-string v3, "e_chat_topic"

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "response_uuid"

    .line 32
    .line 33
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/BreakIce;->response_uuid:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    filled-new-array {p0, p1, p2}, [Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v3, v2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v3, v2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/BreakIce;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->m:Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    const-string p1, "message_id"

    .line 31
    .line 32
    const-string v0, "chat_content"

    .line 33
    .line 34
    const-string v1, "p_chat_view"

    .line 35
    .line 36
    const-string v2, "e_chat_topic"

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "response_uuid"

    .line 49
    .line 50
    iget-object p3, p4, Lcom/p1/mobile/putong/core/data/BreakIce;->response_uuid:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    filled-new-array {p0, p1, p2}, [Ll/sfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v2, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v2, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->n:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 28
    .line 29
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->b:Lv/VLinear;

    .line 51
    .line 52
    sget v1, Ll/ibc0;->D1:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 58
    .line 59
    const/high16 v1, 0x41700000    # 15.0f

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 65
    .line 66
    const-string v1, "#9C6F7B"

    .line 67
    .line 68
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v1, "https://fe-static.tancdn.com/v1/raw/4a4c8be8-97f8-48e0-a98b-0d2cbd93f7d814.svga"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_1

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->d:Lv/VImage;

    .line 118
    .line 119
    sget v1, Ll/ibc0;->R1:I

    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->f:Lv/VImage;

    .line 125
    .line 126
    sget v1, Ll/ibc0;->n7:I

    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->i:Lv/VImage;

    .line 132
    .line 133
    sget v1, Ll/ibc0;->Q1:I

    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->l:Lv/VImage;

    .line 139
    .line 140
    sget v1, Ll/ibc0;->Q1:I

    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->e:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    sget v2, Ll/g9c0;->i:I

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h:Lv/VText;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    sget v2, Ll/g9c0;->g:I

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->k:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    sget v1, Ll/g9c0;->g:I

    .line 182
    .line 183
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 188
    .line 189
    .line 190
    :cond_1
    return-void
.end method
