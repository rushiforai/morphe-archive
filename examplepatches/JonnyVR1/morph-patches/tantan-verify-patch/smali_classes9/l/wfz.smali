.class public final synthetic Ll/wfz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ggz;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:J

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

.field public final synthetic f:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

.field public final synthetic g:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/ggz;JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wfz;->a:Ll/ggz;

    iput-wide p2, p0, Ll/wfz;->b:J

    iput p4, p0, Ll/wfz;->c:I

    iput-wide p5, p0, Ll/wfz;->d:J

    iput-object p7, p0, Ll/wfz;->e:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    iput-object p8, p0, Ll/wfz;->f:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    iput-object p9, p0, Ll/wfz;->g:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wfz;->a:Ll/ggz;

    iget-wide v1, p0, Ll/wfz;->b:J

    iget v3, p0, Ll/wfz;->c:I

    iget-wide v4, p0, Ll/wfz;->d:J

    iget-object v6, p0, Ll/wfz;->e:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    iget-object v7, p0, Ll/wfz;->f:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    iget-object v8, p0, Ll/wfz;->g:Lcom/p1/mobile/putong/data/User;

    move-object v9, p1

    check-cast v9, Ljava/lang/Long;

    invoke-static/range {v0 .. v9}, Ll/ggz;->E7(Ll/ggz;JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V

    return-void
.end method
