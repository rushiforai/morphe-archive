.class public final synthetic Ll/b88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b88;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/b88;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b88;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/b88;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->T9(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
