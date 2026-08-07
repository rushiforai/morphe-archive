.class public final synthetic Ll/f5a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f5a;->a:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5a;->a:Lorg/json/JSONObject;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/v;->E3(Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
