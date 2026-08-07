.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;Ll/nif;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->H(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic H(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;->j5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->F(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;->h5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    new-instance p1, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "#e6000000"

    .line 13
    .line 14
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    const/high16 p0, 0x41800000    # 16.0f

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    const/16 p0, 0x10

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 32
    .line 33
    const/high16 p2, 0x42600000    # 56.0f

    .line 34
    .line 35
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    const/4 v0, -0x1

    .line 40
    invoke-direct {p0, v0, p2}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 41
    .line 42
    .line 43
    const/high16 p2, 0x41a00000    # 20.0f

    .line 44
    .line 45
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method

.method public F(Landroid/view/View;Ljava/lang/String;II)V
    .locals 0

    .line 1
    move-object p2, p1

    .line 2
    check-cast p2, Landroid/widget/TextView;

    .line 3
    .line 4
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->G(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Ll/mif;

    .line 12
    .line 13
    invoke-direct {p2, p0, p4}, Ll/mif;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public G(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;->h5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag$d;->G(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method
