.class final Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;->a(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;Ll/ngi;Lkotlin/jvm/functions/Function2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ll/ehi;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/ehi;",
        "observer",
        "",
        "invoke",
        "(Ll/ehi;)V",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $bid:Ljava/lang/String;

.field final synthetic $checkResult:Ll/tgi;

.field final synthetic $params:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$bid:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$checkResult:Ll/tgi;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$params:Ljava/util/Map;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 38
    check-cast p1, Ll/ehi;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->invoke(Ll/ehi;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/ehi;)V
    .locals 17
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$bid:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, v0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$checkResult:Ll/tgi;

    .line 9
    .line 10
    const/16 v15, 0x3ff

    .line 11
    .line 12
    const/16 v16, 0x0

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    const-wide/16 v6, 0x0

    .line 18
    .line 19
    const/4 v8, 0x0

    .line 20
    const/4 v9, 0x0

    .line 21
    const/4 v10, 0x0

    .line 22
    const/4 v11, 0x0

    .line 23
    const/4 v12, 0x0

    .line 24
    const/4 v13, 0x0

    .line 25
    const/4 v14, 0x0

    .line 26
    invoke-static/range {v2 .. v16}, Ll/tgi;->b(Ll/tgi;Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;IILjava/util/Map;Ljava/util/Map;Lorg/json/JSONObject;ILjava/lang/Object;)Ll/tgi;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v0, v0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;->$params:Ljava/util/Map;

    .line 31
    .line 32
    move-object/from16 v3, p1

    .line 33
    .line 34
    invoke-interface {v3, v1, v2, v0}, Ll/ehi;->e(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
