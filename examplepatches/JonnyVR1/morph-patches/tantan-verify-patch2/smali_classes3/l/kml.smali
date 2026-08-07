.class public final synthetic Ll/kml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Lorg/json/JSONObject;

.field public final synthetic f:Lorg/json/JSONObject;

.field public final synthetic g:Lorg/json/JSONObject;

.field public final synthetic h:J

.field public final synthetic i:Ll/aqq;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;JLl/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kml;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    iput-object p2, p0, Ll/kml;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kml;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/kml;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/kml;->e:Lorg/json/JSONObject;

    iput-object p6, p0, Ll/kml;->f:Lorg/json/JSONObject;

    iput-object p7, p0, Ll/kml;->g:Lorg/json/JSONObject;

    iput-wide p8, p0, Ll/kml;->h:J

    iput-object p10, p0, Ll/kml;->i:Ll/aqq;

    iput-object p11, p0, Ll/kml;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/kml;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    iget-object v1, p0, Ll/kml;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/kml;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/kml;->d:Lorg/json/JSONObject;

    iget-object v4, p0, Ll/kml;->e:Lorg/json/JSONObject;

    iget-object v5, p0, Ll/kml;->f:Lorg/json/JSONObject;

    iget-object v6, p0, Ll/kml;->g:Lorg/json/JSONObject;

    iget-wide v7, p0, Ll/kml;->h:J

    iget-object v9, p0, Ll/kml;->i:Ll/aqq;

    iget-object v10, p0, Ll/kml;->j:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;->c(Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;JLl/aqq;Ljava/lang/String;)V

    return-void
.end method
