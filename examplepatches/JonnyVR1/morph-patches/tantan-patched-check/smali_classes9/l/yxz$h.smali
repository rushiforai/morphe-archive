.class public Ll/yxz$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->e5(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$h;->a:Ll/yxz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/yxz$h;->a:Ll/yxz;

    .line 4
    .line 5
    invoke-static {p0}, Ll/yxz;->H3(Ll/yxz;)Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/tvz;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/d3z;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 v0, -0x2

    .line 38
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public b(FIIZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yxz$h;->a:Ll/yxz;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yxz;->F3(Ll/yxz;)Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/tvz;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/d3z;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-lez v1, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Ll/yxz$h;->a:Ll/yxz;

    .line 38
    .line 39
    invoke-static {p0}, Ll/yxz;->G3(Ll/yxz;)Ll/clz;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/tvz;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/vez;->E0()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/high16 v2, 0x3f800000    # 1.0f

    .line 58
    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    if-eqz p4, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    :goto_0
    sub-float/2addr v2, p1

    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    int-to-float p0, v1

    .line 77
    mul-float/2addr p0, p1

    .line 78
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 79
    .line 80
    .line 81
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sub-int/2addr p3, p2

    .line 86
    int-to-float p2, p2

    .line 87
    int-to-float p3, p3

    .line 88
    mul-float/2addr p3, p1

    .line 89
    add-float/2addr p2, p3

    .line 90
    float-to-int p1, p2

    .line 91
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method
