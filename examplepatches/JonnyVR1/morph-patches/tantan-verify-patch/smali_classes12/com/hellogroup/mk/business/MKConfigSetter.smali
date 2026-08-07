.class public final Lcom/hellogroup/mk/business/MKConfigSetter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/MKConfigSetter$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/MKConfigSetter;",
        "",
        "()V",
        "Companion",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

.field private static a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static b:Ll/ojw;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a()Ll/ojw;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->b:Ll/ojw;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic c(Ll/ojw;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/hellogroup/mk/business/MKConfigSetter;->b:Ll/ojw;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic d(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/hellogroup/mk/business/MKConfigSetter;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static final e()Ll/ojw;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->b:Ll/ojw;

    .line 2
    .line 3
    return-object v0
.end method
