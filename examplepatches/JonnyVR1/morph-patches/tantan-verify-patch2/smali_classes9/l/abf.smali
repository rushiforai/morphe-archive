.class public Ll/abf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/abf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/abf;->U()V

    return-void
.end method

.method public static synthetic T(Ll/abf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/abf;->V()V

    return-void
.end method

.method private synthetic U()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputBirthday;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputBirthday;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic V()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputNickName;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputNickName;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final W(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/abf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/abf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 10
    .line 11
    iget-object v1, p0, Ll/abf;->u:Ljava/util/Map;

    .line 12
    .line 13
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 14
    .line 15
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/abf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 29
    .line 30
    sget-object v0, Ll/pzi0;->c:Ljava/text/SimpleDateFormat;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u57fa\u672c\u4fe1\u606f"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "basic"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/abf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 5
    .line 6
    new-instance v1, Ll/yaf;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/yaf;-><init>(Ll/abf;)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/abf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 16
    .line 17
    new-instance v1, Ll/zaf;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/zaf;-><init>(Ll/abf;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/l01;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/abf;->u:Ljava/util/Map;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ap:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "male"

    .line 43
    .line 44
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/abf;->u:Ljava/util/Map;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Zo:I

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "female"

    .line 60
    .line 61
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/abf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string v1, "\u540d\u5b57"

    .line 13
    .line 14
    sget v2, Ll/dbc0;->ut:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/abf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 29
    .line 30
    const-string v1, "\u751f\u65e5"

    .line 31
    .line 32
    sget v2, Ll/dbc0;->at:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/abf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 47
    .line 48
    const-string v1, "\u6027\u522b"

    .line 49
    .line 50
    sget v2, Ll/dbc0;->ht:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/abf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->setRightIconRes(I)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/abf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/abf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/abf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/abf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/abf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    return-object v0
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/abf;->W(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
