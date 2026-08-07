.class public final synthetic Ll/h88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/Set;

.field public final synthetic e:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lorg/json/JSONObject;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h88;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/h88;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/h88;->c:Ljava/util/List;

    iput-object p4, p0, Ll/h88;->d:Ljava/util/Set;

    iput-object p5, p0, Ll/h88;->e:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h88;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/h88;->b:Lorg/json/JSONObject;

    iget-object v2, p0, Ll/h88;->c:Ljava/util/List;

    iget-object v3, p0, Ll/h88;->d:Ljava/util/Set;

    iget-object p0, p0, Ll/h88;->e:Ljava/util/Set;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->W6(Lcom/p1/mobile/putong/core/api/g;Lorg/json/JSONObject;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
