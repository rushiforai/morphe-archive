.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->g1(JLv/VDraweeView;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;Lv/VDraweeView;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->b:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->a:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    int-to-float p3, p3

    .line 22
    int-to-float p2, p2

    .line 23
    int-to-float p1, p1

    .line 24
    div-float/2addr p2, p1

    .line 25
    mul-float/2addr p3, p2

    .line 26
    float-to-int p1, p3

    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->a:Lv/VDraweeView;

    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    new-array p3, p3, [Landroid/view/View;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    aput-object p2, p3, v0

    .line 34
    .line 35
    invoke-static {p1, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 39
    .line 40
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->B0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView$a;->b:Ll/x20;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-interface {p0}, Ll/x20;->call()V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method
