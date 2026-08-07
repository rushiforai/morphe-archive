.class public Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;
.super Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->e:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->d:Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;

    .line 6
    .line 7
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->g:Lv/VText;

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    invoke-super/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->f(Lcom/p1/mobile/putong/core/data/Message;Landroid/widget/TextView;Lv/VDraweeView;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    .line 12
    .line 13
    .line 14
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
    const/4 p0, 0x0

    return-object p0
.end method

.method public b()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->getMainPresenter()Ll/clz;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->i()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {v0, v2, v3, v1, v4}, Ll/clz;->z6(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ll/clz;->t6(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v0, v2}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 73
    .line 74
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->a:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 75
    .line 76
    invoke-interface {v0, v2, v3, v4, v1}, Ll/r97;->j4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    if-nez p1, :cond_1

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 94
    .line 95
    invoke-interface {p1, v0, p0}, Ll/r97;->V2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public g(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->h:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/g9c0;->z:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->b()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Ll/g9c0;->o:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->h:Lv/VText;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const-string p1, "\u5df2\u62c6\u5f00"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const-string p1, "\u5f85\u62c6\u5f00"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y130;->a(Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->c:Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;->c:Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->beThanked:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->f:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageLeft;->h:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
