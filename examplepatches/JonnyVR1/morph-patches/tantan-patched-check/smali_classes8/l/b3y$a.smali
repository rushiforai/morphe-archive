.class public Ll/b3y$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b3y;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b3y;


# direct methods
.method public constructor <init>(Ll/b3y;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 2
    .line 3
    iget-object v0, v0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    iget-object v1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 12
    .line 13
    invoke-static {v1}, Ll/b3y;->f(Ll/b3y;)Ll/w2y;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/w2y;->g0()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 29
    .line 30
    iget-object v3, v1, Ll/b3y;->b:Lv/VCheckCircle;

    .line 31
    .line 32
    invoke-static {v1}, Ll/b3y;->f(Ll/b3y;)Ll/w2y;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/w2y;->g0()Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v3, v1, v2}, Lv/VCheckCircle;->e(ZZ)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 48
    .line 49
    invoke-static {v1}, Ll/b3y;->e(Ll/b3y;)Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, "/"

    .line 64
    .line 65
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 69
    .line 70
    iget-object p1, p1, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 87
    .line 88
    iget-object p1, p1, Ll/b3y;->a:Lv/VPager;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-ge v2, p1, :cond_2

    .line 95
    .line 96
    iget-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 97
    .line 98
    iget-object p1, p1, Ll/b3y;->a:Lv/VPager;

    .line 99
    .line 100
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 105
    .line 106
    if-eqz p1, :cond_1

    .line 107
    .line 108
    iget-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 109
    .line 110
    iget-object p1, p1, Ll/b3y;->a:Lv/VPager;

    .line 111
    .line 112
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_1

    .line 125
    .line 126
    iget-object p1, p0, Ll/b3y$a;->a:Ll/b3y;

    .line 127
    .line 128
    iget-object p1, p1, Ll/b3y;->a:Lv/VPager;

    .line 129
    .line 130
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 137
    .line 138
    .line 139
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_2
    return-void
.end method
