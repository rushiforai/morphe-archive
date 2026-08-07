.class public final synthetic Ll/ofb;
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

    iput-object p1, p0, Ll/ofb;->a:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofb;->a:Lorg/json/JSONObject;

    invoke-static {p0}, Ll/dkb;->G6(Lorg/json/JSONObject;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
