.class public Ll/xxy;
.super Ll/rxy;
.source "SourceFile"


# instance fields
.field public i:Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

.field public j:I


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/rxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->b:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->c:Lv/VText;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->d:Landroid/view/View;

    .line 22
    .line 23
    sub-int/2addr p3, v2

    .line 24
    if-eq p2, p3, :cond_0

    .line 25
    .line 26
    move v1, v2

    .line 27
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->c:Lv/VText;

    .line 31
    .line 32
    iget-object p0, p0, Ll/xxy;->i:Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->text:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public l()Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxy;->i:Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xxy;->j:I

    .line 2
    .line 3
    return p0
.end method
