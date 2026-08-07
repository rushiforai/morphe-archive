.class public Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lv/VList_Horizontal;->setSelection(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object v0, v0, Ll/dkb;->M1:Ll/vxd0;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 v0, 0x3

    .line 32
    if-lt p1, v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)Ll/au9;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p1}, Ll/au9;->s(I)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 49
    .line 50
    const-string v1, "stickers_id"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {v0}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "e_stickers_type"

    .line 61
    .line 62
    const-string v2, "p_chat_view"

    .line 63
    .line 64
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->m(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v1, 0x1

    .line 74
    if-le p1, v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)Ll/au9;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)Ll/au9;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2, p1}, Ll/au9;->s(I)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v2, v1}, Ll/au9;->t(Ljava/lang/String;Z)Ll/jxd0;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Ljava/lang/Boolean;

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_2

    .line 113
    .line 114
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 120
    .line 121
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)Ll/au9;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 126
    .line 127
    .line 128
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-interface {p0}, Ll/r97;->q()Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_3

    .line 141
    .line 142
    if-ne p1, v1, :cond_3

    .line 143
    .line 144
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 151
    .line 152
    .line 153
    :cond_3
    return-void
.end method
