.class public Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;Lcom/p1/mobile/putong/core/data/School;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->d(Lcom/p1/mobile/putong/core/data/School;ZLandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jbe0;->a(Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/School;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->c()Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->c:Ll/bme0;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/bme0;->w(Lcom/p1/mobile/putong/core/data/School;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(ZLcom/p1/mobile/putong/core/data/School;IZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    if-eqz p4, :cond_1

    .line 18
    .line 19
    move p4, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move p4, v0

    .line 22
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->b:Lv/VText;

    .line 23
    .line 24
    invoke-static {v2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->a:Landroid/view/View;

    .line 28
    .line 29
    if-eqz p4, :cond_2

    .line 30
    .line 31
    if-eqz p3, :cond_2

    .line 32
    .line 33
    move v0, v1

    .line 34
    :cond_2
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->c:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    new-instance p4, Ll/ibe0;

    .line 40
    .line 41
    invoke-direct {p4, p0, p2, p1}, Ll/ibe0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;Lcom/p1/mobile/putong/core/data/School;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->d:Lv/VText;

    .line 48
    .line 49
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
