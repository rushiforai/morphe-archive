.class final Ll/tp9$d;
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


# direct methods
.method public constructor <init>(Ll/tp9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tp9$d;->a:Ll/tp9;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tp9$d;->a:Ll/tp9;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v1, p0, Landroid/app/Activity;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Landroid/app/Activity;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/fdt/FDTManager;->l(Landroid/app/Activity;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
