.class public Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/sum;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p3, "e_app_specialguest"

    .line 2
    .line 3
    invoke-static {p3, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/ud2;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    instance-of p0, p2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    check-cast p2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V
    .locals 5

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->a:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    const/16 v4, 0xa

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->a:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v2, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->b:Lv/VText;

    .line 28
    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 35
    .line 36
    const-string v1, "p_suggest_users_home_view"

    .line 37
    .line 38
    if-ne p3, v0, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 42
    .line 43
    if-ne p3, v0, :cond_2

    .line 44
    .line 45
    const-string v1, "p_messages_view"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 49
    .line 50
    if-ne p3, v0, :cond_3

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-interface {p3, p4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->oh(Landroidx/fragment/app/Fragment;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    sget-object p4, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 62
    .line 63
    if-ne p3, p4, :cond_4

    .line 64
    .line 65
    const-string v1, "p_navigation_view"

    .line 66
    .line 67
    :cond_4
    :goto_1
    const-string p3, "e_app_specialguest"

    .line 68
    .line 69
    invoke-static {p3, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance p3, Ll/urb;

    .line 73
    .line 74
    invoke-direct {p3, v1, p2, p1}, Ll/urb;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/Act;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vrb;->a(Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->c:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
