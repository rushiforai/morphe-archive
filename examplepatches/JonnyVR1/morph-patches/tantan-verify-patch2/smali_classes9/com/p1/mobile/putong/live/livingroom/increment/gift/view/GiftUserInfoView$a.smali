.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/coj;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Landroid/widget/PopupWindow;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/lang/String;

.field public final f:Ll/djs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/djs<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/PopupWindow;Ljava/lang/String;Ll/djs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/PopupWindow;",
            "Ljava/lang/String;",
            "Ll/djs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->c:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->f:Ll/djs;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;Ll/coj;Ll/cqj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->I(Ll/coj;Ll/cqj;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/coj;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/coj;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->G(Landroid/view/View;Ll/coj;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p2, Ll/yec0;->G1:I

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public G(Landroid/view/View;Ll/coj;II)V
    .locals 3

    .line 1
    sget p3, Ll/mdc0;->x2:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 8
    .line 9
    sget p4, Ll/mdc0;->e4:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Landroid/widget/TextView;

    .line 16
    .line 17
    invoke-static {p2}, Ll/cpj;->C(Ll/coj;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    iget-object v0, p2, Ll/coj;->e:Ll/h64;

    .line 29
    .line 30
    iget-object v0, v0, Ll/h64;->a:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p2, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    iget-boolean v2, p2, Ll/coj;->a:Z

    .line 35
    .line 36
    invoke-virtual {p4, v0, v1, v2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    sget v0, Ll/qa00;->v:I

    .line 41
    .line 42
    new-instance v1, Ll/g0k;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/g0k;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-static {p3, v0, p4, v2, v1}, Ll/biv;->d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;)V

    .line 49
    .line 50
    .line 51
    new-instance p3, Ll/cqj$a;

    .line 52
    .line 53
    invoke-direct {p3}, Ll/cqj$a;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->e:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p3, p2, p4}, Ll/cqj$a;->e(Ll/coj;Ljava/lang/String;)Ll/cqj$a;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3}, Ll/cqj$a;->d()Ll/cqj;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    new-instance p4, Ll/h0k;

    .line 67
    .line 68
    invoke-direct {p4, p0, p2, p3}, Ll/h0k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;Ll/coj;Ll/cqj;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public H(I)Ll/coj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/coj;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(Ll/coj;Ll/cqj;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ll/lx50;

    .line 7
    .line 8
    invoke-direct {p3}, Ll/lx50;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0x2bc

    .line 12
    .line 13
    invoke-virtual {p3, v0}, Ll/lx50;->i(I)Ll/lx50;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iget-object p1, p1, Ll/coj;->g:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p2}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->f:Ll/djs;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/djs;->W3(Ll/lx50;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->H(I)Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
