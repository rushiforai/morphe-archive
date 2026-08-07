.class public Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/dk30;

.field public z:Ll/mk30;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public M4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->M4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dk30;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dk30;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->A:Ll/dk30;

    .line 10
    .line 11
    new-instance v0, Ll/mk30;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/mk30;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->z:Ll/mk30;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->A:Ll/dk30;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->A:Ll/dk30;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dk30;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/newMatch/NewMatchConversationListFrag;->z:Ll/mk30;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/mk30;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_new_match"

    .line 2
    .line 3
    return-object p0
.end method
