.class public Ll/wvp0;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wvp0$a;
    }
.end annotation


# static fields
.field public static final c:I


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->Z6:I

    .line 2
    .line 3
    sput v0, Ll/wvp0;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->o2:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Ll/wvp0;->a:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/adc0;->je:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lv/VText;

    .line 21
    .line 22
    iput-object p1, p0, Ll/wvp0;->b:Lv/VText;

    .line 23
    .line 24
    const/4 p0, 0x3

    .line 25
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-nez p2, :cond_0

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/String;

    .line 57
    .line 58
    iget-object p2, p0, Ll/wvp0;->a:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 64
    .line 65
    const/4 p1, 0x1

    .line 66
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 71
    .line 72
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
