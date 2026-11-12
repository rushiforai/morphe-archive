.class public final Ltjh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lnx1;


# instance fields
.field public final a:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Ltjh;->b:Lnx1;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "rate-us"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ltjh;->a:Lb59;

    return-void
.end method

.method public static a(Landroid/content/Context;)Ltjh;
    .registers 2

    sget-object v0, Ltjh;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltjh;

    return-object p0
.end method
