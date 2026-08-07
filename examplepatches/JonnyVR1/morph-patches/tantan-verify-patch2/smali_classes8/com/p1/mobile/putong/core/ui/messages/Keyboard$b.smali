.class public Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;
.super Ll/a;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/Keyboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Ll/pf60<",
        "Lcom/p1/mobile/putong/core/data/StickerBundle;",
        "Lcom/p1/mobile/putong/core/data/StickerPackage;",
        ">;>;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation
.end field

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->c:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/b0r;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    return-void
.end method

.method private I(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    sget-object v1, Ll/oze;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->A(Ljava/util/ArrayList;)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    sget-object v1, Ll/hxj0$a;->b:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->C(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 v1, 0x2

    .line 19
    if-ne p1, v1, :cond_2

    .line 20
    .line 21
    sget-object v1, Ll/hxj0$a;->c:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->C(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->B(I)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Lv/VList_Horizontal;->setSelection(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->G(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;ILcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->E(ILcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->D(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->F(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->I(I)V

    return-void
.end method


# virtual methods
.method public final A(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/meme/a;

    .line 6
    .line 7
    new-instance v2, Ll/a0r;

    .line 8
    .line 9
    invoke-direct {v2, p0, p1}, Ll/a0r;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;Ljava/util/ArrayList;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/meme/a;-><init>(Ll/y20;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final B(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/meme/b;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/pf60;

    .line 12
    .line 13
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    new-instance v4, Ll/yzq;

    .line 24
    .line 25
    invoke-direct {v4, p0, p1}, Ll/yzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;I)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/meme/b;-><init>(Lcom/p1/mobile/putong/core/data/StickerPackage;Landroid/app/Activity;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ll/pf60;

    .line 39
    .line 40
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 45
    .line 46
    const-string v0, "locked"

    .line 47
    .line 48
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final C(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 4
    .line 5
    new-instance v1, Ll/r1r;

    .line 6
    .line 7
    new-instance v2, Ll/zzq;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/zzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, p1, v2}, Ll/r1r;-><init>(Ljava/util/List;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic D(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->C2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/r97;->M()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Ll/oze;->b:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const-string v1, "emoji_type"

    .line 32
    .line 33
    const-string v2, "p_chat_view"

    .line 34
    .line 35
    const-string v3, "e_emoji"

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const-string v0, "white"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v3, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v0, Ll/oze;->d:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    const-string v0, "yellow"

    .line 62
    .line 63
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v3, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0, p2}, Ll/u1z;->B1(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    sget-object p1, Ll/oze;->c:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    sget-object v1, Ll/oze;->b:Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    if-ne p0, v0, :cond_3

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_3

    .line 115
    .line 116
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Ll/oze$a;

    .line 121
    .line 122
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 123
    .line 124
    iget p1, p1, Ll/oze$a;->b:I

    .line 125
    .line 126
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    const/4 v1, 0x1

    .line 135
    sub-int/2addr v0, v1

    .line 136
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_2

    .line 145
    .line 146
    :cond_3
    return-void
.end method

.method public final synthetic E(ILcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/pf60;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/r97;->M()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "emoji_type"

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "e_emoji"

    .line 50
    .line 51
    const-string v1, "p_chat_view"

    .line 52
    .line 53
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {p0, p2, p1}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic F(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->C2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Ll/u1z;->B1(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final G(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->g:Lv/VPagerCircleIndicator;

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->g:Lv/VPagerCircleIndicator;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->g:Lv/VPagerCircleIndicator;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 38
    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->g:Lv/VPagerCircleIndicator;

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Lv/VPagerCircleIndicator;->setCurrentItem(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public H(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->c:Ljava/util/List;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->z(Landroid/view/View;Ll/pf60;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->n5:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lt p3, p1, :cond_0

    .line 6
    .line 7
    const/4 p3, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p3}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/pf60;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    iget-object p1, p1, Ll/dkb;->M1:Ll/vxd0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-ne p3, p1, :cond_1

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object p1, p1, Ll/dkb;->M1:Ll/vxd0;

    .line 38
    .line 39
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->I(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Landroid/view/View;Ll/pf60;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;II)V"
        }
    .end annotation

    .line 1
    sget p0, Ll/edc0;->o1:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/VDraweeView;

    .line 8
    .line 9
    sget p3, Ll/edc0;->K3:I

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    const/high16 p1, 0x41c00000    # 24.0f

    .line 19
    .line 20
    const/high16 p3, 0x41800000    # 16.0f

    .line 21
    .line 22
    if-nez p4, :cond_0

    .line 23
    .line 24
    new-instance p2, Ll/jye;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    const-string v0, "\ud83d\ude0a"

    .line 31
    .line 32
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-direct {p2, p4, v0, p3, p1}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const/4 v0, 0x1

    .line 44
    if-ne p4, v0, :cond_1

    .line 45
    .line 46
    new-instance p2, Ll/jye;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    const-string v0, "\ud83d\udc36"

    .line 53
    .line 54
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-direct {p2, p4, v0, p3, p1}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    const/4 v0, 0x2

    .line 66
    if-ne p4, v0, :cond_2

    .line 67
    .line 68
    new-instance p2, Ll/jye;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    const-string v0, "\ud83c\udf54"

    .line 75
    .line 76
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-direct {p2, p4, v0, p3, p1}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast p2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 92
    .line 93
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StickerPackage;->pictures:Ljava/util/List;

    .line 94
    .line 95
    const/4 p3, 0x0

    .line 96
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->stickerPackage()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
