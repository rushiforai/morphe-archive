.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$d;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:I

.field public h:Landroid/os/CountDownTimer;

.field public i:Ll/x20;

.field public j:Lcom/p1/mobile/putong/core/data/CityCBanner;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final k:Landroidx/viewpager/widget/ViewPager$j;

.field public l:[Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->g:I

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$a;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->k:Landroidx/viewpager/widget/ViewPager$j;

    .line 13
    .line 14
    const-string p1, "24\u5c0f\u65f6\u5185\uff0c\u5168%s\u6240\u6709\u5973\u751f\u770b\u5230\u7684\u9996\u5361\u90fd\u662f\u4f60"

    .line 15
    .line 16
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpOWkNVM01MQldCV1hPUEVPTDNCQVZVVzIyQ1hSTjE0IiwidyI6ODg1LCJoIjo5MDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MDcwMzYxMTk0OTQ3Nzk2ODd9.png"

    .line 17
    .line 18
    const-string p3, "\u5360\u9886\u5168\u57ce\u9996\u5361"

    .line 19
    .line 20
    invoke-static {p3, p1, p2}, Ll/td8;->w0(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "\u9738\u5360\u5168\u57ce\u5973\u6027\u7684\u6d88\u606f\u9875\u9876\u90e8\uff0c\u72ec\u4eab\u5168\u57ce\u805a\u5149\u706f"

    .line 25
    .line 26
    const-string p3, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZMNzY3TlEyUkpTSFZZMkpSVjdSMzVEQjJWWDdBVDE0IiwidyI6ODg1LCJoIjo5MDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NTE1NDk0MTgwMjI4MDIwNn0.png"

    .line 27
    .line 28
    const-string v0, "\u7f6e\u9876\u4e13\u5c5e\u540d\u7247"

    .line 29
    .line 30
    invoke-static {v0, p2, p3}, Ll/td8;->w0(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    filled-new-array {p1, p2}, [Ll/bkj0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->l:[Ll/bkj0;

    .line 39
    .line 40
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->i:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->g:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->g:I

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->getCurrentIndex()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->setTitleAndSub(I)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->k()V

    return-void
.end method

.method private getCurrentIndex()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->g:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->l:[Ll/bkj0;

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    rem-int/2addr v0, p0

    .line 7
    return v0
.end method

.method private setTitleAndSub(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->l:[Ll/bkj0;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-lt p1, v1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    :cond_0
    aget-object v0, v0, p1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->d:Lv/VText;

    .line 10
    .line 11
    iget-object v2, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->j:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->cityName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->j:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->cityName:Ljava/lang/String;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string p1, "\u57ce\u5e02"

    .line 38
    .line 39
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->e:Lv/VText;

    .line 40
    .line 41
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Ljava/lang/String;

    .line 44
    .line 45
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->e:Lv/VText;

    .line 58
    .line 59
    iget-object p1, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast p1, Ljava/lang/CharSequence;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s55;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h:Landroid/os/CountDownTimer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/CountDownTimer;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$d;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->c:Lv/VPagerCircleIndicator;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->b:Landroidx/viewpager/widget/ViewPager;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->b:Landroidx/viewpager/widget/ViewPager;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->k:Landroidx/viewpager/widget/ViewPager$j;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/data/CityCBanner;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->i:Ll/x20;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->j:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->k()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->setTitleAndSub(I)V

    .line 10
    .line 11
    .line 12
    const-string p0, "p_city_cover_feature_show"

    .line 13
    .line 14
    new-array p1, p1, [Ll/sfj0$a;

    .line 15
    .line 16
    const-string p2, "e_city_cover_go_up"

    .line 17
    .line 18
    invoke-static {p2, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final k()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h:Landroid/os/CountDownTimer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;

    .line 9
    .line 10
    const-wide/16 v3, 0x1388

    .line 11
    .line 12
    const-wide/16 v5, 0x1388

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;JJ)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v2, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h:Landroid/os/CountDownTimer;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->d:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->f:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->i()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->f:Lv/VText;

    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
