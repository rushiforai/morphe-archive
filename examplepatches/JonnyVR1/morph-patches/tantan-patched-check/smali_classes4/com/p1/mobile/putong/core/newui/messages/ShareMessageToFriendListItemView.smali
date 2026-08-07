.class public Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$b;,
        Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;
    }
.end annotation


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VCheckBox;

.field public f:Lcom/p1/mobile/putong/core/data/Conversation;

.field public g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;


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

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->W(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->X(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->c:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Lv/VCheckBox;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->e:Lv/VCheckBox;

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->d:Lv/VText;

    return-void
.end method

.method private synthetic X(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->c:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$b;->a(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;->s(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;

    .line 36
    .line 37
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;->b()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;->w(Lcom/p1/mobile/putong/core/data/Conversation;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public Y(Lcom/p1/mobile/android/app/Act;Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Z)V"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p2, p1, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/m2f0;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/m2f0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->e:Lv/VCheckBox;

    .line 30
    .line 31
    invoke-virtual {p0, p4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->e:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->e:Lv/VCheckBox;

    .line 8
    .line 9
    new-instance v1, Ll/l2f0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/l2f0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setOnSelectChangeListener(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->g:Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;

    .line 2
    .line 3
    return-void
.end method
