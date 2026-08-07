.class public Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Landroid/view/View;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->h:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->h:Z

    return-void
.end method

.method public static C(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->K(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->G(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->F(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->f:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final E()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->a:Lv/VLinear;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->h:Z

    .line 13
    .line 14
    invoke-static {}, Ll/zq00;->k()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic F(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Ll/vg60;

    .line 11
    .line 12
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 13
    .line 14
    check-cast p1, Ll/vg60;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->N(Lcom/p1/mobile/putong/data/User;Ljava/util/List;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic G(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Ll/vg60;

    .line 11
    .line 12
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 13
    .line 14
    check-cast p1, Ll/vg60;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->N(Lcom/p1/mobile/putong/data/User;Ljava/util/List;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/zq00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->Q(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->O(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/app/PutongFrag;Ll/jic0;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->E()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/zq00;->i()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p2, p1, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/oq00;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/oq00;-><init>(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/pq00;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/pq00;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/zq00;->j()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p2, p1, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/qq00;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/qq00;-><init>(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/rq00;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/rq00;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    new-instance p2, Ll/sq00;

    .line 60
    .line 61
    invoke-direct {p2, p0, p1}, Ll/sq00;-><init>(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    return-void
.end method

.method public final M(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x2

    .line 8
    if-le v0, v3, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->f:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->e:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    if-le v0, v1, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->e:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    if-lez v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 72
    .line 73
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/data/User;Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_4

    .line 8
    .line 9
    if-lez p3, :cond_4

    .line 10
    .line 11
    invoke-static {p1}, Ll/zq00;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->a:Lv/VLinear;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->c:Lv/VText;

    .line 25
    .line 26
    const/16 v2, 0x63

    .line 27
    .line 28
    if-le p3, v2, :cond_1

    .line 29
    .line 30
    const-string p3, "99+\u4eba\u559c\u6b22\u4e86\u4f60"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p3, "\u4eba\u559c\u6b22\u4e86\u4f60"

    .line 42
    .line 43
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    :goto_0
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->B()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/zq00;->f()Z

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    if-eqz p3, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->M(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->d:Lv/VDraweeView;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 76
    .line 77
    const-string p3, "female"

    .line 78
    .line 79
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    sget p1, Ll/lbc0;->l3:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    sget p1, Ll/lbc0;->k3:I

    .line 89
    .line 90
    :goto_1
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->a:Lv/VLinear;

    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const-string v0, "nearby"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Ll/orb0;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final P(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->C(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "feed_nearby_see_entry_item"

    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/orb0;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tq00;->a(Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
