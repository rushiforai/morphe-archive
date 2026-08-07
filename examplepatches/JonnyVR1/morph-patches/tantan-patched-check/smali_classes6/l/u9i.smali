.class public Ll/u9i;
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
    invoke-virtual {p0, p1, p2}, Ll/u9i;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Lcom/p1/mobile/putong/data/User;)V

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
    const/high16 v0, 0x41a00000    # 20.0f

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
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-static {p2, p0}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    new-array v1, v1, [Landroid/view/View;

    .line 32
    .line 33
    aput-object v0, v1, p0

    .line 34
    .line 35
    invoke-static {p2, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/high16 p0, 0x40a00000    # 5.0f

    .line 40
    .line 41
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p2, p0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 49
    .line 50
    const/high16 p2, 0x40c00000    # 6.0f

    .line 51
    .line 52
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-static {p0, p2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 60
    .line 61
    const/high16 p1, 0x40800000    # 4.0f

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
