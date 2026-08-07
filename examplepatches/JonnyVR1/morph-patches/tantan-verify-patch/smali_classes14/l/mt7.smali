.class public final synthetic Ll/mt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;ZLjava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/mt7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mt7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/mt7;->d:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    iput-boolean p5, p0, Ll/mt7;->e:Z

    iput-object p6, p0, Ll/mt7;->f:Ljava/lang/String;

    iput-wide p7, p0, Ll/mt7;->g:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/mt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/mt7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mt7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/mt7;->d:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    iget-boolean v4, p0, Ll/mt7;->e:Z

    iget-object v5, p0, Ll/mt7;->f:Ljava/lang/String;

    iget-wide v6, p0, Ll/mt7;->g:J

    move-object v8, p1

    check-cast v8, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/api/g;->Ra(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;ZLjava/lang/String;JLjava/lang/Throwable;)V

    return-void
.end method
