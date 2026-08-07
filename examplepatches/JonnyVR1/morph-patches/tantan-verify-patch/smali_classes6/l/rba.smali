.class public final synthetic Ll/rba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rba;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/rba;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rba;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/rba;->d:Z

    iput-object p5, p0, Ll/rba;->e:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rba;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/rba;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/rba;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/rba;->d:Z

    iget-object p0, p0, Ll/rba;->e:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, p0}, Ll/jka;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
