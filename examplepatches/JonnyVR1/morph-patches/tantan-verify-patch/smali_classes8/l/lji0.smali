.class public final synthetic Ll/lji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wji0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic e:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lji0;->a:Ll/wji0;

    iput-object p2, p0, Ll/lji0;->b:Ll/xc00;

    iput-object p3, p0, Ll/lji0;->c:Lorg/json/JSONObject;

    iput-object p4, p0, Ll/lji0;->d:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p5, p0, Ll/lji0;->e:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lji0;->a:Ll/wji0;

    iget-object v1, p0, Ll/lji0;->b:Ll/xc00;

    iget-object v2, p0, Ll/lji0;->c:Lorg/json/JSONObject;

    iget-object v3, p0, Ll/lji0;->d:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object v4, p0, Ll/lji0;->e:Lorg/json/JSONObject;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;

    invoke-static/range {v0 .. v5}, Ll/wji0;->W(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;)V

    return-void
.end method
