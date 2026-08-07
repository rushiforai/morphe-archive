.class public Ll/qhh$c;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qhh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/ViewersBox;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:I

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/ViewersBox;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final synthetic g:Ll/qhh;


# direct methods
.method public constructor <init>(Ll/qhh;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    iput p1, p0, Ll/qhh$c;->c:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Ll/qhh$c;->d:I

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/qhh$c;->e:Ljava/util/List;

    .line 18
    .line 19
    iput-object p2, p0, Ll/qhh$c;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic E(Ll/qhh$c;Lcom/p1/mobile/putong/feed/data/ViewersBox;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qhh$c;->J(Lcom/p1/mobile/putong/feed/data/ViewersBox;Landroid/view/View;)V

    return-void
.end method

.method private H(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qhh$c;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/ViewersBox;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qhh;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 14
    .line 15
    iget-object p0, p0, Ll/qhh;->i:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qhh$c;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    if-ne p2, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/tec0;->v1:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p2, Ll/tec0;->w1:I

    .line 23
    .line 24
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/ViewersBox;II)V
    .locals 11

    .line 1
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p3, v2, :cond_1

    .line 2
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lv/VText;

    .line 3
    iget-object p3, p0, Ll/qhh$c;->g:Ll/qhh;

    invoke-static {p3}, Ll/qhh;->F(Ll/qhh;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 4
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    invoke-static {p0}, Ll/qhh;->F(Ll/qhh;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    const/16 p0, 0x8

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1
    const/4 p3, 0x0

    if-nez p4, :cond_2

    const/high16 v3, 0x40800000    # 4.0f

    .line 6
    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    goto :goto_0

    :cond_2
    move v3, p3

    :goto_0
    invoke-static {p1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 7
    iget-object v3, p0, Ll/qhh$c;->g:Ll/qhh;

    invoke-static {v3}, Ll/qhh;->E(Ll/qhh;)Ll/h80;

    move-result-object v3

    invoke-virtual {v3, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 8
    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Lv/VDraweeView;

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VLinear;

    .line 10
    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lv/VText;

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VText;

    .line 12
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    iget-object v5, p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    .line 13
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 14
    iget-object v5, p0, Ll/qhh$c;->g:Ll/qhh;

    invoke-static {v5}, Ll/qhh;->G(Ll/qhh;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 15
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v5, p4, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    goto :goto_1

    .line 16
    :cond_3
    invoke-virtual {p0}, Ll/qhh$c;->I()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 17
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x14

    invoke-virtual {v5, p4, v6, v1, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    goto :goto_1

    .line 18
    :cond_4
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v5, p4, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 19
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object p4

    invoke-interface {p4, v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ia(Lcom/p1/mobile/putong/data/User;)Z

    move-result p4

    goto :goto_2

    :cond_5
    move p4, p3

    .line 20
    :goto_2
    iget v5, p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->viewCount:I

    const/4 v6, 0x3

    if-lt v5, v6, :cond_6

    .line 21
    const-string v5, "\u5fcd\u4e0d\u4f4f\u770b\u4e86\u4f60\u7684\u52a8\u6001"

    goto :goto_3

    .line 22
    :cond_6
    const-string v5, "\u770b\u4e86\u4f60\u7684\u52a8\u6001"

    .line 23
    :goto_3
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 24
    invoke-direct {p0, v4}, Ll/qhh$c;->H(Lcom/p1/mobile/putong/data/User;)Z

    move-result v7

    if-eqz v7, :cond_7

    const-string v7, "\u5979"

    goto :goto_4

    :cond_7
    const-string v7, "\u4ed6"

    :goto_4
    invoke-virtual {v6, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 25
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 26
    const-string v7, "#CC000000"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-direct {v5, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 27
    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    sub-int/2addr v8, v1

    const/16 v9, 0x11

    .line 28
    invoke-virtual {v6, v5, p3, v8, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 29
    new-instance v5, Landroid/text/SpannableStringBuilder;

    iget v8, p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->viewCount:I

    .line 30
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 31
    new-instance v8, Landroid/text/style/ForegroundColorSpan;

    const-string v10, "#FE7E1D"

    .line 32
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    invoke-direct {v8, v10}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 33
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    .line 34
    invoke-virtual {v5, v8, p3, v10, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 35
    new-instance v8, Landroid/text/SpannableStringBuilder;

    const-string v10, "\u6b21"

    invoke-direct {v8, v10}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 36
    new-instance v10, Landroid/text/style/ForegroundColorSpan;

    .line 37
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-direct {v10, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 38
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    sub-int/2addr v7, v1

    .line 39
    invoke-virtual {v8, v10, p3, v7, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 40
    iget p3, p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->viewCount:I

    if-lt p3, v2, :cond_8

    .line 41
    const-string p3, " "

    invoke-virtual {v6, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    .line 42
    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    .line 43
    invoke-virtual {v2, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p3

    .line 44
    invoke-virtual {p3, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p3

    .line 45
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 46
    :cond_8
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    :goto_5
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p3

    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 48
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p4, :cond_9

    .line 49
    const-string p4, "\u5f53\u524d\u5728\u7ebf \u00b7 "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 50
    :cond_9
    invoke-static {v4}, Ll/ksg;->B0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    move-result-object p4

    .line 51
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 52
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " \u00b7 "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_a
    :goto_6
    iget-wide v1, p2, Lcom/p1/mobile/putong/feed/data/ViewersBox;->lastViewTime:D

    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    new-instance p3, Ll/rhh;

    invoke-direct {p3, p0, p2}, Ll/rhh;-><init>(Ll/qhh$c;Lcom/p1/mobile/putong/feed/data/ViewersBox;)V

    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/feed/data/ViewersBox;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qhh;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 14
    .line 15
    iget-object p0, p0, Ll/qhh;->i:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 22
    .line 23
    return-object p0
.end method

.method public final I()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ksg;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ikh;->i()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Ll/ikh;->j()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/feed/data/ViewersBox;Landroid/view/View;)V
    .locals 7

    .line 1
    new-instance p2, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "moments_user_id"

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p2, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {p2}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "e_detail_visitor"

    .line 15
    .line 16
    const-string v1, "p_moment_visitor_popup"

    .line 17
    .line 18
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 22
    .line 23
    invoke-static {p2}, Ll/qhh;->G(Ll/qhh;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 30
    .line 31
    iget-object v0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 32
    .line 33
    iget-object v0, v0, Ll/qhh;->h:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object p0, p0, Ll/qhh$c;->f:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "photo_album_feed_viewers"

    .line 44
    .line 45
    invoke-static {p0, p2, p1, v0}, Ll/at0;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Ll/qhh$c;->f:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    const/4 v5, 0x0

    .line 56
    const/4 v6, 0x0

    .line 57
    const-string v3, "p_navigation,moment_visitor"

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qhh;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 12
    .line 13
    iget-object v0, v0, Ll/qhh;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int/2addr v0, p1

    .line 20
    const/4 p1, 0x6

    .line 21
    if-ge v0, p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 24
    .line 25
    invoke-static {p1}, Ll/qhh;->J(Ll/qhh;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 36
    .line 37
    invoke-static {p1}, Ll/qhh;->H(Ll/qhh;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 44
    .line 45
    invoke-static {p1}, Ll/qhh;->G(Ll/qhh;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 52
    .line 53
    invoke-static {p0}, Ll/qhh;->K(Ll/qhh;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qhh$c;->G(I)Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qhh;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lt p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 5
    .line 6
    invoke-static {p0}, Ll/qhh;->E(Ll/qhh;)Ll/h80;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qhh$c;->g:Ll/qhh;

    .line 5
    .line 6
    invoke-static {p0}, Ll/qhh;->E(Ll/qhh;)Ll/h80;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
