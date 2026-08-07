.class final Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;
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
        "Ll/nhi;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0003\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0001\u0010\u0002"
    }
    d2 = {
        "Ll/nhi;",
        "invoke",
        "()Ll/nhi;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;

    invoke-direct {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;-><init>()V

    sput-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;

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

    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$verifyModule$2;->invoke()Ll/nhi;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ll/nhi;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/nhi;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/nhi;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
