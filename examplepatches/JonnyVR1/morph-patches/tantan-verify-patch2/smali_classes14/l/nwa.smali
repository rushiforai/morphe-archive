.class public final synthetic Ll/nwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/AuthData;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/AuthData;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nwa;->a:Lcom/p1/mobile/putong/data/AuthData;

    iput-object p2, p0, Ll/nwa;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nwa;->a:Lcom/p1/mobile/putong/data/AuthData;

    iget-object p0, p0, Ll/nwa;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Ll/pwa;->c3(Lcom/p1/mobile/putong/data/AuthData;Lorg/json/JSONObject;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
