.class public final synthetic Ll/o89;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/m;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/api/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o89;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/o89;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/o89;->c:Lcom/p1/mobile/putong/core/api/m;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o89;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/o89;->b:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/o89;->c:Lcom/p1/mobile/putong/core/api/m;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/m;->k3(Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/api/m;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
