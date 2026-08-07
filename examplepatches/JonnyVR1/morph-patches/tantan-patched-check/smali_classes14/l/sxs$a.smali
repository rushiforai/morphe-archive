.class public Ll/sxs$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sxs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sxs;


# direct methods
.method public constructor <init>(Ll/sxs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Ll/sxs;->v(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 15
    .line 16
    invoke-static {v1}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1, v2}, Ll/dxs;->R3(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/sxs;->n(Ll/sxs;Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 33
    .line 34
    sget v1, Ll/ldc0;->k2:I

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    sget v1, Ll/ggc0;->g:I

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 54
    .line 55
    invoke-static {p0}, Ll/sxs;->i(Ll/sxs;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    const/4 v1, -0x1

    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    :cond_1
    const-string p0, "fakeLiveSquare"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    const/high16 p0, 0x41a00000    # 20.0f

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 89
    .line 90
    .line 91
    :cond_3
    :goto_0
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 2
    .line 3
    sget v1, Ll/ldc0;->k2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    sget v1, Ll/ggc0;->i:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 23
    .line 24
    invoke-static {v1}, Ll/sxs;->i(Ll/sxs;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const-string v1, "#66FFFFFF"

    .line 31
    .line 32
    invoke-static {v1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {v1, p1}, Ll/sxs;->v(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object v1, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 50
    .line 51
    invoke-static {v1}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/jcs;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/jcs;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    const-string v1, "fakeLiveSquare"

    .line 73
    .line 74
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    iget-object p0, p0, Ll/sxs$a;->a:Ll/sxs;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/sxs;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget p1, Ll/m9c0;->B:I

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    .line 94
    .line 95
    :cond_1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    const/high16 p0, 0x41a00000    # 20.0f

    .line 106
    .line 107
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method
