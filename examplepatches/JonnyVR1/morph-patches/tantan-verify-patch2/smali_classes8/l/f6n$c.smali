.class public final Ll/f6n$c;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f6n;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/f6n$c",
        "Landroidx/viewpager2/widget/ViewPager2$i;",
        "",
        "position",
        "",
        "onPageSelected",
        "(I)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/f6n;


# direct methods
.method public constructor <init>(Ll/f6n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(I)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne v0, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageSelected(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/f6n;->k(Ll/f6n;I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/f6n;->x()Lv/VText;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 16
    .line 17
    invoke-static {v0}, Ll/f6n;->i(Ll/f6n;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    add-int/2addr v0, v1

    .line 23
    iget-object v2, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 24
    .line 25
    invoke-static {v2}, Ll/f6n;->f(Ll/f6n;)Ll/r5n;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v3, 0x0

    .line 30
    const-string v4, "adapter"

    .line 31
    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    move-object v2, v3

    .line 38
    :cond_0
    invoke-virtual {v2}, Ll/r5n;->C()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v5, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, "/"

    .line 51
    .line 52
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 66
    .line 67
    invoke-static {p1}, Ll/f6n;->i(Ll/f6n;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object v0, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 72
    .line 73
    invoke-static {v0}, Ll/f6n;->f(Ll/f6n;)Ll/r5n;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-nez v0, :cond_1

    .line 78
    .line 79
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    move-object v3, v0

    .line 84
    :goto_0
    invoke-virtual {v3}, Ll/r5n;->C()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    sub-int/2addr v0, v1

    .line 89
    iget-object v2, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 90
    .line 91
    if-ne p1, v0, :cond_3

    .line 92
    .line 93
    invoke-virtual {v2}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 101
    .line 102
    invoke-static {p1}, Ll/f6n;->j(Ll/f6n;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ljava/util/Collection;

    .line 107
    .line 108
    new-instance v0, Ll/g6n;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/g6n;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object p0, p0, Ll/f6n$c;->a:Ll/f6n;

    .line 118
    .line 119
    if-eqz p1, :cond_2

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const p1, 0x3e99999a    # 0.3f

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_2
    invoke-virtual {p0}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const/high16 p1, 0x3f800000    # 1.0f

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_3
    invoke-virtual {v2}, Ll/f6n;->y()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    const/4 p1, 0x0

    .line 147
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    return-void
.end method
