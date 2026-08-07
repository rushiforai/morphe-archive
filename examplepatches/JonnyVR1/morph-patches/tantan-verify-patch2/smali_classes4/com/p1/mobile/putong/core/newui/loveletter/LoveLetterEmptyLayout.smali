.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEmptyLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/few;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "cards"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public b(Ll/few;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/bnl0;->F0()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    const/high16 v1, 0x43f00000    # 480.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    sub-int/2addr v0, v1

    .line 17
    const/high16 v1, 0x41f00000    # 30.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    sget v1, Ll/adc0;->A3:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lv/AutoVDraweeView;

    .line 31
    .line 32
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkY2SU9MNVo0RkRHNFREWFkzNklTS1dKUk8zNEZNSTE0IiwidyI6Mjg4LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDM1OTczODM2OH0.png"

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    invoke-virtual {v1, v2, v3}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x43500000    # 208.0f

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-le v0, v2, :cond_0

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    const/high16 v2, 0x435a0000    # 218.0f

    .line 50
    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    sub-int/2addr v0, v2

    .line 56
    div-int/lit8 v0, v0, 0x2

    .line 57
    .line 58
    const/high16 v2, 0x41900000    # 18.0f

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/2addr v0, v2

    .line 65
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    :cond_0
    sget v0, Ll/adc0;->w3:I

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    new-instance v0, Ll/wcw;

    .line 77
    .line 78
    invoke-direct {v0, p1}, Ll/wcw;-><init>(Ll/few;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
