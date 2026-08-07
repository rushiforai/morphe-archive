.class public final synthetic Ll/ogi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/qgi0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;

.field public final synthetic d:Z

.field public final synthetic e:Lorg/json/JSONObject;

.field public final synthetic f:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/qgi0;Ljava/lang/String;Lorg/json/JSONObject;ZLorg/json/JSONObject;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ogi0;->a:Ll/qgi0;

    iput-object p2, p0, Ll/ogi0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ogi0;->c:Lorg/json/JSONObject;

    iput-boolean p4, p0, Ll/ogi0;->d:Z

    iput-object p5, p0, Ll/ogi0;->e:Lorg/json/JSONObject;

    iput-object p6, p0, Ll/ogi0;->f:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ogi0;->a:Ll/qgi0;

    iget-object v1, p0, Ll/ogi0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ogi0;->c:Lorg/json/JSONObject;

    iget-boolean v3, p0, Ll/ogi0;->d:Z

    iget-object v4, p0, Ll/ogi0;->e:Lorg/json/JSONObject;

    iget-object v5, p0, Ll/ogi0;->f:Ljava/io/File;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v7, p2

    check-cast v7, Ljava/io/File;

    invoke-static/range {v0 .. v7}, Ll/qgi0;->L(Ll/qgi0;Ljava/lang/String;Lorg/json/JSONObject;ZLorg/json/JSONObject;Ljava/io/File;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
