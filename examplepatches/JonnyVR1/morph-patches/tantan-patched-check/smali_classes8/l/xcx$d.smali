.class public Ll/xcx$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/xcx;


# direct methods
.method public constructor <init>(Ll/xcx;ILandroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 2
    .line 3
    iput p2, p0, Ll/xcx$d;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/xcx$d;->b:Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object p4, p0, Ll/xcx$d;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/xcx$d;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/xcx$d;->a:I

    .line 8
    .line 9
    const/16 v1, 0x2c

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 14
    .line 15
    invoke-static {v0}, Ll/xcx;->I(Ll/xcx;)Lv/VText;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "\u91cd\u9022\u914d\u5bf9"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 25
    .line 26
    invoke-static {v0}, Ll/xcx;->G(Ll/xcx;)Landroid/widget/TextView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "\u518d\u6b21\u91cd\u9022\u4f60\u4eec\u4f9d\u7136\u4e92\u76f8\u559c\u6b22\uff0c\u53bb\u804a\u804a\u5427"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 36
    .line 37
    invoke-static {v0}, Ll/xcx;->G(Ll/xcx;)Landroid/widget/TextView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/high16 v1, 0x42000000    # 32.0f

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 51
    .line 52
    invoke-static {v0}, Ll/xcx;->G(Ll/xcx;)Landroid/widget/TextView;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 64
    .line 65
    invoke-static {p0}, Ll/xcx;->G(Ll/xcx;)Landroid/widget/TextView;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v0, "#66E8CA8A"

    .line 70
    .line 71
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    invoke-static {}, Ll/gra;->j2()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v1, p0, Ll/xcx$d;->e:Ll/xcx;

    .line 84
    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Ll/xcx$d;->b:Landroid/widget/TextView;

    .line 88
    .line 89
    iget-object v2, p0, Ll/xcx$d;->c:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p0, p0, Ll/xcx$d;->d:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v0, v2, p0}, Ll/xcx;->R0(Ll/xcx;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    iget-object v0, p0, Ll/xcx$d;->b:Landroid/widget/TextView;

    .line 98
    .line 99
    iget-object v2, p0, Ll/xcx$d;->c:Ljava/lang/String;

    .line 100
    .line 101
    iget-object p0, p0, Ll/xcx$d;->d:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1, v0, v2, p0}, Ll/xcx;->Q0(Ll/xcx;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method
