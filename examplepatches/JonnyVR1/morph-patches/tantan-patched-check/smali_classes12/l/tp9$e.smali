.class final Ll/tp9$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tp9;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/tp9$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/tp9$e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tp9$e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tp9$e;->INSTANCE:Ll/tp9$e;

    .line 7
    .line 8
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


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/fdt/FDTManager;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
