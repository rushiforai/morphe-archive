.class public final synthetic Ll/ssj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ctj0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/DislikedUsers;


# direct methods
.method public synthetic constructor <init>(Ll/ctj0;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ssj0;->a:Ll/ctj0;

    iput-object p2, p0, Ll/ssj0;->b:Lcom/p1/mobile/putong/core/data/DislikedUsers;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ssj0;->a:Ll/ctj0;

    iget-object p0, p0, Ll/ssj0;->b:Lcom/p1/mobile/putong/core/data/DislikedUsers;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Ll/ctj0;->h0(Ll/ctj0;Lcom/p1/mobile/putong/core/data/DislikedUsers;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
