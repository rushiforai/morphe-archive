.class public final synthetic Ll/us8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dt8;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/dt8;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/us8;->a:Ll/dt8;

    iput-object p2, p0, Ll/us8;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/us8;->a:Ll/dt8;

    iget-object p0, p0, Ll/us8;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Ll/dt8;->i3(Ll/dt8;Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
