.class public final synthetic Ll/w48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w48;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/w48;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/w48;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/w48;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/w48;->e:Z

    iput-object p6, p0, Ll/w48;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/w48;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/w48;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/w48;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/w48;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/w48;->e:Z

    iget-object v5, p0, Ll/w48;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->g8(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
