.class public final synthetic Ll/mji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wji0;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ll/xc00;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Lcom/p1/mobile/putong/data/VerificationToken;


# direct methods
.method public synthetic constructor <init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mji0;->a:Ll/wji0;

    iput-object p2, p0, Ll/mji0;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/mji0;->c:Ll/xc00;

    iput-object p4, p0, Ll/mji0;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/mji0;->e:Lcom/p1/mobile/putong/data/VerificationToken;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mji0;->a:Ll/wji0;

    iget-object v1, p0, Ll/mji0;->b:Lorg/json/JSONObject;

    iget-object v2, p0, Ll/mji0;->c:Ll/xc00;

    iget-object v3, p0, Ll/mji0;->d:Lorg/json/JSONObject;

    iget-object v4, p0, Ll/mji0;->e:Lcom/p1/mobile/putong/data/VerificationToken;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/wji0;->L(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/Throwable;)V

    return-void
.end method
