.class public Ll/d66;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/s56;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroidx/viewpager2/widget/ViewPager2;

.field public final d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

.field public e:I

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public h:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/p56;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/d66;->e:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/d66;->f:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/d66;->g:Ljava/util/List;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/d66;->h:Ll/pcj;

    .line 23
    .line 24
    iput-object v0, p0, Ll/d66;->i:Ll/pcj;

    .line 25
    .line 26
    iput-object p1, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Ll/d66;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d66;->s(Landroid/view/View;)V

    return-void
.end method

.method private p()V
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/R$string;->h1:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    const/high16 v1, 0x41a80000    # 21.0f

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/b9c0;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    const/high16 v1, 0x40000000    # 2.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 51
    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    const/4 v2, 0x1

    .line 55
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/d66;->a:Lv/navigationbar/VNavigationBar;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/d66;->a:Lv/navigationbar/VNavigationBar;

    .line 64
    .line 65
    iget-object p0, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e66;->b(Ll/d66;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/s56;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d66;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d66;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v2, p0, Ll/d66;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 22
    .line 23
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Ll/kec0;->u:I

    .line 28
    .line 29
    iget-object v4, p0, Ll/d66;->b:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v2, v3, v4, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v3, Ll/c66;

    .line 36
    .line 37
    invoke-direct {v3, p0}, Ll/c66;-><init>(Ll/d66;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    if-lez v1, :cond_0

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    sget v4, Ll/qa00;->g:I

    .line 52
    .line 53
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 54
    .line 55
    iget-object v4, p0, Ll/d66;->b:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    invoke-virtual {v4, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    iget-object v3, p0, Ll/d66;->b:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    :goto_1
    iget-object v3, p0, Ll/d66;->f:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d66;->h:Ll/pcj;

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
    iget-object v0, p0, Ll/d66;->g:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Ll/d66;->e:I

    .line 18
    .line 19
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 20
    .line 21
    iget-object p0, p0, Ll/d66;->h:Ll/pcj;

    .line 22
    .line 23
    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-ne v0, p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d66;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d66;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/d66;->m(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/d66;->l(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s56;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d66;->c(Ll/s56;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d66;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Landroid/view/View;II)V
    .locals 3

    .line 1
    sget v0, Ll/adc0;->h3:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/d66;->h:Ll/pcj;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 22
    .line 23
    iget-object v2, p0, Ll/d66;->h:Ll/pcj;

    .line 24
    .line 25
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ne p3, v1, :cond_1

    .line 30
    .line 31
    iget p0, p0, Ll/d66;->e:I

    .line 32
    .line 33
    if-eq p0, p3, :cond_1

    .line 34
    .line 35
    if-lez p2, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0x63

    .line 42
    .line 43
    invoke-static {p2, p0}, Ll/a9g0;->g(II)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public k(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/d66;->e:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/d66;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/pcj;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public l(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d66;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d66;->d()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Ll/d66;->f:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Ll/d66;->n(II)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public final m(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/d66;->g:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/d66;->h:Ll/pcj;

    .line 14
    .line 15
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/d66;->i:Ll/pcj;

    .line 26
    .line 27
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/p56;

    .line 33
    .line 34
    iget-object v1, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ll/p56;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/d66;->j:Ll/p56;

    .line 40
    .line 41
    iget-object v0, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 48
    .line 49
    const/4 v2, -0x1

    .line 50
    invoke-virtual {v0, v2}, Landroidx/viewpager2/widget/ViewPager2;->setOffscreenPageLimit(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 54
    .line 55
    iget-object v3, p0, Ll/d66;->j:Ll/p56;

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/d66;->j:Ll/p56;

    .line 61
    .line 62
    iget-object v3, p0, Ll/d66;->g:Ljava/util/List;

    .line 63
    .line 64
    invoke-virtual {v0, v3}, Ll/p56;->U(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    const-string v0, "currentIndex"

    .line 74
    .line 75
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-ltz v2, :cond_0

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Ll/d66;->e:I

    .line 86
    .line 87
    iget-object p0, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 88
    .line 89
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    iget-object p1, p0, Ll/d66;->g:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_1

    .line 100
    .line 101
    iput v1, p0, Ll/d66;->e:I

    .line 102
    .line 103
    :cond_1
    iget p1, p0, Ll/d66;->e:I

    .line 104
    .line 105
    if-ltz p1, :cond_2

    .line 106
    .line 107
    iget-object p0, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 108
    .line 109
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void
.end method

.method public final n(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d66;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    iget-object v1, p0, Ll/d66;->g:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/pcj;

    .line 16
    .line 17
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    :cond_0
    sget v2, Ll/adc0;->Sd:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/d66;->e:I

    .line 39
    .line 40
    if-ne p1, v1, :cond_1

    .line 41
    .line 42
    const-string v1, "#FFFFFF"

    .line 43
    .line 44
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    sget v1, Ll/dbc0;->l0:I

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const-string v1, "#4D000000"

    .line 58
    .line 59
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 68
    .line 69
    .line 70
    :goto_0
    invoke-virtual {p0, v0, p2, p1}, Ll/d66;->j(Landroid/view/View;II)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d66;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/d66;->a:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/16 p1, 0x8

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d66;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget v1, p0, Ll/d66;->e:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Se()Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Se()Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 41
    .line 42
    iget v1, v1, Lcom/p1/mobile/putong/data/CounterConversations;->addressBookUnseen:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move v1, v2

    .line 46
    :goto_0
    iget v3, p0, Ll/d66;->e:I

    .line 47
    .line 48
    iget-object v4, p0, Ll/d66;->g:Ljava/util/List;

    .line 49
    .line 50
    iget-object v5, p0, Ll/d66;->h:Ll/pcj;

    .line 51
    .line 52
    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-ne v3, v4, :cond_3

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 61
    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Cp(J)V

    .line 67
    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 72
    .line 73
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 74
    .line 75
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    long-to-double v3, v3

    .line 80
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 81
    .line 82
    .line 83
    sget v1, Ll/adc0;->h3:I

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Landroid/widget/TextView;

    .line 90
    .line 91
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    move v1, v2

    .line 95
    :cond_3
    iget-object p1, p0, Ll/d66;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 96
    .line 97
    invoke-virtual {p1, v0, v2}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 98
    .line 99
    .line 100
    iput v0, p0, Ll/d66;->e:I

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Ll/d66;->l(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/d66;->h:Ll/pcj;

    .line 106
    .line 107
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_4

    .line 112
    .line 113
    iget-object p1, p0, Ll/d66;->g:Ljava/util/List;

    .line 114
    .line 115
    iget-object v1, p0, Ll/d66;->h:Ll/pcj;

    .line 116
    .line 117
    invoke-interface {p1, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-ne v0, p1, :cond_4

    .line 122
    .line 123
    iget-object p0, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->pageId()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string p1, "e_contacts_matches"

    .line 130
    .line 131
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 137
    .line 138
    invoke-static {}, Ll/pzi0;->o()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Cp(J)V

    .line 143
    .line 144
    .line 145
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 148
    .line 149
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 152
    .line 153
    .line 154
    move-result-wide v0

    .line 155
    long-to-double v0, v0

    .line 156
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_4
    iget-object p1, p0, Ll/d66;->i:Ll/pcj;

    .line 161
    .line 162
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    iget-object p1, p0, Ll/d66;->g:Ljava/util/List;

    .line 169
    .line 170
    iget-object v1, p0, Ll/d66;->i:Ll/pcj;

    .line 171
    .line 172
    invoke-interface {p1, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-ne v0, p1, :cond_5

    .line 177
    .line 178
    iget-object p0, p0, Ll/d66;->d:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->pageId()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string p1, "e_contacts_groups"

    .line 185
    .line 186
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_5
    :goto_1
    return-void
.end method
