.class public final synthetic Ll/r7z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7z;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-boolean p2, p0, Ll/r7z;->b:Z

    iput-boolean p3, p0, Ll/r7z;->c:Z

    iput-wide p4, p0, Ll/r7z;->d:J

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/r7z;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-boolean v1, p0, Ll/r7z;->b:Z

    iget-boolean v2, p0, Ll/r7z;->c:Z

    iget-wide v3, p0, Ll/r7z;->d:J

    invoke-static {v0, v1, v2, v3, v4}, Ll/nbz;->s0(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    return-void
.end method
