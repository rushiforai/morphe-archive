.class final Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$notifyStatusChange$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->v(Ll/zgi;)V
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
.field final synthetic $info:Ll/zgi;


# direct methods
.method public constructor <init>(Ll/zgi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$notifyStatusChange$1;->$info:Ll/zgi;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 33
    check-cast p1, Ll/ehi;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$notifyStatusChange$1;->invoke(Ll/ehi;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/ehi;)V
    .locals 13
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$notifyStatusChange$1;->$info:Ll/zgi;

    .line 5
    .line 6
    const/16 v11, 0x1ff

    .line 7
    .line 8
    const/4 v12, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v8, 0x0

    .line 17
    const/4 v9, 0x0

    .line 18
    const/4 v10, 0x0

    .line 19
    invoke-static/range {v0 .. v12}, Ll/zgi;->c(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/hellogroup/fep/feppkg/model/FepPackageConfig;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;Lorg/json/JSONObject;Ll/ngi;ILjava/lang/Object;)Ll/zgi;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$notifyStatusChange$1;->$info:Ll/zgi;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/zgi;->m()Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p1, v0, p0}, Ll/ehi;->d(Ll/zgi;Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
