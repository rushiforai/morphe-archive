.class final Ll/hxq0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hxq0;->k(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Z

.field final synthetic d:J

.field final synthetic e:I

.field final synthetic f:J

.field final synthetic g:I

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hxq0$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hxq0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/hxq0$a;->c:Z

    .line 6
    .line 7
    iput-wide p4, p0, Ll/hxq0$a;->d:J

    .line 8
    .line 9
    iput p6, p0, Ll/hxq0$a;->e:I

    .line 10
    .line 11
    iput-wide p7, p0, Ll/hxq0$a;->f:J

    .line 12
    .line 13
    iput p9, p0, Ll/hxq0$a;->g:I

    .line 14
    .line 15
    iput-object p10, p0, Ll/hxq0$a;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput p11, p0, Ll/hxq0$a;->i:I

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/hxq0$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hxq0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/hxq0$a;->c:Z

    .line 6
    .line 7
    iget-wide v3, p0, Ll/hxq0$a;->d:J

    .line 8
    .line 9
    iget v5, p0, Ll/hxq0$a;->e:I

    .line 10
    .line 11
    iget-wide v6, p0, Ll/hxq0$a;->f:J

    .line 12
    .line 13
    iget v8, p0, Ll/hxq0$a;->g:I

    .line 14
    .line 15
    iget-object v9, p0, Ll/hxq0$a;->h:Ljava/lang/String;

    .line 16
    .line 17
    iget v10, p0, Ll/hxq0$a;->i:I

    .line 18
    .line 19
    invoke-static/range {v0 .. v10}, Ll/hxq0;->o(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception v0

    .line 24
    move-object p0, v0

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "DisconnectStatsSP onDisconnection exception: "

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
