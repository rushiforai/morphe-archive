.class public final synthetic Ll/yci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/adi0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Lorg/json/JSONObject;

.field public final synthetic f:Lorg/json/JSONObject;

.field public final synthetic g:Lorg/json/JSONObject;

.field public final synthetic h:J

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/adi0;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yci0;->a:Ll/adi0;

    iput-object p2, p0, Ll/yci0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yci0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/yci0;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/yci0;->e:Lorg/json/JSONObject;

    iput-object p6, p0, Ll/yci0;->f:Lorg/json/JSONObject;

    iput-object p7, p0, Ll/yci0;->g:Lorg/json/JSONObject;

    iput-wide p8, p0, Ll/yci0;->h:J

    iput-object p10, p0, Ll/yci0;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/yci0;->a:Ll/adi0;

    iget-object v1, p0, Ll/yci0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/yci0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/yci0;->d:Lorg/json/JSONObject;

    iget-object v4, p0, Ll/yci0;->e:Lorg/json/JSONObject;

    iget-object v5, p0, Ll/yci0;->f:Lorg/json/JSONObject;

    iget-object v6, p0, Ll/yci0;->g:Lorg/json/JSONObject;

    iget-wide v7, p0, Ll/yci0;->h:J

    iget-object v9, p0, Ll/yci0;->i:Ljava/lang/String;

    invoke-static/range {v0 .. v9}, Ll/adi0;->K(Ll/adi0;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;JLjava/lang/String;)V

    return-void
.end method
