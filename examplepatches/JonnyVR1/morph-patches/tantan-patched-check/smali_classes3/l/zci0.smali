.class public final synthetic Ll/zci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zci0;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/zci0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zci0;->c:Lorg/json/JSONObject;

    iput-object p4, p0, Ll/zci0;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/zci0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zci0;->a:Lorg/json/JSONObject;

    iget-object v1, p0, Ll/zci0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/zci0;->c:Lorg/json/JSONObject;

    iget-object v3, p0, Ll/zci0;->d:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/zci0;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/adi0;->L(Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
