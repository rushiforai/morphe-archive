.class public final synthetic Ll/y49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/e59;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/e59;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y49;->a:Ll/e59;

    iput-object p2, p0, Ll/y49;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/y49;->c:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y49;->a:Ll/e59;

    iget-object v1, p0, Ll/y49;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/y49;->c:Lorg/json/JSONObject;

    invoke-static {v0, v1, p0}, Ll/e59;->f3(Ll/e59;Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
