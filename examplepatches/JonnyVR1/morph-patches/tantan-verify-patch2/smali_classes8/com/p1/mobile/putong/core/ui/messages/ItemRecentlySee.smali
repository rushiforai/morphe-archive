.class public Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# static fields
.field public static g:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->onFinishInflate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/a$a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/a$a;->a()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->g(Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f()V

    return-void
.end method

.method public static synthetic e(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/p;->r3(Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/ifq;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/ifq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/jfq;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/jfq;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 3
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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ffq;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ffq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/ibc0;->x1:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/ovb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->y(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 7
    .line 8
    new-instance v0, Ll/gfq;

    .line 9
    .line 10
    invoke-direct {v0, p3}, Ll/gfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 17
    .line 18
    new-instance p3, Ll/hfq;

    .line 19
    .line 20
    invoke-direct {p3}, Ll/hfq;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 15
    .line 16
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->c:Lv/VDraweeView;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3, v0}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->d:Lv/VText;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1, p1}, Ll/r97;->q5(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->e:Lv/VText;

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    const/16 p0, 0x8

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->e:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 13
    .line 14
    sget v0, Ll/edc0;->O1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 23
    .line 24
    sget v0, Ll/edc0;->h0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->c:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/edc0;->Q4:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->d:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/edc0;->r0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->e:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/edc0;->A4:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->d:Lv/VText;

    .line 65
    .line 66
    const/4 v1, 0x1

    .line 67
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->d:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/g9c0;->g:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->e:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget v1, Ll/g9c0;->i:I

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->g:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;->setMaxWidth(I)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
