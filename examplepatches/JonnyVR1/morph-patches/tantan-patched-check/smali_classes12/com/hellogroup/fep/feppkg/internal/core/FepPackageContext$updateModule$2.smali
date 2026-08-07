.class final Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;",
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
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;",
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
.field public static final INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;

    invoke-direct {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;-><init>()V

    sput-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$updateModule$2;->invoke()Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    move-result-object p0

    return-object p0
.end method
