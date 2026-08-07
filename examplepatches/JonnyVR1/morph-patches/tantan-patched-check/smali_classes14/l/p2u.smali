.class public Ll/p2u;
.super Ll/bvu;
.source "SourceFile"


# instance fields
.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ljava/lang/String;

.field public final n:Ll/nus;


# direct methods
.method public constructor <init>(Ll/nus;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {p0, v0, v1, v2, v2}, Ll/bvu;-><init>(Landroidx/fragment/app/FragmentManager;ZII)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/p2u;->l:Ljava/util/List;

    .line 18
    .line 19
    iput-object p2, p0, Ll/p2u;->m:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, p0, Ll/p2u;->n:Ll/nus;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic l(Ll/p2u;)Ll/nus;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p2u;->m()Ll/nus;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2u;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(I)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/p2u;->l:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "tab_name_extra"

    .line 24
    .line 25
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/p2u;->l:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getTabId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v2, "tab_id_extra"

    .line 41
    .line 42
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string p1, "source_extra"

    .line 46
    .line 47
    iget-object v2, p0, Ll/p2u;->m:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, p1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 53
    .line 54
    .line 55
    new-instance p1, Ll/o2u;

    .line 56
    .line 57
    invoke-direct {p1, p0}, Ll/o2u;-><init>(Ll/p2u;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->Y4(Ll/pcj;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->T4(Z)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public final synthetic m()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2u;->n:Ll/nus;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->p()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public o(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/p2u;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->T4(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public p(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/p2u;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->T4(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p2u;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p2u;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
