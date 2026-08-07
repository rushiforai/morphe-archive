.class final Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/log/global/MKGlobalLog;-><init>()V
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
.field public static final INSTANCE:Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;

    invoke-direct {v0}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;-><init>()V

    sput-object v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;->INSTANCE:Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;

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
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$isAndroid302LogOpen$2;->invoke()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/rs8;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-lez p0, :cond_0

    .line 7
    .line 8
    new-instance v1, Lkotlin/ranges/IntRange;

    .line 9
    .line 10
    const/16 v2, 0x64

    .line 11
    .line 12
    invoke-direct {v1, v0, v2}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 13
    .line 14
    .line 15
    sget-object v2, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    .line 16
    .line 17
    invoke-static {v1, v2}, Lkotlin/ranges/a;->k(Lkotlin/ranges/IntRange;Lkotlin/random/Random;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-gt v1, p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method
