.class public Ll/fqr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Ll/x0m;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fqr;->a:Ll/x0m;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/nec0;->w:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewManager;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    check-cast p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 16
    .line 17
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    iget-object p4, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 38
    .line 39
    instance-of v0, p4, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    check-cast p4, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 44
    .line 45
    iget-object p4, p4, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->contentType:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "literatureCardGuide"

    .line 48
    .line 49
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-eqz p4, :cond_0

    .line 54
    .line 55
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 58
    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/ui/MKWebViewManager;

    .line 60
    .line 61
    sget-object p4, Lcom/p1/mobile/putong/core/api/p;->Y:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v0, p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 64
    .line 65
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {p4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    const-string v0, ""

    .line 74
    .line 75
    invoke-virtual {p1, p4, v0}, Lcom/p1/mobile/putong/core/ui/MKWebViewManager;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    if-nez p2, :cond_0

    .line 79
    .line 80
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p2, p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 89
    .line 90
    const/4 p4, 0x0

    .line 91
    invoke-virtual {p1, p2, p4, p4}, Ll/rj50;->Z(Ljava/lang/String;IZ)Z

    .line 92
    .line 93
    .line 94
    invoke-static {p3}, Ll/fb0;->k(Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/fqr;->a:Ll/x0m;

    .line 98
    .line 99
    invoke-interface {p0}, Ll/x0m;->O3()V

    .line 100
    .line 101
    .line 102
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method
