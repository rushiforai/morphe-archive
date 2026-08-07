.class public Ll/s9i;
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
    invoke-virtual {p0, p1, p2}, Ll/s9i;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 9
    .line 10
    const/high16 v0, 0x41600000    # 14.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-static {p0, p2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    new-array v1, v1, [Landroid/view/View;

    .line 39
    .line 40
    aput-object v0, v1, p2

    .line 41
    .line 42
    invoke-static {p0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 47
    .line 48
    const/high16 p2, 0x41100000    # 9.0f

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 54
    .line 55
    const/high16 p2, 0x40000000    # 2.0f

    .line 56
    .line 57
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    invoke-static {p0, p2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 65
    .line 66
    const/high16 p2, 0x40a00000    # 5.0f

    .line 67
    .line 68
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-static {p0, p2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 76
    .line 77
    const/high16 p2, 0x3f000000    # 0.5f

    .line 78
    .line 79
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-static {p0, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 87
    .line 88
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 89
    .line 90
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
