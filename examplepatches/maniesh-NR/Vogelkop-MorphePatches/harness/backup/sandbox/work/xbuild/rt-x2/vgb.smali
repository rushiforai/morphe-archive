.class public abstract Lvgb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lyp8;

.field public static final b:Lgfc;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const v0, 0x3e4ccccd    # 0.2f

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v1, v2}, Lvtp;->z(FFFF)V

    const v3, 0x3f9ae148    # 1.21f

    const v4, 0x3e6147ae    # 0.22f

    const v5, 0x3ec28f5c    # 0.38f

    invoke-static {v5, v3, v4, v2}, Lvtp;->z(FFFF)V

    const v3, 0x3eae147b    # 0.34f

    const v4, 0x3f4ccccd    # 0.8f

    invoke-static {v3, v4, v3, v2}, Lvtp;->z(FFFF)V

    const v3, 0x3e99999a    # 0.3f

    invoke-static {v3, v1, v2, v2}, Lvtp;->z(FFFF)V

    new-instance v5, Landroid/view/animation/AccelerateInterpolator;

    new-instance v5, Landroid/view/animation/DecelerateInterpolator;

    new-instance v5, Lxp8;

    const v5, 0x3e19999a    # 0.15f

    invoke-static {v3, v1, v4, v5}, Lvtp;->z(FFFF)V

    const v3, 0x3f333333    # 0.7f

    const v4, 0x3dcccccd    # 0.1f

    const v5, 0x3d4ccccd    # 0.05f

    invoke-static {v5, v3, v4, v2}, Lvtp;->z(FFFF)V

    const v3, 0x3ecccccd    # 0.4f

    invoke-static {v3, v1, v2, v2}, Lvtp;->z(FFFF)V

    invoke-static {v1, v1, v0, v2}, Lvtp;->z(FFFF)V

    new-instance v3, Lyp8;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    sput-object v3, Lvgb;->a:Lyp8;

    new-instance v3, Lzp8;

    new-instance v3, Lgfc;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    sput-object v3, Lvgb;->b:Lgfc;

    new-instance v3, Landroid/view/animation/LinearInterpolator;

    new-instance v3, Landroid/view/animation/OvershootInterpolator;

    const v3, -0x415c28f6    # -0.32f

    invoke-static {v2, v3, v2, v2}, Lvtp;->z(FFFF)V

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v0, v1, v1, v2}, Lvtp;->z(FFFF)V

    return-void
.end method
