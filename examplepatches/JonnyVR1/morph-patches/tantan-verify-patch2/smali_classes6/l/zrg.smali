.class public final synthetic Ll/zrg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zrg;->a:Ll/aqq;

    iput-object p2, p0, Ll/zrg;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zrg;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/zrg;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/zrg;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/zrg;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/zrg;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/zrg;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/zrg;->a:Ll/aqq;

    iget-object v1, p0, Ll/zrg;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/zrg;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/zrg;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/zrg;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/zrg;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/zrg;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/zrg;->h:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->d(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
