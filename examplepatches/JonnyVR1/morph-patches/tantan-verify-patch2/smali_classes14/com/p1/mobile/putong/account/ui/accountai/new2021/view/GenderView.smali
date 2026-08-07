.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->V(Landroid/view/View;)V

    return-void
.end method

.method private T(Lcom/p1/mobile/putong/data/Gender;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const-string v1, "female"

    .line 15
    .line 16
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    sget v2, Ll/bbc0;->C1:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    const-string v1, "male"

    .line 35
    .line 36
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    sget v1, Ll/bbc0;->C1:I

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "male"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->T(Lcom/p1/mobile/putong/data/Gender;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->i:Ll/y20;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->i:Ll/y20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "female"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->T(Lcom/p1/mobile/putong/data/Gender;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->i:Ll/y20;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->i:Ll/y20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    sget v1, Ll/qa00;->q:I

    .line 6
    .line 7
    const/high16 v2, 0x42f00000    # 120.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0, v1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0, v1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    new-instance v2, Ll/plj;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/plj;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    new-instance v2, Ll/qlj;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/qlj;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->T(Lcom/p1/mobile/putong/data/Gender;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/gsj0;->f()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    sget v1, Ll/qa00;->y:I

    .line 68
    .line 69
    sget v2, Ll/qa00;->F:I

    .line 70
    .line 71
    invoke-virtual {p0, v1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method


# virtual methods
.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rlj;->b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->f:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setGenderSaveListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/GenderView;->i:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
