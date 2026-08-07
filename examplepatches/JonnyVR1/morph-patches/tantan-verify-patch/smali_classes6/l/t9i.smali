.class public Ll/t9i;
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
    invoke-virtual {p0, p1, p2}, Ll/t9i;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 2
    .line 3
    const/high16 v0, 0x41700000    # 15.0f

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
    invoke-static {p2}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-static {p0, p2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    new-array v1, v1, [Landroid/view/View;

    .line 32
    .line 33
    aput-object v0, v1, p2

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 40
    .line 41
    const/high16 p2, 0x41100000    # 9.0f

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 47
    .line 48
    const/high16 p2, 0x40000000    # 2.0f

    .line 49
    .line 50
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    invoke-static {p0, p2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 58
    .line 59
    const/high16 p2, 0x40a00000    # 5.0f

    .line 60
    .line 61
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    invoke-static {p0, p2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 69
    .line 70
    const/high16 p2, 0x3f000000    # 0.5f

    .line 71
    .line 72
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-static {p0, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 80
    .line 81
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 82
    .line 83
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
