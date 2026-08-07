.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/s56;",
        "Ll/d66;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ll/d66;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d66;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/d66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->f:Ll/d66;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic Y1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->a2()Ll/s56;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Z1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->b2()Ll/d66;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a2()Ll/s56;
    .locals 1

    .line 1
    new-instance v0, Ll/s56;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s56;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b2()Ll/d66;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->f:Ll/d66;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->f:Ll/d66;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/d66;->k(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookAct;->f:Ll/d66;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/d66;->f()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const-string v0, "currentIndex"

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_contacts"

    .line 2
    .line 3
    return-object p0
.end method
