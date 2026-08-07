.class public final synthetic Ll/tx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/tx7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/tx7;->c:Ljava/lang/String;

    iput-wide p4, p0, Ll/tx7;->d:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v1, p0, Ll/tx7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/tx7;->c:Ljava/lang/String;

    iget-wide v3, p0, Ll/tx7;->d:J

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Kd(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;JLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
