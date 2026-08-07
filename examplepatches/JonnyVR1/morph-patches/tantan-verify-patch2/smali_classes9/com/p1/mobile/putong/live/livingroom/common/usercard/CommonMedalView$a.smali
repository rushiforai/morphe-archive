.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->j0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-float p1, p1

    .line 9
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    int-to-float p2, p2

    .line 14
    div-float/2addr p1, p2

    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    int-to-float p2, p2

    .line 22
    mul-float/2addr p2, p1

    .line 23
    float-to-int p2, p2

    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 25
    .line 26
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)Lv/VDraweeView;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const/4 v0, 0x1

    .line 31
    new-array v1, v0, [Landroid/view/View;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    aput-object p3, v1, v2

    .line 35
    .line 36
    invoke-static {p2, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    int-to-float p2, p2

    .line 46
    mul-float/2addr p2, p1

    .line 47
    float-to-int p1, p2

    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 49
    .line 50
    new-array p3, v0, [Landroid/view/View;

    .line 51
    .line 52
    aput-object p2, p3, v2

    .line 53
    .line 54
    invoke-static {p1, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)Lv/VDraweeView;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
