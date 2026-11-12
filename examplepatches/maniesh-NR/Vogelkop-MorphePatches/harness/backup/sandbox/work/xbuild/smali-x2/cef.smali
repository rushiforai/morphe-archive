.class public final Lcef;
.super Lz43;
.source "SourceFile"


# static fields
.field public static final j:Lcef;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcef;

    const-string v1, "https://ofa-o-sub.osp.opera.software/v1/binary"

    const-string v2, "68UQR0w0qJyMAeV7bEgHsxYlbk3dVsAa:"

    const-string v3, "onboarding"

    invoke-direct {v0, v3, v1, v2}, Lz43;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcef;->j:Lcef;

    return-void
.end method


# virtual methods
.method public final r(Landroid/content/Context;)Lzsf;
    .registers 8

    iget-object p0, p0, Lz43;->e:Ljava/lang/Object;

    check-cast p0, Lumi;

    if-eqz p0, :cond_8

    :goto_6
    move-object v2, p0

    goto :goto_a

    :cond_8
    const/4 p0, 0x0

    goto :goto_6

    :goto_a
    new-instance v0, Lzsf;

    new-instance v5, Lc5o;

    const/16 p0, 0x1b

    invoke-direct {v5, p1, p0}, Lc5o;-><init>(Landroid/content/Context;B)V

    const-string v3, "osp_onboarding_data"

    const-string v4, "osp_onboarding_storage"

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lzsf;-><init>(Landroid/content/Context;Lumi;Ljava/lang/String;Ljava/lang/String;Lssf;)V

    return-object v0
.end method
