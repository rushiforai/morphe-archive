.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/w25<",
        "Ll/dw40;",
        ">;>;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Ll/w25;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w25<",
            "Ll/dw40;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Z

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->e:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->f:Z

    .line 9
    .line 10
    sget p2, Ll/pae;->a:I

    .line 11
    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->g:I

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->h:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->e(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->d:Ll/w25;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v0, v1}, Ll/w25;->c4(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m35;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/w25;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w25<",
            "Ll/dw40;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->d:Ll/w25;

    .line 2
    .line 3
    return-void
.end method

.method public d(I)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->j:I

    .line 2
    .line 3
    sub-int/2addr p1, v0

    .line 4
    const/high16 v0, 0x43430000    # 195.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lt p1, v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->destroy()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->e:Z

    .line 8
    .line 9
    sget v0, Ll/pae;->a:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->setDefaultHeight(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/j35;->a(Landroid/view/View;Z)I

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->I()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->l(Z)V

    .line 24
    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->h:Z

    .line 27
    .line 28
    const/high16 v0, 0x26000000

    .line 29
    .line 30
    const/16 v1, 0xc

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->i(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final i(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->J()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    sget v0, Ll/pae;->c:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget v0, Ll/pae;->a:I

    .line 12
    .line 13
    :goto_0
    if-eqz p1, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->g:I

    .line 17
    .line 18
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->b:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->j(IZ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w25;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c(Ll/w25;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    sget p1, Ll/pae;->l:I

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    .line 27
    sget p2, Ll/pae;->k:I

    .line 28
    .line 29
    add-int/2addr p1, p2

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public k(Ljava/lang/Boolean;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->i(ZZ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    neg-int p1, p2

    .line 12
    int-to-float p1, p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ive0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x1d

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    const-string v0, "live_chat_textbox_type"

    .line 2
    .line 3
    const-string v1, "click"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->d:Ll/w25;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "e_live_chat_textbox"

    .line 16
    .line 17
    invoke-static {v1, p0, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Ll/j35;->a(Landroid/view/View;Z)I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->i(ZZ)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->c:Landroid/view/View;

    .line 15
    .line 16
    new-instance v1, Ll/k35;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/k35;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setDefaultHeight(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget p1, Ll/pae;->b:I

    .line 6
    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->g:I

    .line 8
    .line 9
    if-ne v0, p1, :cond_1

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->g:I

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->i(ZZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setLiveMode(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->f:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->f:Z

    .line 6
    .line 7
    sget p1, Ll/pae;->b:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->setDefaultHeight(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
