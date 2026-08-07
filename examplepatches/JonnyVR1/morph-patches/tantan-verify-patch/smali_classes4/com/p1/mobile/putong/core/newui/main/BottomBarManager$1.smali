.class Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;
.super Lv/bottombar/VBottomBarOldItem;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->l(Lv/bottombar/a;)Lv/bottombar/VBottomBarOldItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic n:Lv/bottombar/a;

.field public final synthetic o:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;Landroid/content/Context;Lv/bottombar/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;->o:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;->n:Lv/bottombar/a;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lv/bottombar/VBottomBarOldItem;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p3}, Lv/bottombar/VBottomBarDefaultItem;->setInfo(Lv/bottombar/a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lv/bottombar/VBottomBarOldItem;->j()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lv/bottombar/VBottomBarOldItem;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public d(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->i()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->d()V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;->o:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->k(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;->o:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->k(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget p2, Ll/c9c0;->I:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    :goto_1
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 57
    .line 58
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->f()V

    .line 59
    .line 60
    .line 61
    iget-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 62
    .line 63
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    sget v1, Ll/c9c0;->M:I

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget v1, Ll/c9c0;->E:I

    .line 86
    .line 87
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    :goto_2
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    invoke-virtual {p0, v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
