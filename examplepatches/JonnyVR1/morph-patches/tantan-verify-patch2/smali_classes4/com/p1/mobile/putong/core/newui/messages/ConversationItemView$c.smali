.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->d(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->n:Ll/w30;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic d(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget p3, Lcom/p1/mobile/putong/core/R$string;->yp:I

    .line 10
    .line 11
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/g;->Tf(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->n:Ll/w30;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->yp:I

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v1, 0x1

    .line 31
    new-array v2, v1, [Ljava/lang/CharSequence;

    .line 32
    .line 33
    aput-object p1, v2, v0

    .line 34
    .line 35
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/w30$b;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v0, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sget v4, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v3}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v3, Ll/ge6;

    .line 67
    .line 68
    invoke-direct {v3, p0}, Ll/ge6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Ll/he6;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/he6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->n:Ll/w30;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->n:Ll/w30;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 99
    .line 100
    .line 101
    return v1

    .line 102
    :cond_0
    return v0
.end method
