.class public Ll/jxg;
.super Ll/e7;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/t4i;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7;-><init>(Ll/t4i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/jxg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxg;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t4i;->f(I)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;->u(Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p3, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ixg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ixg;-><init>(Ll/jxg;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/lbc0;->I3:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public d(Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7;->a:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t4i;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
