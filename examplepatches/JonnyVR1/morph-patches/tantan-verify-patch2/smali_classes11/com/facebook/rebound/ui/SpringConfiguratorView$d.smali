.class public Lcom/facebook/rebound/ui/SpringConfiguratorView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/rebound/ui/SpringConfiguratorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/rebound/ui/SpringConfiguratorView;


# direct methods
.method public constructor <init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Lcom/facebook/rebound/ui/SpringConfiguratorView$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;)V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 7

    .line 1
    iget-object p3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/SeekBar;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v0, 0x0

    .line 8
    const v1, 0x47c35000    # 100000.0f

    .line 9
    .line 10
    .line 11
    if-ne p1, p3, :cond_0

    .line 12
    .line 13
    int-to-float p3, p2

    .line 14
    const/high16 v2, 0x43480000    # 200.0f

    .line 15
    .line 16
    mul-float/2addr p3, v2

    .line 17
    div-float/2addr p3, v1

    .line 18
    add-float/2addr p3, v0

    .line 19
    iget-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Ll/uyf0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    float-to-double v3, p3

    .line 26
    invoke-static {v3, v4}, Ll/b660;->d(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    iput-wide v5, v2, Ll/uyf0;->b:D

    .line 31
    .line 32
    invoke-static {}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l()Ljava/text/DecimalFormat;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    iget-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->m(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/TextView;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v4, "T:"

    .line 49
    .line 50
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 64
    .line 65
    invoke-static {p3}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/SeekBar;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    if-ne p1, p3, :cond_1

    .line 70
    .line 71
    int-to-float p1, p2

    .line 72
    const/high16 p2, 0x42480000    # 50.0f

    .line 73
    .line 74
    mul-float/2addr p1, p2

    .line 75
    div-float/2addr p1, v1

    .line 76
    add-float/2addr p1, v0

    .line 77
    iget-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 78
    .line 79
    invoke-static {p2}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Ll/uyf0;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    float-to-double v0, p1

    .line 84
    invoke-static {v0, v1}, Ll/b660;->a(D)D

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    iput-wide v2, p2, Ll/uyf0;->a:D

    .line 89
    .line 90
    invoke-static {}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l()Ljava/text/DecimalFormat;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView;

    .line 99
    .line 100
    invoke-static {p0}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/TextView;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance p2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string p3, "F:"

    .line 107
    .line 108
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
