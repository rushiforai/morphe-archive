.class public abstract Ll/n6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rpl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/rpl;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

.field public b:Ll/u4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/u4<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Ll/n6;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/n6<",
            "*>;"
        }
    .end annotation
.end field

.field public d:Ll/n6;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/n6<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/n6;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Ll/n6;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n6;->l(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Ll/n6;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n6;->j(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic e(Ll/n6;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n6;->k(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ll/ner;Ll/dq1;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/dq1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n6;->c:Ll/n6;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/n6;->b(Ll/ner;Ll/dq1;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract g()Ll/u4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/u4<",
            "TT;>;"
        }
    .end annotation
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

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
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 10
    .line 11
    iget-object v0, v0, Ll/u4;->b:Ljava/lang/Object;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0}, Ll/n6;->g()Ll/u4;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Ll/n6;->b:Ll/u4;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/u4;->s(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 25
    .line 26
    new-instance v1, Ll/j6;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/j6;-><init>(Ll/n6;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/u4;->f(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 35
    .line 36
    new-instance v1, Ll/k6;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/k6;-><init>(Ll/n6;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/u4;->g(Ll/y20;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 45
    .line 46
    new-instance v1, Ll/l6;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/l6;-><init>(Ll/n6;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/u4;->e(Ll/z20;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 55
    .line 56
    new-instance v1, Ll/m6;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/m6;-><init>(Ll/n6;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/u4;->h(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6;->b:Ll/u4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u4;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic j(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/n6;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-static {p0, p1, p2}, Ll/vnb;->w1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-static {p0, p1, p2}, Ll/vnb;->v1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/n6;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/n6;->b:Ll/u4;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u4;->q()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public abstract n()V
.end method

.method public final o()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->d:Ll/n6;

    .line 2
    .line 3
    :goto_0
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/n6;->o()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, v0, Ll/n6;->d:Ll/n6;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object p0, p0, Ll/n6;->b:Ll/u4;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/u4;->t()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method
