.class public Ll/k6p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/m6p0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/m6p0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/m6p0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public b:Lv/VText;

.field public c:I


# direct methods
.method public constructor <init>(Lv/VText;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/k6p0;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/k6p0;->b:Lv/VText;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/k6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k6p0;->d(Landroid/view/View;)V

    return-void
.end method

.method private synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/k6p0;->b:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v0, p0, Ll/k6p0;->a:Ll/m6p0;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/m6p0;->p4()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v0}, Ll/m6p0;->o4()V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Ll/k6p0;->a:Ll/m6p0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k6p0;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/m6p0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/m6p0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/k6p0;->a:Ll/m6p0;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k6p0;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/j6p0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/j6p0;-><init>(Ll/k6p0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, -0x1

    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    iput p2, p0, Ll/k6p0;->c:I

    .line 8
    .line 9
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    const-string v0, "matched"

    .line 12
    .line 13
    const-string v1, "#ffffff"

    .line 14
    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 26
    .line 27
    sget p2, Ll/obc0;->c1:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 31
    .line 32
    if-eqz p2, :cond_3

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 35
    .line 36
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 43
    .line 44
    sget p2, Ll/obc0;->c1:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 48
    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 52
    .line 53
    const-string p2, "following"

    .line 54
    .line 55
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o:I

    .line 62
    .line 63
    sget p2, Ll/obc0;->c1:I

    .line 64
    .line 65
    const-string v1, "#33ffffff"

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->p:I

    .line 69
    .line 70
    sget p2, Ll/obc0;->C0:I

    .line 71
    .line 72
    :goto_0
    iget-object v0, p0, Ll/k6p0;->b:Lv/VText;

    .line 73
    .line 74
    invoke-static {p2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    iget p2, p0, Ll/k6p0;->c:I

    .line 82
    .line 83
    iget-object v0, p0, Ll/k6p0;->b:Lv/VText;

    .line 84
    .line 85
    const/4 v2, 0x3

    .line 86
    if-le p2, v2, :cond_5

    .line 87
    .line 88
    const/4 p0, 0x0

    .line 89
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_5
    const/4 p2, 0x1

    .line 94
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Ll/k6p0;->b:Lv/VText;

    .line 98
    .line 99
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/k6p0;->b:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/m6p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k6p0;->b(Ll/m6p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
