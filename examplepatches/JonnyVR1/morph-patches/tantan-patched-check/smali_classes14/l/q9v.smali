.class public Ll/q9v;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/x9v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;

.field public b:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/nus;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/cyr;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/q9v;->a:Ll/nus;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q2(Ljava/lang/String;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q9v;->a:Ll/nus;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public r2()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q9v;->a:Ll/nus;

    .line 2
    .line 3
    return-object p0
.end method

.method public s2(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public u2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/x9v;

    .line 4
    .line 5
    iget-object v0, v0, Ll/x9v;->d:Ll/p2u;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    check-cast v0, Ll/x9v;

    .line 17
    .line 18
    iget-object v0, v0, Ll/x9v;->d:Ll/p2u;

    .line 19
    .line 20
    check-cast p0, Ll/x9v;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/x9v;->f()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ll/p2u;->n(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q9v;->b:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/x9v;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/x9v;->k(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q9v;->b:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/q9v;->b:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/p9v;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ll/p9v;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-ltz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/x9v;

    .line 35
    .line 36
    iget-object p0, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
