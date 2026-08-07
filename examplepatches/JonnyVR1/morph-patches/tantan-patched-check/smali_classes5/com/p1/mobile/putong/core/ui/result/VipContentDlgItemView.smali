.class public Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;
.super Lv/VLinear;
.source "SourceFile"


# static fields
.field public static final A:I

.field public static final B:I

.field public static final C:I


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Lv/VRelative;

.field public h:Lv/VDraweeView;

.field public i:Lv/VLinear_FillerMeasure;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Lv/VFrame;

.field public o:Lv/VFrame;

.field public p:Lv/AutoVDraweeView;

.field public q:Lv/VLinear;

.field public r:Lv/VImage;

.field public s:Lv/VFrame;

.field public t:Lv/VText;

.field public u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

.field public v:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public w:Lcom/p1/mobile/putong/core/ui/result/a$f;

.field public x:Lcom/p1/mobile/putong/app/PutongFrag;

.field public y:Lcom/p1/mobile/putong/core/data/Privilege;

.field public z:Lcom/p1/mobile/android/app/Act;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x43520000    # 210.0f

    .line 2
    .line 3
    invoke-static {}, Ll/vnb;->m1()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-float/2addr v1, v0

    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sput v0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->A:I

    .line 13
    .line 14
    const/high16 v0, 0x438c0000    # 280.0f

    .line 15
    .line 16
    invoke-static {}, Ll/vnb;->m1()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    mul-float/2addr v1, v0

    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sput v0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->B:I

    .line 26
    .line 27
    const/high16 v0, 0x41700000    # 15.0f

    .line 28
    .line 29
    invoke-static {}, Ll/vnb;->m1()F

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    mul-float/2addr v1, v0

    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    sput v0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->C:I

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->v0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->A0(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->y0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->K0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->I0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->G0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->N0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->D0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->P0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->z0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->Q0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->J0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->M0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private getPrivacyMembershipImageUrl()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "ko-KR"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJZVDRQV040RE1XS0pWSUZWNU1GWFFOWE82RlZRTjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM1MjUzNTUwMzU3MTA3NjMsImFiIjowfQ.png"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "ja-JP"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZTN1JIRkdPNVJOWVlQRFJaS1FVRkVLR0xNU0tQSDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM1MjU0MjM3NTM2MjI4OTF9.png"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "id-ID"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNKNFNEUVNDVkRPQlVKNE1BVlc2Nk03NDdaNllBVjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM0OTAxMDIyMTM2Mzg0OTF9.png"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    const-string v0, "zh-TW"

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjUyVzY3V1lYRDdETFMyVVI1UlVLRVBJSzJGRkRDTjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTQ2NDQ2OTk3MDgyNTYwODE5LCJhYiI6MH0.png"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const-string v0, "zh-CN"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxGWE80U0ZGTEQ3UlJTQzJRTjdFNTZWMkw1RU1DVzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTQ2NDQ2OTk3MDgyNTYwODE5LCJhYiI6MH0.png"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilc2SkVBMk9DSzYyNEpGM1hENVg3R1pKS0dSTE5YTzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTQ2NDQ2ODI1MjgxNzgwMDU5LCJhYiI6MH0.png"

    .line 61
    .line 62
    return-object p0
.end method

.method private getSVIPAdvancedFilterImageUrl()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "en"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkROUVpTNkNUMkkzSTI3U1M3VEpNQ0tOVUlGS0pWVTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM1MDc5MDAyODg4ODMwMTksImFiIjowfQ.png"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJPQTVQRlU1VUpEUjdZREVCRkRWWEpXSDRWNENWNDA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM1MDc3NjI1ODA5Njk3ODMsImFiIjowfQ.png"

    .line 21
    .line 22
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->H0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->E0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->O0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->L0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->R0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    return-object p0
.end method

.method private s0(I)Ljava/lang/String;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic B0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->z:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->u:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 12
    .line 13
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Q8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q0(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->getPrivacyMembershipImageUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "en"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJKUUlWWjQ0V1NQWDY2TkZDSTQ3WU9ORFpBVFFRWDA4IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY2NjA4NjI3MTc5MTUzMTk5fQ.png"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkM3SVBIT1BJMk9ESENZVkNUQ0dTUFNHSFBXNzdOMzA4IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY4ODYwNDI2NzU4MDg3OTgzfQ.png"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRaQkJHVUwyS0lUQjRMWkxBU1VQQjZRVEtXWkhQUjA5IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY2NjA4NjI3MTc5MTUyMTcxfQ.png"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjM3WjZCWU9aTE5XUU9ZVkpGVUZFSDQ3U0lEVDVUTjA4IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY4ODYwNDI2NzU4MDg3OTc5fQ.png"

    .line 35
    .line 36
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilk2NlNDNExPTUxXVEtQSDRMWEtORTNLUUtPMk4yTzA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY2NjA4NjI2OTEwNzE2NzE1LCJhYiI6MH0.png"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9WUjZENENISzZVRUszTFBPQjM0SURQRUJPV01SQzA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjY4ODYwNDI2NzU3OTU2OTA3LCJhYiI6MH0.png"

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "en"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJSQzRQSlpQM0tFVlI2V0I1NkdJVkFHSUNCNFZVTTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjc4NjYzNzQzNzMwNTc1NjYzLCJhYiI6MH0.png"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJWSFNDNUpOSlk1WlJWWjdHUk1NQU9HQkQ0UkxRMzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjc2OTc0ODg1MjgwMzc3MTM1LCJhYiI6MH0.png"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlI2REdFS0hNRkpERFVSWktYVVJOU0lYSks3QUxVNjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjc4NjYzNzQzNzMwNTc1NjU5LCJhYiI6MH0.png"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkcyVFBSRlpGRk9YT0ZTWlY0WDNaRkZZTFZMMkJUUTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjc2OTc0ODg1MjgwMzc3MTMxLCJhYiI6MH0.png"

    .line 35
    .line 36
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IllOWUhVQUdYSk41VUxYWU5RVDNYWlJEUk5RN1FIUTA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjc4NjYzNzQzNzMwNTc1NjU5LCJhYiI6MH0.png"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpDUUlMN1VUSTVZQVdHVTVPU1dKMzZDUVNIWjZHRCIsInciOjk5MywiaCI6ODcwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzY3Njk3NDg4NTI4MDM3NzEzMSwiYWIiOjB9.png"

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic K0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->r0(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->R6()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic M0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQ3SDNFUUxLVjY3TzdaWTdDRUFWRFc1RTVGSk1SRjA2IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNTQ2MDM0ODAwMTYwNDk5MDYxfQ.png"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IllWQlZETk1LUFpZQVBXQTRaWElDRFdKMkhFUVVNVDA3IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMzk4MzQ1NjA4NDExMTc1NzgxfQ.png"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic N0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRXRUtZWVg2VFhZREdQWUNRUzVGV09IREc2UlRBWjA3IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzQwMzkxNjYzNTY0MzAzMTg5fQ.png"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNaTUtQQU83SVdLVkpVVFVBTTdXQkRDSkhENVJGSjA3IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2MTU1MTAyNDY4MDY0MzUzMTQxfQ.png"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjYyWVFKR0tFVExSSjVYUUNRSFYzSFlBRjJBSENCSDA2IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozODM0MDk5NjE1NDY2NTk3MjAxfQ.png"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFXMlZXSU5XQk5EMzNTUU1QNVg2NTdNNEdSU1BNMjA2IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzk0ODExMTk5NDA0OTc2OTczfQ.png"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p1, Ll/jbc0;->y0:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p1, Ll/jbc0;->x0:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkFaQ0dEMklOWFk2TFo1VFA0SkJCWklGREVGR1Y1WTE0IiwidyI6NjM2LCJoIjo4NTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTI3NjYyMTYwNTc0Mzg0MDIxNH0.webp"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlhJUlZFVzVKVVdBTVBPUkwzTjZZUFRVSTZLSlE1NDE0IiwidyI6NjM2LCJoIjo4NTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzgzNjQ5NTUwNDEzODM5OTIxMH0.webp"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 4
    .line 5
    invoke-static {}, Ll/c17;->u0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkZXUDVQR1VDRzdBQkxTTUFKNkFRVksyQ1YzN1lCTDE0IiwidyI6NjM2LCJoIjo4NTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDEyMzY4MTg4MDY4OTE5MTM1Mn0.webp"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ikc3SDZYQVQzSlFOR09PWElBWDZGM1BaVEVZU1NNNTE0IiwidyI6NjM2LCJoIjo4NTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxODE1ODkxNTUyNDMyNzQ1MzE2MH0.webp"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final S0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v2, "\u9ad8\u7ea7\u7b5b\u9009"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->getSVIPAdvancedFilterImageUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFXUEVJNVFYSUhHREUyS1FXV0Y3NDYyQ0ZPNlZSRDA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTM1MDc3NjI1ODA5Njc3MTksImFiIjowfQ.png"

    .line 41
    .line 42
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    const-string v0, "\u66f4\u591a\u7b5b\u9009\u6761\u4ef6\n\u9047\u89c1\u76f8\u4f3c\u7684\u4eba"

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final T0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->a9:I

    .line 23
    .line 24
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :goto_0
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    if-ne p1, v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 48
    .line 49
    sget v2, Ll/jbc0;->F8:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 56
    .line 57
    sget v2, Ll/jbc0;->f:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 63
    .line 64
    sget v2, Ll/jbc0;->g:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->k:Lv/VImage;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    if-ne p1, v3, :cond_2

    .line 78
    .line 79
    sget p1, Ll/jbc0;->Ya:I

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->cc()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    :goto_2
    invoke-static {v2, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {p1, v0, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance v0, Ll/wol0;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/wol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->z9:I

    .line 130
    .line 131
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->i:I

    .line 136
    .line 137
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v2, Ljava/lang/StringBuffer;

    .line 142
    .line 143
    invoke-direct {v2, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    const-string v3, " ("

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 152
    .line 153
    .line 154
    const/16 v0, 0x29

    .line 155
    .line 156
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v2, Landroid/text/SpannableString;

    .line 164
    .line 165
    invoke-direct {v2, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    new-instance v3, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$a;

    .line 169
    .line 170
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$a;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    add-int/2addr p1, v1

    .line 178
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    sub-int/2addr v0, v1

    .line 183
    const/16 v1, 0x12

    .line 184
    .line 185
    invoke-virtual {v2, v3, p1, v0, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 189
    .line 190
    const/4 v0, 0x4

    .line 191
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLines(I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 195
    .line 196
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 200
    .line 201
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public final U0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/c17;->u0()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 23
    .line 24
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v4}, Ll/dkb;->o9()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v2, v3, v4}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Ll/bpl0;

    .line 37
    .line 38
    invoke-direct {v3, p0, v1}, Ll/bpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Z)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v2, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final V0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->y:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->s6:I

    .line 17
    .line 18
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 26
    .line 27
    sget v2, Ll/jbc0;->T0:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 35
    .line 36
    const-string v3, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjJRRFJNU1YzVk1MVzNMNDJSSkNKUzVXNE5TRExRWTE0IiwidyI6NjM2LCJoIjo4NTIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTI5NDUzNDc5MzU0OTI3MzgzMn0.webp"

    .line 37
    .line 38
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r6:I

    .line 57
    .line 58
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :goto_1
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final W0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/kpl0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/kpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final X0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/pol0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/pol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Y0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/rol0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/rol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Z0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->X8:I

    .line 17
    .line 18
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n:Lv/VFrame;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 32
    .line 33
    sget v3, Ll/jbc0;->h:I

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    invoke-virtual {v4}, Ll/dkb;->o9()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v1, v3, v4}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v3, Ll/gpl0;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Ll/gpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 79
    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p:I

    .line 91
    .line 92
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 93
    .line 94
    .line 95
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 110
    .line 111
    const/high16 v1, 0x40c00000    # 6.0f

    .line 112
    .line 113
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->d:Lv/VText;

    .line 121
    .line 122
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->R8:I

    .line 131
    .line 132
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, " >"

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->d:Lv/VText;

    .line 149
    .line 150
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->z:Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 156
    .line 157
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 158
    .line 159
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 160
    .line 161
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    new-instance v1, Ll/hpl0;

    .line 174
    .line 175
    invoke-direct {v1, p0}, Ll/hpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->d:Lv/VText;

    .line 186
    .line 187
    new-instance v1, Ll/ipl0;

    .line 188
    .line 189
    invoke-direct {v1, p0}, Ll/ipl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    :cond_2
    return-void
.end method

.method public final a1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v2, "\u67e5\u770b\u6d88\u606f\u5df2\u8bfb\u72b6\u6001"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/yol0;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/yol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    const-string v0, "\u663e\u793a\u5bf9\u65b9\u662f\u5426\u770b\u8fc7\u4f60\u7684\u6d88\u606f\n\u4e0d\u518d\u88ab\u52a8\u82e6\u82e6\u7b49\u5f85"

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final d1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/jpl0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/jpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    const-string v0, "\u9690\u79c1\u7279\u6743"

    .line 76
    .line 77
    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlUySERRN1hCRklOWVJQRE1HMjI1Wk03VVFBWU1aSTA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTQ2NDI5MjY3MDU0OTA5NzM5LCJhYiI6MH0.png"

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNTM05HS0QzU1oyTTVLSFRZNENEU0ZYN0ZSWTZTMzA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTQ2NDI5MjY3MDU0OTA1NjM1LCJhYiI6MH0.png"

    .line 98
    .line 99
    :goto_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 103
    .line 104
    const-string v0, "\u53ea\u5bf9\u6211\u559c\u6b22\u7684\u4eba\u53ef\u89c1\n\u9690\u85cf\u4f1a\u5458\u8eab\u4efd\u7b49"

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final e1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->bk()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/uol0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/uol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Il()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Jj()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_0
    const-string v0, "\u5728\u7ebf\u95ea\u804a"

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 106
    .line 107
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/vol0;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/vol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 132
    .line 133
    const-string v0, "\u7acb\u523b\u83b7\u5f97\u795e\u79d8\u914d\u5bf9\n\u5b9e\u65f6\u4e92\u52a8\u7545\u804a\u65e0\u963b\uff01"

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final f1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/dpl0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/dpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    const-string v1, "\u627e\u56de\u89e3\u9664\u7684\u914d\u5bf9"

    .line 76
    .line 77
    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 83
    .line 84
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    new-instance v2, Ll/epl0;

    .line 97
    .line 98
    invoke-direct {v2, p0}, Ll/epl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 109
    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    goto :goto_1

    .line 117
    :cond_2
    const-string v0, "\u4e0d\u9519\u8fc7\u6bcf\u4e00\u6b21\u7f18\u5206"

    .line 118
    .line 119
    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final g1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->N6:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 32
    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/zol0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/zol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 58
    .line 59
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->K6:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final h1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/apl0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/apl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final j1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_more:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/cpl0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/cpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final k1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_online:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/fpl0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/fpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final l1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_pop:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/xol0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/xol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final m1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 28
    .line 29
    const/4 v4, 0x5

    .line 30
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 62
    .line 63
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    new-instance v2, Ll/sol0;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Ll/sol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 88
    .line 89
    sget v2, Ll/jbc0;->i:I

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 107
    .line 108
    if-eqz v1, :cond_1

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->g2:I

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lpl0;->a(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->Z8:I

    .line 17
    .line 18
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 26
    .line 27
    sget v2, Ll/jbc0;->j:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 35
    .line 36
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/tol0;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/tol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 79
    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L7:I

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final o0(Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IllSS1hPN1VJNTdYNVJLNTRWN09GTzVTWUZBWEZUNjA3IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NTc5ODk1OTUxODY0ODQ5MjA1fQ.png"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpZWkdENEFWQkNYRUFBSzVXNFhEM1A3NkJHTFhNNjA2IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NTc5ODk2MDQ2MDUwMTYxNDQ5fQ.png"

    .line 7
    .line 8
    :goto_0
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "ko-KR"

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVYU0xMVEpKSFhaSzRBS1A2SDNBT0daSFg1VFMyVjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTQ0NzQxMDcxNjY0OTMxNjM3LCJhYiI6MH0.png"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJWQkJaVEJLWjY0NVlCUkpBNUpWN1ZDUDdDSUxJSjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTQ0NzQxMTQ4NjM2ODIwMjczLCJhYiI6MH0.png"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string v1, "ja-JP"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IklEN0wzWUg1MkZCNVpaMjRIT0VDVlFDUTdHRVpKVTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTQ0NzQxMDcxNjY0OTMxNjM3LCJhYiI6MH0.png"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdEQUY3UVVQUE1FWlMyTkZIVFlCSjVaRUZFR05SNDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTQ0NzQxMTQ4NjM2ODIwMjczLCJhYiI6MH0.png"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    const-string v1, "id-ID"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRWUjQzQ1IzUkVJWU1ON0xJUEE2UzZDSk5VUFBaTzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MTIxMjAxODIzOTY4MzU1MTI1LCJhYiI6MH0.png"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_5
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MjNIT0FCTzQ0VkRXWE1UNkhHUFg0UFRURTdZWTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MTIxMjAxOTAwOTQwMjQzNzYxLCJhYiI6MH0.png"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_6
    const-string v1, "zh-TW"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_8

    .line 67
    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZHSkxSN1pWNUpOQ1FHWlRNUzI1V0xMRVpQVEpYMzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MTIxMjAxODIzOTY4MzU1MTI1LCJhYiI6MH0.png"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_7
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlZWNFRNNUNMUlNSN1YyR0wzUEY0TFhIUDdHWklENDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MTIxMTMxNTMyMTk2MDY2MDk3LCJhYiI6MH0.png"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_8
    const-string v1, "zh-CN"

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_a

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlgyUlM1V1NDRExWTkhIRlZDVTVPSVBQSVZHRkVCRjA3IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NTc5ODk1OTUxODY0ODQ5MjA1fQ.png"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_9
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik4zSkIyNUNVQjdWUlEyWEhSS1BCUFVHU1ZUSE42RTA2IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NTc5ODk2MDQ2MDUwMTYxNDQ5fQ.png"

    .line 90
    .line 91
    :cond_a
    return-object p0
.end method

.method public final o1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W8:I

    .line 17
    .line 18
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s0(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 26
    .line 27
    sget v2, Ll/jbc0;->k:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 33
    .line 34
    sget v2, Ll/jbc0;->g:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 42
    .line 43
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v1, v2, v3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/qol0;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/qol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 86
    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->B9:I

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->w0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x500

    .line 12
    .line 13
    if-gt v0, v1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/high16 v1, 0x43910000    # 290.0f

    .line 22
    .line 23
    invoke-static {}, Ll/vnb;->m1()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    mul-float/2addr v2, v1

    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e:Lv/VFrame;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v1, 0x43a58000    # 331.0f

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/vnb;->m1()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    mul-float/2addr v2, v1

    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->A:I

    .line 61
    .line 62
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget v2, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->B:I

    .line 71
    .line 72
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->h:Lv/VDraweeView;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {}, Ll/vnb;->m1()F

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    const/high16 v4, 0x433e0000    # 190.0f

    .line 85
    .line 86
    mul-float/2addr v3, v4

    .line 87
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->h:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {}, Ll/vnb;->m1()F

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    mul-float/2addr v3, v4

    .line 104
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n:Lv/VFrame;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n:Lv/VFrame;

    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 135
    .line 136
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->c:Lv/VText;

    .line 143
    .line 144
    invoke-static {}, Ll/bnl0;->w0()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    const/16 v2, 0x3c0

    .line 149
    .line 150
    if-ge v1, v2, :cond_0

    .line 151
    .line 152
    const/high16 v1, 0x41800000    # 16.0f

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_0
    const/high16 v1, 0x41900000    # 18.0f

    .line 156
    .line 157
    :goto_0
    const/4 v3, 0x2

    .line 158
    invoke-virtual {v0, v3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->t:Lv/VText;

    .line 162
    .line 163
    invoke-static {}, Ll/bnl0;->w0()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-ge v1, v2, :cond_1

    .line 168
    .line 169
    const/high16 v1, 0x41400000    # 12.0f

    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_1
    const/high16 v1, 0x41500000    # 13.0f

    .line 173
    .line 174
    :goto_1
    invoke-virtual {v0, v3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->o:Lv/VFrame;

    .line 178
    .line 179
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-static {}, Ll/vnb;->m1()F

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    const/high16 v2, 0x42b80000    # 92.0f

    .line 188
    .line 189
    mul-float/2addr v1, v2

    .line 190
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->o:Lv/VFrame;

    .line 197
    .line 198
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {}, Ll/vnb;->m1()F

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    const/high16 v2, 0x42c40000    # 98.0f

    .line 207
    .line 208
    mul-float/2addr v1, v2

    .line 209
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->p:Lv/AutoVDraweeView;

    .line 216
    .line 217
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-static {}, Ll/vnb;->m1()F

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    const/high16 v2, 0x42780000    # 62.0f

    .line 226
    .line 227
    mul-float/2addr v1, v2

    .line 228
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->p:Lv/AutoVDraweeView;

    .line 235
    .line 236
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-static {}, Ll/vnb;->m1()F

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    mul-float/2addr v1, v2

    .line 245
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 250
    .line 251
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->r:Lv/VImage;

    .line 252
    .line 253
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {}, Ll/vnb;->m1()F

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    const/high16 v2, 0x41600000    # 14.0f

    .line 262
    .line 263
    mul-float/2addr v1, v2

    .line 264
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 269
    .line 270
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->r:Lv/VImage;

    .line 271
    .line 272
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    sget v1, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->C:I

    .line 277
    .line 278
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 279
    .line 280
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q:Lv/VLinear;

    .line 281
    .line 282
    const/4 v0, 0x0

    .line 283
    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 284
    .line 285
    .line 286
    :cond_2
    return-void
.end method

.method public final p0(Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik1SRlZXR0pCRk0yRDREVVIyN0taTlVWMlg2RFpZNDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDY5MzMxMzkxNTAxMDk5LCJhYiI6MH0.png"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik5BSVlETVlYSUtKUkJDREw3M1BVN1pDWURMM0pXQzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTgyNTg3MDM4MjI2MDAxNzQ3LCJhYiI6MH0.png"

    .line 7
    .line 8
    :goto_0
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "ko-KR"

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IktSREpJSUpISEpQVkdMVjZVVFlIUlpEMjRPSzdFSDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDc4MTI3NDg0NTI5NDc1LCJhYiI6MH0.png"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkYyVldYVDdZQ09WUlE0TU1OTUw3T1NLUllBWDdXUjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTY0NTcyNjM5NzE2NTE5NzQ5LCJhYiI6MH0.png"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string v1, "ja-JP"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVYVjJPVFBJNDZIVDZLVlJIN002QTRKRUxJU0ZGQTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDc4MTI3NDg0NTI5NDgzLCJhYiI6MH0.png"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZVQlUyUzJEWDVYVjRHTldCN0Q0R1M1QVlGV1U2UDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1Mjk0MzU2NjYyMDc0Mjg5OTk3LCJhYiI6MH0.png"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    const-string v1, "id-ID"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVBWTVYNFhJWUhTUjRXTVFINklPMllPVzJKQUpISzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDc4MTI3NDg0NTI5NTA3LCJhYiI6MH0.png"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_5
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVWVkVVWkU3VUhCWk02TkFDRkFFRkFPTExJVE1VWjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1Mjc2MzQyMjYzNTY0ODA4MDQzLCJhYiI6MH0.png"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_6
    const-string v1, "zh-TW"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_8

    .line 67
    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJQRFQ1UkVQVUZMVjM0VE9BS1RFSTYzVkVLUkozVjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDc4MTI3NDg0NTIzMzE3LCJhYiI6MH0.png"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_7
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFSVzRMWkxBTFpLWERBQVlZUzVCUkhPU1FKUTVCSTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTgyNTg3MDM4MjI2MDAxNzUzLCJhYiI6MH0.png"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_8
    const-string v1, "zh-CN"

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_a

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlZUVlM3QjdGSlpUVTdUVEJISEwyVVkzVUhOWk02MzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTcyNDY5MzMxMzkxNTA3MzAzLCJhYiI6MH0.png"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_9
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IksyRjQ0Nk5XWkU2UzNMTkZWQkE2Uk9FN0RQS1hESDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTgyNTg3MDM4MjI2MDAxNzY5LCJhYiI6MH0.png"

    .line 90
    .line 91
    :cond_a
    return-object p0
.end method

.method public p1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g:Lv/VRelative;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->s:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$b;->a:[I

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->y:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    aget v0, v0, v1

    .line 26
    .line 27
    packed-switch v0, :pswitch_data_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->h1()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->X0()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->l1()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->k1()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->j1()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->Y0()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :pswitch_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->U0()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->e1()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :pswitch_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->g1()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :pswitch_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->f1()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->d1()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->W0()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_c
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->S0()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_d
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->a1()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :pswitch_e
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->Z0()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_f
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->V0()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :pswitch_10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->o1()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->n1()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :pswitch_12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->m1()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :pswitch_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->y:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->T0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final q0(Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpLRUJHS1JBSTJRNk00N0pPQTc3TzdDNEhYQ05SVDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzU5NzczODEyNjYzNTg5LCJhYiI6MH0.png"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhMWkhRU0MyNlFBVUEySzI2U05RVVU3R0FXUEJRWDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzU5ODQyNTMyMTQzOTI1LCJhYiI6MH0.png"

    .line 7
    .line 8
    :goto_0
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "ko-KR"

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldOUkJDU0hMVkRMNlhHWDM0SllGWDRFSVlHT1BZQzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5Mzc3MzY1OTk4NzA4MDIxLCJhYiI6MH0.png"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilc1TDVHSlRQVjJJQkZPMlBEQUVaWUFJWldEVFVVQTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzU5NzczODEyNjYzNjA1LCJhYiI6MH0.png"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string v1, "ja-JP"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik00RU9QVTRTS0hVM001TDdVUVYyQU1RTzVKVFJZRTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5Mzc3MzY1OTk4NzA4MDIxLCJhYiI6MH0.png"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik5UT0xCNVQyM0Y3SUdYSlJRTURKV09RWVlSS0oyUDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzY4NTY5OTA1Njg5Mzk3LCJhYiI6MH0.png"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    const-string v1, "id-ID"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdTQkdaVUxJM0hNVTNJS1Q0R0VGTjZGVEhRMlIySzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5Mzc3MzMxNjM4OTczNzQ5LCJhYiI6MH0.png"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_5
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLNUlUTEdCSTczVTc2SU5ZVFdUU1FYTlVTNFYyNTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5Mzc3NTM3Nzk3NDAzOTU3LCJhYiI6MH0.png"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_6
    const-string v1, "zh-TW"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_8

    .line 67
    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlZESE5ZR05MTUVIS1ZRQjQ0SlhYVU5WUDVaUTJUNDA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzY4NTY5OTA0NjQxMzMzLCJhYiI6MH0.png"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_7
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdOUkhOQjI1NUZONlcyV1NQUktEMkRUUklNS1lZMzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5MzY4NTY5OTA0NjQxMzMzLCJhYiI6MH0.png"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_8
    const-string v1, "zh-CN"

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_a

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFGVkdVSUdVVjIyN1c0RDZVR0FUVjRURkZBUks1UiIsInciOjk5MywiaCI6ODcwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzA5OTM3NzM2NTk5ODcwODAwNSwiYWIiOjB9.png"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_9
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilg0Ulc3SEdIRjJPMkhFNlNGRUpNN0I1NUNHVkhGUjA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMDk5Mzc3MzY1OTk4NzA3NDkzLCJhYiI6MH0.png"

    .line 90
    .line 91
    :cond_a
    return-object p0
.end method

.method public final q1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v1, Ll/jbc0;->k:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->f:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final r0(Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNHUFg0V1VLNVhaVVVFWldSN0FSNFRMMzVMWjZaSzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzM4Njc2NTIwMDgyMDI3MzY3LCJhYiI6MH0.png"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldUVExPTkdFM1ZUSldOSU5QSldVTFFRUTZYS040NjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTY3NTQ3LCJhYiI6MH0.png"

    .line 7
    .line 8
    :goto_0
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "ko-KR"

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhOTFpaSjJEV0NHSzc3UkpFVkZXTEo2U1pFQ1dHNTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzM4Njc2NTIwMDgwOTc4NzU5LCJhYiI6MH0.png"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRPN0EyR0VLSlZKV1ZDVlhKN1BGSFpGT04zTlBGQTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTcyNjU1LCJhYiI6MH0.png"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string v1, "ja-JP"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdKUkFDN1hCSERMUTVSUVFIN0pVTVBRWTRLWjMyTzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzM4Njc2NTIwMDgyMDI3MzUxLCJhYiI6MH0.png"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ijc3SVc0Uk5EVEZWRzVLRTVVVVRRQU5PUTZIMlg0TTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTY4NTU1LCJhYiI6MH0.png"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    const-string v1, "id-ID"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNJNkZJNzdHMk43SEFIS0ZPSlpFV0ZQWkY1NENHQzA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzM4Njc2NTIwMDgwOTc4NzkxLCJhYiI6MH0.png"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_5
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk1UzNLUlpSWUdWVkJGVDMzMlA3VktHNlpQTkRUQjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTY3NTc5LCJhYiI6MH0v.png"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_6
    const-string v1, "zh-TW"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_8

    .line 67
    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJVVFNVR05HUE9BWTZWNEVUMjdMVE1JVVNGTlZNTjA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NzM4Njc2NTIwMDgyMDI3ODU5LCJhYiI6MH0.png"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_7
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkM1Vlk2RjJCUjVHRjJHQk1UQkdWVEJQNDJDVFNMTTA1IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTY4NTQ3LCJhYiI6MH0.png"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_8
    const-string v1, "zh-CN"

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_a

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhGNUtGUEtNNTVNSERRWkFISkw2R0VTTUdBQkpHWSIsInciOjk5MywiaCI6ODcwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzczODY3NjUyMDA4MjAyNzg2MywiYWIiOjB9.png"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_9
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpVRDJNRldEQjRWREdLWUFWVDdZWEJYSkRBV0RZMjA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg5NDQwOTcxNDA3OTY4NTUxLCJhYiI6MH0.png"

    .line 90
    .line 91
    :cond_a
    return-object p0
.end method

.method public t0(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/result/a$f;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->w:Lcom/p1/mobile/putong/core/ui/result/a$f;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->y:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->z:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->v:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->h:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->j:Lv/VText;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic v0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget p2, Ll/jbc0;->H8:I

    .line 2
    .line 3
    sget v0, Ll/jbc0;->G8:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->f:Lv/VDraweeView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p2, v0

    .line 11
    :goto_0
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/c17;->u0()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->o0(Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {}, Ll/c17;->u0()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFSVFpFSkVITzNZVDNVUTdBSUxZSVJYMzNIN0tCTiIsInciOjk5MywiaCI6ODcwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzU0NTMwNDAwNDQzODQ4Mzc2NSwiYWIiOjB9.png"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVFUkNYRzJESUFORkZIWDNDUTZFM1FIWFhVWllITjA0IiwidyI6OTkzLCJoIjo4NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTQ1MzA0MDk4NjIzNzk2MDA5LCJhYiI6MH0.png"

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lb()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->p0(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->q1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->p:Lv/AutoVDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
