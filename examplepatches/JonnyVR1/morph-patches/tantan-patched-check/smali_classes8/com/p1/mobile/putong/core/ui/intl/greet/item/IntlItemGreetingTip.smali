.class public Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip$a;->a(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
