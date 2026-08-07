.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->receiverTip:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->d:Lv/VText;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->d:Lv/VText;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->receiverTip:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->d:Lv/VText;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p1, Ll/g900;

    .line 5
    .line 6
    if-eqz p3, :cond_1

    .line 7
    .line 8
    check-cast p1, Ll/g900;

    .line 9
    .line 10
    iget-object p1, p1, Ll/g900;->r:Ll/n100;

    .line 11
    .line 12
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, p3}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Ll/n100;->b(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string p1, "opening_content"

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->d:Lv/VText;

    .line 34
    .line 35
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const-string p0, "receiver_show_tips"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p0, "receiver_no_tips"

    .line 45
    .line 46
    :goto_0
    const-string p2, "opening_message_type"

    .line 47
    .line 48
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "e_opening_message"

    .line 57
    .line 58
    const-string p2, "p_chat_view"

    .line 59
    .line 60
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->T2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemEmojiText;

    .line 13
    .line 14
    sget v0, Ll/edc0;->v3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;->d:Lv/VText;

    .line 23
    .line 24
    return-void
.end method
