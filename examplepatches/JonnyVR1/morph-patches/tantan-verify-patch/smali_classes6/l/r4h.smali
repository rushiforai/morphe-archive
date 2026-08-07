.class public abstract Ll/r4h;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r4h$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:Lorg/apmem/tools/layouts/FlowLayout;

.field public e:Ll/r4h$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r4h$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r4h;->c:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s(Ll/r4h;Landroid/view/View;Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r4h;->w(Landroid/view/View;Ljava/lang/Object;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ll/r4h$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/r4h$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r4h;->e:Ll/r4h$a;

    .line 2
    .line 3
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/r4h;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/r4h;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public notifyDataSetChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/r4h;->y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r4h;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Lorg/apmem/tools/layouts/FlowLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r4h;->d:Lorg/apmem/tools/layouts/FlowLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r4h;->y()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w(Landroid/view/View;Ljava/lang/Object;ILandroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-ne p4, p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->B2:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p4}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p4, p0, Ll/r4h;->e:Ll/r4h$a;

    .line 34
    .line 35
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p4

    .line 39
    if-eqz p4, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/r4h;->e:Ll/r4h$a;

    .line 42
    .line 43
    invoke-interface {p0, p1, p2, p3}, Ll/r4h$a;->a(Landroid/view/View;Ljava/lang/Object;I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public y()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/r4h;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/r4h;->d:Lorg/apmem/tools/layouts/FlowLayout;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Ll/r4h;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ge v0, v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0, v0}, Ll/r4h;->getItem(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v3, p0, Ll/r4h;->d:Lorg/apmem/tools/layouts/FlowLayout;

    .line 35
    .line 36
    invoke-virtual {p0, v3, v1}, Ll/dq1;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    new-instance v4, Ll/q4h;

    .line 41
    .line 42
    invoke-direct {v4, p0, v3, v2, v0}, Ll/q4h;-><init>(Ll/r4h;Landroid/view/View;Ljava/lang/Object;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v3, v2, v1, v0}, Ll/dq1;->j(Landroid/view/View;Ljava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/r4h;->d:Lorg/apmem/tools/layouts/FlowLayout;

    .line 52
    .line 53
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v0, v0, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :goto_1
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r4h;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r4h;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
