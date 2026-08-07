.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k1:Lv/VLinear;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m1:Lv/VFrame_Shadow;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v0, v3

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    move v0, v2

    .line 29
    :goto_1
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 35
    .line 36
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m1:Lv/VFrame_Shadow;

    .line 45
    .line 46
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->n8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 61
    .line 62
    new-array v4, v2, [Landroid/view/View;

    .line 63
    .line 64
    aput-object v1, v4, v3

    .line 65
    .line 66
    invoke-static {v0, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->n8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m1:Lv/VFrame_Shadow;

    .line 78
    .line 79
    new-array v2, v2, [Landroid/view/View;

    .line 80
    .line 81
    aput-object v1, v2, v3

    .line 82
    .line 83
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 87
    .line 88
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A8(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 94
    .line 95
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m1:Lv/VFrame_Shadow;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A8(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 104
    .line 105
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 112
    .line 113
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->n8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 120
    .line 121
    new-array v2, v2, [Landroid/view/View;

    .line 122
    .line 123
    aput-object v1, v2, v3

    .line 124
    .line 125
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 129
    .line 130
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A8(Landroid/view/View;)V

    .line 133
    .line 134
    .line 135
    :cond_3
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$h;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->K8()V

    .line 138
    .line 139
    .line 140
    return-void
.end method
