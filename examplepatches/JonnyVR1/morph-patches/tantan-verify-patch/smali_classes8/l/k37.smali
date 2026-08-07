.class public final synthetic Ll/k37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k37;->a:Ll/xc00;

    iput-object p2, p0, Ll/k37;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/k37;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/k37;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/k37;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k37;->a:Ll/xc00;

    iget-object v1, p0, Ll/k37;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/k37;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/k37;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/k37;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    move-object v5, p1

    check-cast v5, Lkotlin/Unit;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->A0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lkotlin/Unit;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
