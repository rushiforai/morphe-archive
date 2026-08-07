.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->f:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->h:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->e:Lv/VText;

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->d:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->g:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;

    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo$a;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-static {}, Ll/t450;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->i:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const-string v0, "diamond"

    .line 10
    .line 11
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Ll/dk90;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-static {}, Ll/joa;->g4()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-static {}, Ll/dk90;->i()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->i:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Ll/ktl0;->q0()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->i:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    const-string v0, "svip"

    .line 67
    .line 68
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->X(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->i:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->e:Lv/VText;

    .line 16
    .line 17
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/bnl0;->y0()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/high16 v1, 0x429e0000    # 79.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    sub-int/2addr v0, v1

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    new-array v2, v2, [Landroid/view/View;

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    aput-object v1, v2, v3

    .line 40
    .line 41
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;->h:Lv/VImage;

    .line 45
    .line 46
    new-instance v1, Ll/f5j0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/f5j0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/TopNameInfo;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
