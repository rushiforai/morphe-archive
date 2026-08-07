.class public final synthetic Ll/ml7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ml7;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/ml7;->b:Z

    iput-object p3, p0, Ll/ml7;->c:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ml7;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/ml7;->b:Z

    iget-object p0, p0, Ll/ml7;->c:Lorg/json/JSONObject;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/e;->f4(Ljava/lang/String;ZLorg/json/JSONObject;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
