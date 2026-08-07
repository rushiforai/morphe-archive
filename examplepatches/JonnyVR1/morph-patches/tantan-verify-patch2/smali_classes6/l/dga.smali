.class public final synthetic Ll/dga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dga;->a:Ll/jka;

    iput-object p2, p0, Ll/dga;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/dga;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dga;->a:Ll/jka;

    iget-object v1, p0, Ll/dga;->b:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/dga;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/jka;->y2(Ll/jka;Lorg/json/JSONObject;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
