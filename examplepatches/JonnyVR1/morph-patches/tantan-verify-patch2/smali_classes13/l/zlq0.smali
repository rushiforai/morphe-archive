.class public final synthetic Ll/zlq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/network/XHttpManager;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/util/Map;

.field public final synthetic f:[B

.field public final synthetic g:J


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/network/XHttpManager;Ljava/lang/String;JLjava/lang/String;Ljava/util/Map;[BJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zlq0;->a:Lcom/momo/xeengine/network/XHttpManager;

    iput-object p2, p0, Ll/zlq0;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/zlq0;->c:J

    iput-object p5, p0, Ll/zlq0;->d:Ljava/lang/String;

    iput-object p6, p0, Ll/zlq0;->e:Ljava/util/Map;

    iput-object p7, p0, Ll/zlq0;->f:[B

    iput-wide p8, p0, Ll/zlq0;->g:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/zlq0;->a:Lcom/momo/xeengine/network/XHttpManager;

    iget-object v1, p0, Ll/zlq0;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/zlq0;->c:J

    iget-object v4, p0, Ll/zlq0;->d:Ljava/lang/String;

    iget-object v5, p0, Ll/zlq0;->e:Ljava/util/Map;

    iget-object v6, p0, Ll/zlq0;->f:[B

    iget-wide v7, p0, Ll/zlq0;->g:J

    invoke-static/range {v0 .. v8}, Lcom/momo/xeengine/network/XHttpManager;->a(Lcom/momo/xeengine/network/XHttpManager;Ljava/lang/String;JLjava/lang/String;Ljava/util/Map;[BJ)V

    return-void
.end method
