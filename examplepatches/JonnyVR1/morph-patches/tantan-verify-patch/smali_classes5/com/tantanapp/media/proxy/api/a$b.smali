.class public Lcom/tantanapp/media/proxy/api/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/proxy/api/a;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/proxy/api/a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/proxy/api/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p5, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 8
    .line 9
    invoke-static {p5}, Lcom/tantanapp/media/proxy/api/a;->d(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object p5

    .line 13
    invoke-interface {p5, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 17
    .line 18
    invoke-static {p1, p8}, Lcom/tantanapp/media/proxy/api/a;->e(Lcom/tantanapp/media/proxy/api/a;Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 22
    .line 23
    move-object p5, p4

    .line 24
    move-object p4, p3

    .line 25
    move p3, p2

    .line 26
    move-object p2, p0

    .line 27
    invoke-static/range {p2 .. p8}, Lcom/tantanapp/media/proxy/api/a;->g(Lcom/tantanapp/media/proxy/api/a;ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 7

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    iget v0, p7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonCode:I

    .line 8
    .line 9
    const/4 v1, 0x6

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->d(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0, p4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p4, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 22
    .line 23
    invoke-static {p4, p7}, Lcom/tantanapp/media/proxy/api/a;->e(Lcom/tantanapp/media/proxy/api/a;Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$b;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 27
    .line 28
    move v1, p1

    .line 29
    move-object v2, p2

    .line 30
    move-object v3, p3

    .line 31
    move-wide v4, p5

    .line 32
    move-object v6, p7

    .line 33
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/media/proxy/api/a;->f(Lcom/tantanapp/media/proxy/api/a;ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
