.class public final synthetic Ll/e58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/e58;->a:Z

    iput-boolean p2, p0, Ll/e58;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/e58;->a:Z

    iget-boolean p0, p0, Ll/e58;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->o6(ZZ)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method
