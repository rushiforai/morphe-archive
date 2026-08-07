.class Lcom/idv/identity/ocr/ui/CardScanActivity$q;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->v2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->z1(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S1(I)Lcom/idv/identity/ocr/OcrType;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->B1(Lcom/idv/identity/ocr/ui/CardScanActivity;Lcom/idv/identity/ocr/OcrType;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/afm;->b0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "auto"

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    sget-object p1, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/idv/identity/ocr/IdentityScanView;->i()V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n3()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    sget-object p1, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->o3()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    sget-object p1, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/idv/identity/ocr/IdentityScanView;->i()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    sget-object p1, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_3

    .line 111
    .line 112
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$q;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const/4 p1, 0x0

    .line 119
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    :cond_3
    return-void
.end method
