.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:I

.field public final k:I

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->k:I

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->k:I

    const/4 p2, 0x2

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->k:I

    const/4 p2, 0x2

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->g(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Lcom/p1/mobile/android/app/Frag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->i(Lcom/p1/mobile/android/app/Frag;Ll/pf60;)V

    return-void
.end method

.method private setBarStyle(I)V
    .locals 4

    .line 1
    const-string v0, "#FF000000"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "#66000000"

    .line 8
    .line 9
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->b:Lv/VText;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    move v3, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v3, v1

    .line 20
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->b:Lv/VText;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    sget v3, Ll/agc0;->B:I

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sget v3, Ll/agc0;->C:I

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 36
    .line 37
    .line 38
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h:Lv/VText;

    .line 39
    .line 40
    if-eqz v2, :cond_4

    .line 41
    .line 42
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 43
    .line 44
    if-ne p1, v3, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v0, v1

    .line 48
    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h:Lv/VText;

    .line 54
    .line 55
    if-ne p1, v0, :cond_3

    .line 56
    .line 57
    sget p1, Ll/agc0;->B:I

    .line 58
    .line 59
    invoke-static {v1, p1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 60
    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_3
    sget p1, Ll/agc0;->C:I

    .line 64
    .line 65
    invoke-static {v1, p1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 66
    .line 67
    .line 68
    :cond_4
    :goto_3
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    .line 69
    .line 70
    if-lez p1, :cond_5

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->b:Lv/VText;

    .line 73
    .line 74
    int-to-float p1, p1

    .line 75
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h:Lv/VText;

    .line 79
    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    .line 83
    .line 84
    int-to-float p0, p0

    .line 85
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 86
    .line 87
    .line 88
    :cond_5
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jf6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Frag;Ll/z20;)V
    .locals 2
    .param p2    # Ll/z20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->setBarStyle(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->b:Lv/VText;

    .line 6
    .line 7
    new-instance v1, Ll/gf6;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2}, Ll/gf6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Ll/z20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h:Lv/VText;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v1, Ll/hf6;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2}, Ll/hf6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Ll/z20;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->q2:Lrx/subjects/a;

    .line 36
    .line 37
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Ll/if6;

    .line 50
    .line 51
    invoke-direct {v0, p0, p1}, Ll/if6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;Lcom/p1/mobile/android/app/Frag;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic g(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_messages_view"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p2, 0x0

    .line 14
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->c:Lv/VText;

    .line 19
    .line 20
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic h(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_message_tab_whisper_entry_click"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 11
    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-interface {p1, p2, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Frag;Ll/pf60;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->k(I)V

    .line 17
    .line 18
    .line 19
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-lez p1, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_1
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->c:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->setBarStyle(I)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j(Z)V

    .line 11
    .line 12
    .line 13
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 14
    .line 15
    if-eq p1, v0, :cond_2

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->j:I

    .line 18
    .line 19
    const-string p0, "e_messages_view"

    .line 20
    .line 21
    const-string p1, "p_messages_view"

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    :goto_0
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->i:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/adc0;->Hf:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/FrameLayout;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    sget v0, Ll/adc0;->Qf:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lv/VText;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->h:Lv/VText;

    .line 26
    .line 27
    sget v0, Ll/adc0;->Nf:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lv/VText;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->i:Lv/VText;

    .line 36
    .line 37
    return-void
.end method

.method public setIntlTabTextSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setWhisperTabPosition(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method
