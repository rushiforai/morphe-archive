.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/core/data/NewTags;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->c:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/putong/core/data/NewTags;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic s(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->z(Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/putong/core/data/NewTags;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final A(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->e(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget p2, Ll/ibc0;->P4:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p2, Ll/ibc0;->O4:I

    .line 13
    .line 14
    :goto_0
    invoke-static {p0, p1, p2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->c:Ljava/util/List;

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

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/NewTags;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->c:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/NewTags;II)V
    .locals 2

    .line 1
    sget p3, Ll/edc0;->A5:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lv/VDraweeView;

    .line 8
    .line 9
    sget p4, Ll/edc0;->w3:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Lv/VText;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/v1q;

    .line 24
    .line 25
    invoke-direct {v1, p2}, Ll/v1q;-><init>(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->A(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/w1q;

    .line 36
    .line 37
    invoke-direct {v0, p0, p2, p1}, Ll/w1q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_0

    .line 50
    .line 51
    new-instance p0, Ll/x1q;

    .line 52
    .line 53
    invoke-direct {p0, p3, p2}, Ll/x1q;-><init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    new-instance v0, Ll/y1q;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/y1q;-><init>(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x1

    .line 20
    const/4 v3, 0x3

    .line 21
    if-nez p3, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-ge p3, v3, :cond_1

    .line 32
    .line 33
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 34
    .line 35
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->A(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-interface {p3, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->A(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 57
    .line 58
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->f:Lv/VButton;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-lt p1, v3, :cond_2

    .line 69
    .line 70
    move v1, v2

    .line 71
    :cond_2
    invoke-virtual {p2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->f:Lv/VButton;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->g(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p2, "\u53d1\u9001\uff08%s/3)"

    .line 95
    .line 96
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
