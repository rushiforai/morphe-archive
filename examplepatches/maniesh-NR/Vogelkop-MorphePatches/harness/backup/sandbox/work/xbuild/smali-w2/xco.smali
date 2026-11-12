.class public final Lxco;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lxco;


# instance fields
.field public final a:Ljava/math/BigDecimal;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lxco;

    const-wide/high16 v1, 0x405b000000000000L    # 108.0

    invoke-direct {v0, v1, v2}, Lxco;-><init>(D)V

    new-instance v0, Lxco;

    const-wide v1, 0x4059800000000000L    # 102.0

    invoke-direct {v0, v1, v2}, Lxco;-><init>(D)V

    new-instance v0, Lxco;

    const-wide/high16 v1, 0x4058000000000000L    # 96.0

    invoke-direct {v0, v1, v2}, Lxco;-><init>(D)V

    new-instance v0, Lxco;

    const-wide v1, 0x4056b554c985f06fL    # 90.8333

    invoke-direct {v0, v1, v2}, Lxco;-><init>(D)V

    sput-object v0, Lxco;->b:Lxco;

    return-void
.end method

.method public constructor <init>(D)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, p2}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object p1

    iput-object p1, p0, Lxco;->a:Ljava/math/BigDecimal;

    return-void
.end method
