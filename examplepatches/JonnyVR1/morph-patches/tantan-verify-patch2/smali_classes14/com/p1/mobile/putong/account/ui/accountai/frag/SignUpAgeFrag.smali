.class public Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;
.super Lcom/p1/mobile/android/app/Frag;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

.field public C:Lcom/p1/mobile/putong/data/SignUpData;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Frag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B4()Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/wcc0;->O:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->z:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/wcc0;->b0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->A:Lv/VText;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v1, 0x12

    .line 31
    .line 32
    :goto_0
    const/16 v2, 0x64

    .line 33
    .line 34
    if-ge v1, v2, :cond_0

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 47
    .line 48
    new-instance v2, Ll/s01;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Ll/s01;-><init>(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setAdapter(Ll/s01;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 57
    .line 58
    const/4 v1, 0x4

    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setSelectedPosition(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 63
    .line 64
    new-instance v1, Ll/tdf0;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/tdf0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setOnItemSelectedListener(Ll/pm50;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->C:Lcom/p1/mobile/putong/data/SignUpData;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->D4()V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/ui/datepicker/WheelView;Ll/s01;I)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A4()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->B:Lcom/p1/mobile/putong/ui/datepicker/WheelView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->getSelectedItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public C4(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->C:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->A:Lv/VText;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->D4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final D4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->C:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    const-string v1, "female"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->C:Lcom/p1/mobile/putong/data/SignUpData;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 18
    .line 19
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    const-string v2, "https://auto.tancdn.com/v1/raw/f4973703-3fdb-40f1-b31c-2dfc7c47fc5614.svga"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v2, "https://auto.tancdn.com/v1/raw/cd16e9f0-10d8-420e-8ac9-5ca497c7714c14.svga"

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->downloadOnly()V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->A:Lv/VText;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->C:Lcom/p1/mobile/putong/data/SignUpData;

    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 44
    .line 45
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const-string p0, "\u4f60\u597d\uff0c\u5973\u58eb"

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const-string p0, "\u4f60\u597d\uff0c\u5148\u751f"

    .line 55
    .line 56
    :goto_1
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/hec0;->T:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->z:Landroid/view/View;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->r()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpAgeFrag;->z:Landroid/view/View;

    .line 18
    .line 19
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
