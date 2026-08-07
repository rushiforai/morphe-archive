.class public final synthetic Ll/hv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hv8;->a:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hv8;->a:Lorg/json/JSONArray;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/j;->F4(Lorg/json/JSONArray;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
