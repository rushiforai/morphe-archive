.class final Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;

    invoke-direct {v0}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;-><init>()V

    sput-object v0, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;->INSTANCE:Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 26
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper$isAndroidDisableJsLocationReplace$2;->invoke()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/yfi;->h()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lkotlin/ranges/IntRange;

    .line 8
    .line 9
    const/16 v1, 0x64

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-direct {v0, v2, v1}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    .line 16
    .line 17
    invoke-static {v0, v1}, Lkotlin/ranges/a;->k(Lkotlin/ranges/IntRange;Lkotlin/random/Random;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gt v0, p0, :cond_0

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
