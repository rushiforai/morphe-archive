.class public final synthetic Ll/wpb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/lqb;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/lqb;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wpb;->a:Ll/lqb;

    iput-object p2, p0, Ll/wpb;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wpb;->a:Ll/lqb;

    iget-object p0, p0, Ll/wpb;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Ll/lqb;->V3(Ll/lqb;Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
