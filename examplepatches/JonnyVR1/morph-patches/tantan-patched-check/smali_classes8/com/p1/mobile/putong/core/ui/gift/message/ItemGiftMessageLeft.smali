.class public Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;
.super Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;
.source "SourceFile"


# instance fields
.field public b:Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;->c:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;->b:Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;

    .line 6
    .line 7
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;->e:Lv/VText;

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    invoke-super/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;->d(Lcom/p1/mobile/putong/core/data/Message;Landroid/widget/TextView;Lv/VDraweeView;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

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

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t5q;->a(Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageLeft;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
