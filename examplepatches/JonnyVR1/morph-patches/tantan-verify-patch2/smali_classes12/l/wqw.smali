.class public final synthetic Ll/wqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/immomo/mwc/sdk/MWCEngine;

.field public final synthetic b:Lcom/immomo/mwc/sdk/EventType;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Ll/z84;


# direct methods
.method public synthetic constructor <init>(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqw;->a:Lcom/immomo/mwc/sdk/MWCEngine;

    iput-object p2, p0, Ll/wqw;->b:Lcom/immomo/mwc/sdk/EventType;

    iput-object p3, p0, Ll/wqw;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/wqw;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/wqw;->e:Ll/z84;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wqw;->a:Lcom/immomo/mwc/sdk/MWCEngine;

    iget-object v1, p0, Ll/wqw;->b:Lcom/immomo/mwc/sdk/EventType;

    iget-object v2, p0, Ll/wqw;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/wqw;->d:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/wqw;->e:Ll/z84;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->e(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V

    return-void
.end method
