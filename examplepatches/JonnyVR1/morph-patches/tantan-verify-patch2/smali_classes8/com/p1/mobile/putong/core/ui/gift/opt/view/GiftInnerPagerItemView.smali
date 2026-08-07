.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VMarqueeText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public j:Ll/bwj;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->l:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic B(Ll/x20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->W(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M(Ll/bwj;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->X(Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/bwj;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p2, Ll/ptj;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/ptj;-><init>(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/qtj;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/qtj;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->c0()V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->Y()V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rtj;->a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final R()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->l:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->text:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 v0, 0x0

    .line 64
    :goto_0
    if-eqz v0, :cond_1

    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ll/lu8;->Q3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 85
    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->T(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_1
    return v0
.end method

.method public final S(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->isSVipGift(Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->privilegeName:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public final T(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->j:Ll/bwj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bwj;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->isGreetGift(Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/lu8;->S3()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public final V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->isVipGift(Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->privilegeName:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public final synthetic W(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ll/qvj;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    const-string v0, "from_meet_picks"

    .line 10
    .line 11
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "from_meet_liked"

    .line 18
    .line 19
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    if-nez p4, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-virtual {p4}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    const-string v0, "note"

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-ne p4, v0, :cond_0

    .line 40
    .line 41
    const-string p4, "p_meet"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    invoke-virtual {p4}, Ll/qvj;->L()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v1, "chat_gift_id"

    .line 57
    .line 58
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    filled-new-array {v0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "e_chat_gift_bar_gift_send"

    .line 67
    .line 68
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 74
    .line 75
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p4, v0}, Ll/lu8;->Q3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 78
    .line 79
    .line 80
    move-result-object p4

    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 96
    .line 97
    const-string v1, "o_diamond_gift_id"

    .line 98
    .line 99
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/qvj;->L()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string p2, "e_unlimit_sayhi_diamond"

    .line 114
    .line 115
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    new-instance v3, Ll/ktj;

    .line 131
    .line 132
    invoke-direct {v3, p1}, Ll/ktj;-><init>(Ll/bwj;)V

    .line 133
    .line 134
    .line 135
    const/4 v5, 0x0

    .line 136
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondGreetings:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 137
    .line 138
    const-string v2, "p_chat,gift_odiamond"

    .line 139
    .line 140
    const/4 v4, 0x0

    .line 141
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_2
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    iget-boolean v0, p4, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 152
    .line 153
    if-eqz v0, :cond_3

    .line 154
    .line 155
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->T(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_3

    .line 160
    .line 161
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 162
    .line 163
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 164
    .line 165
    invoke-virtual {p2}, Ll/lu8;->l4()V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 181
    .line 182
    new-instance v5, Ll/ltj;

    .line 183
    .line 184
    invoke-direct {v5, p0}, Ll/ltj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;)V

    .line 185
    .line 186
    .line 187
    const-string v2, "p_chat,gift_send"

    .line 188
    .line 189
    const/4 v4, 0x0

    .line 190
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_3
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    const-string v1, "\u8be5\u793c\u7269\u672c\u6708\u5df2\u7528\u5b8c"

    .line 199
    .line 200
    if-eqz v0, :cond_6

    .line 201
    .line 202
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fd()Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_4

    .line 215
    .line 216
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_6

    .line 221
    .line 222
    iget v0, p4, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->remaining:I

    .line 223
    .line 224
    if-gtz v0, :cond_6

    .line 225
    .line 226
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fd()Z

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    if-nez p2, :cond_5

    .line 239
    .line 240
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    new-instance v3, Ll/mtj;

    .line 253
    .line 254
    invoke-direct {v3, p0}, Ll/mtj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;)V

    .line 255
    .line 256
    .line 257
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 258
    .line 259
    const/4 v5, 0x0

    .line 260
    const/4 v6, 0x0

    .line 261
    const-string v2, "p_chat,gift_send"

    .line 262
    .line 263
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Eq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;ZLcom/p1/mobile/putong/data/User;)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_5
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_6
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->S(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    if-eqz p0, :cond_9

    .line 276
    .line 277
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    if-eqz p0, :cond_7

    .line 290
    .line 291
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-eqz p0, :cond_9

    .line 296
    .line 297
    iget p0, p4, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->remaining:I

    .line 298
    .line 299
    if-gtz p0, :cond_9

    .line 300
    .line 301
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    if-nez p0, :cond_8

    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->svip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 328
    .line 329
    new-instance v4, Ll/ntj;

    .line 330
    .line 331
    invoke-direct {v4, p1, p3}, Ll/ntj;-><init>(Ll/bwj;Ll/x20;)V

    .line 332
    .line 333
    .line 334
    new-instance v5, Ll/otj;

    .line 335
    .line 336
    invoke-direct {v5}, Ll/otj;-><init>()V

    .line 337
    .line 338
    .line 339
    const-string v2, "p_chat,gift_send"

    .line 340
    .line 341
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 342
    .line 343
    .line 344
    return-void

    .line 345
    :cond_8
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :cond_9
    iget p0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 350
    .line 351
    if-nez p0, :cond_a

    .line 352
    .line 353
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 354
    .line 355
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->noQuotaToast:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {p0, p1}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 370
    .line 371
    .line 372
    return-void

    .line 373
    :cond_a
    invoke-virtual {p1, p2}, Ll/bwj;->v(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 374
    .line 375
    .line 376
    return-void
.end method

.method public final synthetic Y()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public Z(Ll/lxj;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZZLl/x20;)V
    .locals 2

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->j:Ll/bwj;

    .line 4
    .line 5
    iput-boolean p5, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->l:Z

    .line 6
    .line 7
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "o_diamond_gift_id"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 20
    .line 21
    sget v0, Ll/ibc0;->M5:I

    .line 22
    .line 23
    invoke-virtual {p1, p5, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-nez p5, :cond_1

    .line 28
    .line 29
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 46
    .line 47
    sget v1, Ll/qa00;->x:I

    .line 48
    .line 49
    invoke-virtual {p1, p5, v0, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 54
    .line 55
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 58
    .line 59
    sget v1, Ll/qa00;->x:I

    .line 60
    .line 61
    invoke-virtual {p1, p5, v0, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->b0()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->c0()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->g0()V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->g:Lv/VText;

    .line 74
    .line 75
    new-instance p5, Ll/jtj;

    .line 76
    .line 77
    invoke-direct {p5, p0, p2, p3, p6}, Ll/jtj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, p5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, p3}, Ll/bwj;->h(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 84
    .line 85
    .line 86
    iget p1, p3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 89
    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget p3, Ll/g9c0;->m:I

    .line 97
    .line 98
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    sget p3, Ll/g9c0;->s:I

    .line 112
    .line 113
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 121
    .line 122
    const/high16 p2, 0x3f000000    # 0.5f

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    sget p3, Ll/g9c0;->f:I

    .line 133
    .line 134
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    sget p3, Ll/g9c0;->m:I

    .line 148
    .line 149
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 157
    .line 158
    const/high16 p2, 0x3f800000    # 1.0f

    .line 159
    .line 160
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 161
    .line 162
    .line 163
    :goto_1
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->setSelected(Z)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "o_diamond_gift_id"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->g:Lv/VText;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "\u89e3\u9501"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v0, "\u8d60\u9001"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 33
    .line 34
    sget v1, Ll/qa00;->h:I

    .line 35
    .line 36
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 37
    .line 38
    sget v1, Ll/qa00;->x:I

    .line 39
    .line 40
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 41
    .line 42
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->g:Lv/VText;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final b0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/lu8;->Q3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fd()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->S(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->privilegeName:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->Q(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->nameColor:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->nameColor:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .line 130
    .line 131
    :cond_3
    return-void

    .line 132
    :catch_0
    move-exception p0

    .line 133
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 134
    .line 135
    const/16 v1, 0xa

    .line 136
    .line 137
    const-string v2, "b_core_gift"

    .line 138
    .line 139
    invoke-static {p0, v2, v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->f(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final c0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->R()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-le v0, v2, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 48
    .line 49
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 55
    .line 56
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 59
    .line 60
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 75
    .line 76
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 79
    .line 80
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 81
    .line 82
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    filled-new-array {v3, v4}, [I

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 113
    .line 114
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 117
    .line 118
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 119
    .line 120
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->text:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 128
    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 130
    .line 131
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v3}, Ll/lu8;->Q3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-eqz v3, :cond_1

    .line 142
    .line 143
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 144
    .line 145
    if-eqz v3, :cond_1

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->T(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_1

    .line 152
    .line 153
    const-string v0, "e_chat_gift_bar_special_label"

    .line 154
    .line 155
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->j:Ll/bwj;

    .line 156
    .line 157
    invoke-virtual {v3}, Ll/bwj;->t()Ll/qvj;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Ll/qvj;->L()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 169
    .line 170
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :catchall_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 175
    .line 176
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->h:Lv/VText;

    .line 181
    .line 182
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x41300000    # 11.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 16
    .line 17
    sget v1, Ll/qa00;->F:I

    .line 18
    .line 19
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 20
    .line 21
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e:Lv/VText;

    .line 24
    .line 25
    sget v1, Ll/qa00;->d:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->g:Lv/VText;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final g0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/lu8;->Q3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ll/r97;->f()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "o_diamond_gift_id"

    .line 32
    .line 33
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->j:Ll/bwj;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/bwj;->t()Ll/qvj;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/qvj;->L()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "e_unlimit_sayhi_diamond"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 55
    .line 56
    const-string v0, "\u65e0\u9700\u9001\u793c\u968f\u65f6\u6253\u62db\u547c"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->S(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 76
    .line 77
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 78
    .line 79
    double-to-int v0, v0

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 81
    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    const-string p0, "\u514d\u8d39"

    .line 85
    .line 86
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 95
    .line 96
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 97
    .line 98
    double-to-int p0, v2

    .line 99
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v2, "%d \u63a2\u63a2\u5e01"

    .line 108
    .line 109
    invoke-static {v0, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_3
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_4

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_4

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 138
    .line 139
    const-string v0, "SVIP\u5c0a\u4eab"

    .line 140
    .line 141
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_5

    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fd()Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-nez v1, :cond_6

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-nez v1, :cond_6

    .line 178
    .line 179
    :cond_5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->S(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_7

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_7

    .line 198
    .line 199
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 204
    .line 205
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->privilegeName:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->f:Lv/VMarqueeText;

    .line 216
    .line 217
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 218
    .line 219
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->V(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_8

    .line 228
    .line 229
    const-string p0, "tttVip"

    .line 230
    .line 231
    goto :goto_1

    .line 232
    :cond_8
    const-string p0, "svip"

    .line 233
    .line 234
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-interface {v2, p0}, Ll/r97;->b1(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    .line 244
    .line 245
    return-void
.end method

.method public isChecked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Lv/VRelative;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->setSelected(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSelected(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->a0()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->e0()V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "o_diamond_gift_id"

    .line 20
    .line 21
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    new-instance p1, Ll/itj;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ll/itj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public toggle()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->k:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->j:Ll/bwj;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ll/bwj;->u(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {v1}, Ll/bwj;->x()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
