.class public final synthetic Ll/jmq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lmq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lorg/json/JSONObject;

.field public final synthetic f:Lcom/quickjs/JSFunction;

.field public final synthetic g:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jmq;->a:Ll/lmq;

    iput-object p2, p0, Ll/jmq;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jmq;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/jmq;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/jmq;->e:Lorg/json/JSONObject;

    iput-object p6, p0, Ll/jmq;->f:Lcom/quickjs/JSFunction;

    iput-object p7, p0, Ll/jmq;->g:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    iput-object p8, p0, Ll/jmq;->h:Ljava/lang/String;

    iput-object p9, p0, Ll/jmq;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/jmq;->a:Ll/lmq;

    iget-object v1, p0, Ll/jmq;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/jmq;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/jmq;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/jmq;->e:Lorg/json/JSONObject;

    iget-object v5, p0, Ll/jmq;->f:Lcom/quickjs/JSFunction;

    iget-object v6, p0, Ll/jmq;->g:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    iget-object v7, p0, Ll/jmq;->h:Ljava/lang/String;

    iget-object v8, p0, Ll/jmq;->i:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Ll/lmq;->a(Ll/lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
