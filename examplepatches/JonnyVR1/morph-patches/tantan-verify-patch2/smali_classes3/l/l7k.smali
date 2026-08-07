.class public Ll/l7k;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->c5:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->a:Lv/VImage;

    .line 10
    .line 11
    sget v0, Ll/adc0;->je:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->b:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/adc0;->P1:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VText;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->c:Lv/VText;

    .line 30
    .line 31
    sget v0, Ll/adc0;->h1:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VLinear;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->d:Lv/VLinear;

    .line 40
    .line 41
    sget v0, Ll/adc0;->f1:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VCheckBox;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->e:Lv/VCheckBox;

    .line 50
    .line 51
    sget v0, Ll/adc0;->i1:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VText;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->f:Lv/VText;

    .line 60
    .line 61
    sget v0, Ll/adc0;->ya:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VText;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->g:Lv/VText;

    .line 70
    .line 71
    sget v0, Ll/adc0;->P8:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lv/VText;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->h:Lv/VText;

    .line 80
    .line 81
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->ld:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/l7k;->a(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
