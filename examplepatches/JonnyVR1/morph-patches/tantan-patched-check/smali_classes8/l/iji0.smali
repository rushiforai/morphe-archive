.class public final synthetic Ll/iji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iji0;->a:Ll/xc00;

    iput-object p2, p0, Ll/iji0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/iji0;->c:Lorg/json/JSONObject;

    iput-object p4, p0, Ll/iji0;->d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iput-object p5, p0, Ll/iji0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/iji0;->a:Ll/xc00;

    iget-object v1, p0, Ll/iji0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/iji0;->c:Lorg/json/JSONObject;

    iget-object v3, p0, Ll/iji0;->d:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iget-object v4, p0, Ll/iji0;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lkotlin/Unit;

    invoke-static/range {v0 .. v5}, Ll/wji0;->P(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lkotlin/Unit;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
