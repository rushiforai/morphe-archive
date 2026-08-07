.class final Ll/tp9$c;
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


# instance fields
.field final synthetic a:Ll/tp9;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/tp9;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tp9$c;->a:Ll/tp9;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tp9$c;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 2
    .line 3
    new-instance v1, Ll/tp9$c$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tp9$c$a;-><init>(Ll/tp9$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/fdt/FDTManager;->c(Lcom/hellogroup/mk/fdt/FDTManager$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
