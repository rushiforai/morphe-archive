.class public final synthetic Ll/pgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/qgi0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Lorg/json/JSONObject;

.field public final synthetic e:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/qgi0;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pgi0;->a:Ll/qgi0;

    iput-object p2, p0, Ll/pgi0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pgi0;->c:Lorg/json/JSONObject;

    iput-object p4, p0, Ll/pgi0;->d:Lorg/json/JSONObject;

    iput-object p5, p0, Ll/pgi0;->e:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pgi0;->a:Ll/qgi0;

    iget-object v1, p0, Ll/pgi0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pgi0;->c:Lorg/json/JSONObject;

    iget-object v3, p0, Ll/pgi0;->d:Lorg/json/JSONObject;

    iget-object v4, p0, Ll/pgi0;->e:Ljava/io/File;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v6, p2

    check-cast v6, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v6}, Ll/qgi0;->K(Ll/qgi0;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/io/File;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
