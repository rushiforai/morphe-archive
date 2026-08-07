.class public Ll/p9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z9i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/z9i<",
        "Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p9i;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 2
    .line 3
    const/high16 v0, 0x41c00000    # 24.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 13
    .line 14
    const/high16 v1, 0x41500000    # 13.0f

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {p2, v2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 37
    .line 38
    new-array v0, v1, [Landroid/view/View;

    .line 39
    .line 40
    aput-object p2, v0, v2

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/high16 p0, 0x40c00000    # 6.0f

    .line 47
    .line 48
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-static {p2, p0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 56
    .line 57
    const/high16 p2, 0x41000000    # 8.0f

    .line 58
    .line 59
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-static {p0, p2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 67
    .line 68
    new-array p2, v1, [Landroid/view/View;

    .line 69
    .line 70
    aput-object p0, p2, v2

    .line 71
    .line 72
    const/4 p0, -0x2

    .line 73
    invoke-static {p0, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method
