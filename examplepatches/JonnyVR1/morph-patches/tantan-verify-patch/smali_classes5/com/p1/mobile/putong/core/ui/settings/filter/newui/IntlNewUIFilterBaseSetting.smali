.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VRangeSlider;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Lv/VSlider;

.field public n:Lv/VListCell;

.field public o:Lv/VLinear;

.field public p:Lv/VText;

.field public q:Lv/VLinear;

.field public r:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/q2i0;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/xi40;

.field public u:Lcom/p1/mobile/putong/data/Settings;

.field public v:Lcom/p1/mobile/android/app/Act;

.field public w:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->s:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->s:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->s:Ljava/util/List;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->f0(Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->i0(Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->g0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->h0(Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->u:Lcom/p1/mobile/putong/data/Settings;

    return-object p0
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;I)Lcom/p1/mobile/putong/data/LookingFor;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->b0(I)Lcom/p1/mobile/putong/data/LookingFor;

    move-result-object p0

    return-object p0
.end method

.method private e0()V
    .locals 4

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->L1:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "male"

    .line 21
    .line 22
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->N1:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "female"

    .line 40
    .line 41
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->M1:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "nonbinary"

    .line 59
    .line 60
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->L1:I

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v2, " & "

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 91
    .line 92
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->N1:I

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "both"

    .line 110
    .line 111
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->n:Lv/VListCell;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->Y(Lv/VListCell;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method private synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Pa(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private setGenderChoose(Lcom/p1/mobile/putong/data/LookingFor;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 2
    .line 3
    sget-object v1, Ll/xve0;->h:[Ll/qi40;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->a0(Lcom/p1/mobile/putong/data/LookingFor;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget-object p0, v1, p0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/o1i0;->o(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private setLookingForGender(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x2

    .line 14
    if-le v1, v2, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->p:Lv/VText;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->v:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->O1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v1, :cond_3

    .line 39
    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_1

    .line 70
    .line 71
    const-string v2, " & "

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->p:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->p:Lv/VText;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->w:Ljava/util/Map;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Ljava/lang/CharSequence;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
.method public final X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pqo;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Y(Lv/VListCell;)V
    .locals 1

    .line 1
    sget p0, Ll/gdc0;->u:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/ImageView;

    .line 8
    .line 9
    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/high16 p1, 0x41c00000    # 24.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 25
    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 31
    .line 32
    return-void
.end method

.method public Z(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->e:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/LookingFor;)I
    .locals 0

    .line 1
    const-string p0, "male"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const-string p0, "female"

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x2

    .line 22
    return p0
.end method

.method public final b0(I)Lcom/p1/mobile/putong/data/LookingFor;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "male"

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    if-ne p1, p0, :cond_1

    .line 12
    .line 13
    const-string p0, "female"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    const-string p0, "both"

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public c0(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->setLookingForGender(Lcom/p1/mobile/putong/data/Settings;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->o:Lv/VLinear;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->o:Lv/VLinear;

    .line 25
    .line 26
    new-instance v1, Ll/kqo;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/kqo;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->q:Lv/VLinear;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->d0()V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->setGenderChoose(Lcom/p1/mobile/putong/data/LookingFor;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final d0()V
    .locals 2

    .line 1
    new-instance v0, Ll/xi40;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xi40;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/o1i0;->n(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->r:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setCanAdjustChildHeight(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->r:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setIsSquare(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->r:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setAdapter(Ll/j1i0;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 36
    .line 37
    sget-object v1, Ll/xve0;->h:[Ll/qi40;

    .line 38
    .line 39
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/xi40;->r(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->t:Ll/xi40;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/o1i0;->l()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic f0(Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->l0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "+"

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, " "

    .line 12
    .line 13
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->f2:I

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-double v2, v2

    .line 38
    invoke-static {v2, v3}, Ll/q8g0;->K(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    const-wide v4, 0x404d800000000000L    # 59.0

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    cmpl-double v4, v2, v4

    .line 48
    .line 49
    if-ltz v4, :cond_0

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-ge v4, v5, :cond_0

    .line 68
    .line 69
    const-string p1, "59"

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-lt v4, v5, :cond_1

    .line 94
    .line 95
    new-instance p1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string p2, "60"

    .line 98
    .line 99
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-gt v1, p2, :cond_2

    .line 131
    .line 132
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v0, "<1 "

    .line 135
    .line 136
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->g2:I

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    .line 158
    .line 159
    sget-object p2, Ll/yra;->a:Ljava/text/DecimalFormat;

    .line 160
    .line 161
    invoke-virtual {p2, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    div-int/lit16 v0, v0, 0x3e8

    .line 186
    .line 187
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->b2:I

    .line 192
    .line 193
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-eqz v3, :cond_4

    .line 202
    .line 203
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    div-int/lit16 v3, v3, 0x3e8

    .line 208
    .line 209
    if-lt v0, v3, :cond_4

    .line 210
    .line 211
    new-instance p2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    div-int/lit16 v0, v0, 0x3e8

    .line 221
    .line 222
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    goto :goto_0

    .line 236
    :cond_4
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    if-eqz v1, :cond_5

    .line 245
    .line 246
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    div-int/lit16 v1, v1, 0x3e8

    .line 251
    .line 252
    if-gt v0, v1, :cond_5

    .line 253
    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v1, "<"

    .line 257
    .line 258
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    div-int/lit16 p2, p2, 0x3e8

    .line 266
    .line 267
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    goto :goto_0

    .line 278
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 281
    .line 282
    .line 283
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->k:Landroid/widget/TextView;

    .line 298
    .line 299
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    .line 301
    .line 302
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->n:Lv/VListCell;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object p0, p0, Ll/dkb;->t5:Ll/jxd0;

    .line 24
    .line 25
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " - "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string p1, "+"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p1, ""

    .line 45
    .line 46
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public k0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->v:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->u:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->c0(Lcom/p1/mobile/putong/data/Settings;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/lqo;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Ll/lqo;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    const/high16 v1, 0x42700000    # 60.0f

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Lv/VSlider;->setValueTo(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    int-to-double v4, v2

    .line 39
    const-wide v6, 0x3f445cae56c00036L    # 6.214E-4

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    mul-double/2addr v4, v6

    .line 45
    const-wide v6, 0x404d800000000000L    # 59.0

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    cmpl-double v2, v4, v6

    .line 51
    .line 52
    if-ltz v2, :cond_0

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-ge v2, v6, :cond_0

    .line 71
    .line 72
    const/high16 v1, 0x426c0000    # 59.0f

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-lt v2, v6, :cond_1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    double-to-int v1, v4

    .line 95
    int-to-float v1, v1

    .line 96
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 97
    .line 98
    invoke-virtual {v2, v1}, Lv/VSlider;->setValue(F)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    sub-int/2addr v1, v4

    .line 119
    div-int/lit16 v1, v1, 0x3e8

    .line 120
    .line 121
    int-to-float v1, v1

    .line 122
    invoke-virtual {v2, v1}, Lv/VSlider;->setValueTo(F)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    sub-int/2addr v1, v2

    .line 142
    div-int/lit16 v1, v1, 0x3e8

    .line 143
    .line 144
    int-to-float v2, v1

    .line 145
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 146
    .line 147
    invoke-virtual {v4}, Lv/VSlider;->getValue()F

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    cmpl-float v4, v2, v4

    .line 152
    .line 153
    if-nez v4, :cond_3

    .line 154
    .line 155
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 156
    .line 157
    add-int/2addr v1, v3

    .line 158
    int-to-float v1, v1

    .line 159
    invoke-virtual {v4, v1}, Lv/VSlider;->setValue(F)V

    .line 160
    .line 161
    .line 162
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 163
    .line 164
    invoke-virtual {v1, v2}, Lv/VSlider;->setValue(F)V

    .line 165
    .line 166
    .line 167
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 168
    .line 169
    new-instance v2, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;

    .line 170
    .line 171
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/android/app/Act;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v2}, Lv/VSlider;->setLabelFormatter(Ll/ozk0;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 178
    .line 179
    new-instance v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$c;

    .line 180
    .line 181
    invoke-direct {v1, p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$c;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/Runnable;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v1}, Lv/VSlider;->f(Ll/cp50;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->n:Lv/VListCell;

    .line 196
    .line 197
    invoke-static {v0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->n:Lv/VListCell;

    .line 201
    .line 202
    new-instance v0, Ll/mqo;

    .line 203
    .line 204
    invoke-direct {v0, p0, p2}, Ll/mqo;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 208
    .line 209
    .line 210
    new-instance p1, Ll/nqo;

    .line 211
    .line 212
    invoke-direct {p1, p0, p2}, Ll/nqo;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V

    .line 213
    .line 214
    .line 215
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    int-to-float v0, v0

    .line 227
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    int-to-float v1, v1

    .line 236
    const/4 v2, 0x0

    .line 237
    cmpg-float v4, v0, v2

    .line 238
    .line 239
    if-gtz v4, :cond_4

    .line 240
    .line 241
    sget v0, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MIN:I

    .line 242
    .line 243
    int-to-float v0, v0

    .line 244
    move v4, v3

    .line 245
    goto :goto_2

    .line 246
    :cond_4
    const/4 v4, 0x0

    .line 247
    :goto_2
    cmpg-float v5, v1, v2

    .line 248
    .line 249
    if-gtz v5, :cond_5

    .line 250
    .line 251
    sget v1, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MAX:I

    .line 252
    .line 253
    int-to-float v1, v1

    .line 254
    move v4, v3

    .line 255
    :cond_5
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->j:Lv/VRangeSlider;

    .line 256
    .line 257
    invoke-virtual {v5, v0}, Lv/VRangeSlider;->setValueFrom(F)V

    .line 258
    .line 259
    .line 260
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->j:Lv/VRangeSlider;

    .line 261
    .line 262
    invoke-virtual {v5, v1}, Lv/VRangeSlider;->setValueTo(F)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v5

    .line 269
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    int-to-float v5, v5

    .line 274
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 275
    .line 276
    .line 277
    move-result-object v6

    .line 278
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    int-to-float v6, v6

    .line 283
    cmpg-float v7, v5, v2

    .line 284
    .line 285
    if-gtz v7, :cond_6

    .line 286
    .line 287
    sget v4, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MIN:I

    .line 288
    .line 289
    int-to-float v5, v4

    .line 290
    move v4, v3

    .line 291
    :cond_6
    cmpg-float v2, v6, v2

    .line 292
    .line 293
    if-gtz v2, :cond_7

    .line 294
    .line 295
    sget v2, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MAX:I

    .line 296
    .line 297
    int-to-float v6, v2

    .line 298
    goto :goto_3

    .line 299
    :cond_7
    move v3, v4

    .line 300
    :goto_3
    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    if-eqz v3, :cond_8

    .line 305
    .line 306
    new-instance v3, Ljava/lang/IllegalStateException;

    .line 307
    .line 308
    new-instance v4, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const-string v5, "wrong age ranges(from advanced filter), uid:"

    .line 311
    .line 312
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    const-string v5, "; allowedMinimum:"

    .line 327
    .line 328
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    const-string v0, "; allowedMaximum:"

    .line 335
    .line 336
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string v0, " searchMinAge:"

    .line 343
    .line 344
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    const-string v0, "; searchMaxAge:"

    .line 351
    .line 352
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-static {v3}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 366
    .line 367
    .line 368
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->j:Lv/VRangeSlider;

    .line 369
    .line 370
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    filled-new-array {v1, v2}, [Ljava/lang/Float;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    invoke-virtual {v0, v1}, Lv/VRangeSlider;->setValues([Ljava/lang/Float;)V

    .line 383
    .line 384
    .line 385
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->j:Lv/VRangeSlider;

    .line 386
    .line 387
    new-instance v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$d;

    .line 388
    .line 389
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$d;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/Runnable;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0, v1}, Lv/VRangeSlider;->f(Ll/cp50;)V

    .line 393
    .line 394
    .line 395
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->c:Lv/VFrame;

    .line 396
    .line 397
    new-instance p2, Ll/oqo;

    .line 398
    .line 399
    invoke-direct {p2, p0}, Ll/oqo;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {p1, p2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 403
    .line 404
    .line 405
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->v:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->v:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->v:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Km(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->e:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->e:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->X(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->e0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
