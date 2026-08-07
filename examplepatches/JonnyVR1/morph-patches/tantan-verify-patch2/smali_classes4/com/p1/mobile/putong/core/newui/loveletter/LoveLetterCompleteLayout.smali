.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;

.field public b:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pdw;->u0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;

    .line 2
    .line 3
    invoke-virtual {v0, p3, p4}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    new-instance p4, Ll/hcw;

    .line 9
    .line 10
    invoke-direct {p4, p1, p2, p3}, Ll/hcw;-><init>(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->P7:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;

    .line 13
    .line 14
    sget v0, Ll/adc0;->ad:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
