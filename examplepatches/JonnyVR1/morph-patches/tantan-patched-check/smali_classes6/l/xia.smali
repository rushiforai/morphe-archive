.class public final synthetic Ll/xia;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z

.field public final synthetic f:Lorg/json/JSONObject;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xia;->a:Ll/jka;

    iput-object p2, p0, Ll/xia;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/xia;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/xia;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/xia;->e:Z

    iput-object p6, p0, Ll/xia;->f:Lorg/json/JSONObject;

    iput p7, p0, Ll/xia;->g:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xia;->a:Ll/jka;

    iget-object v1, p0, Ll/xia;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/xia;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/xia;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/xia;->e:Z

    iget-object v5, p0, Ll/xia;->f:Lorg/json/JSONObject;

    iget v6, p0, Ll/xia;->g:I

    invoke-static/range {v0 .. v6}, Ll/jka;->a3(Ll/jka;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
