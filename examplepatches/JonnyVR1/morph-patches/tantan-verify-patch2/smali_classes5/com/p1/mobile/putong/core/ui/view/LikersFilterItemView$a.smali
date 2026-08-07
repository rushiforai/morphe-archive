.class public final Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/home/member/likeme/LikeMeFilterView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\n\u001a\u00020\t2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/view/LikersFilterItemView$a",
        "Lcom/p1/mobile/putong/core/ui/home/member/likeme/LikeMeFilterView$a;",
        "",
        "type",
        "Landroid/view/View;",
        "view",
        "",
        "a",
        "(Ljava/lang/String;Landroid/view/View;)Z",
        "",
        "b",
        "(Ljava/lang/String;Landroid/view/View;)V",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView$a;->a:Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView$a;->a:Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->w(Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;)Ll/x20;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView$a;->a:Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->w(Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;)Ll/x20;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public b(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/eqq0;->Companion:Ll/eqq0$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eqq0$a;->c()Ll/eqq0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/eqq0;->i()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sparse-switch v1, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :sswitch_0
    const-string v1, "INFO_RICH_FILTER"

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :sswitch_1
    const-string v1, "NEARBY_FILTER"

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->nearby:Z

    .line 57
    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/eqq0$a;->e()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-virtual {p0}, Ll/eqq0$a;->d()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iput p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_2
    const-string v1, "ONLINE_FILTER"

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_3
    const-string v1, "VERIFIED_FILTER"

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_4

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_4
    const-string v1, "POP_FILTER"

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_5

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_5
    const-string v1, "REAL_AVATAR_FILTER"

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_6

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_6
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 136
    .line 137
    :goto_0
    invoke-virtual {p0}, Ll/eqq0$a;->c()Ll/eqq0;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, v0}, Ll/eqq0;->o(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :sswitch_data_0
    .sparse-switch
        -0x635907c3 -> :sswitch_5
        -0x5484a2ba -> :sswitch_4
        -0x4d1b0331 -> :sswitch_3
        0x18fc5ee4 -> :sswitch_2
        0x405e2138 -> :sswitch_1
        0x67ef122a -> :sswitch_0
    .end sparse-switch
.end method
