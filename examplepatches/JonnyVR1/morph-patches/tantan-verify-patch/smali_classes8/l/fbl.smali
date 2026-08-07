.class public Ll/fbl;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 3

    .line 1
    sget-object v0, Ll/fbl$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->L3()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget v0, Ll/c9c0;->c2:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/16 v0, 0x10

    .line 38
    .line 39
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    move-object p1, p0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v2, Ll/c9c0;->N:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const/high16 v0, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H(F)V

    .line 79
    .line 80
    .line 81
    sget p1, Ll/c9c0;->c2:I

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method
