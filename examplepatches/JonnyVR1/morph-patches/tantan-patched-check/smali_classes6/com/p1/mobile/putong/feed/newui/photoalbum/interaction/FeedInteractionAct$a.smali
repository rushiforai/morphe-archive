.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;->e2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;->a2(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/emg;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 18
    .line 19
    sget v1, Ll/hdc0;->d2:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroid/widget/TextView;

    .line 26
    .line 27
    const-string v1, "#fe7e1d"

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;->Z1(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;)Ll/l4g0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0}, Ll/emg;->d()Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->getValue()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "interact_type"

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    filled-new-array {p1}, [Ll/tfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;->a2(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/emg;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 18
    .line 19
    sget v1, Ll/hdc0;->d2:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroid/widget/TextView;

    .line 26
    .line 27
    const-string v1, "#e6000000"

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;->Z1(Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;)Ll/l4g0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/l4g0;->g()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/emg;->j()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
