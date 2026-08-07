.class public final synthetic Ll/hdj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ldj0;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/ldj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdj0;->a:Ll/ldj0;

    iput-object p2, p0, Ll/hdj0;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hdj0;->a:Ll/ldj0;

    iget-object p0, p0, Ll/hdj0;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0}, Ll/ldj0;->e(Ll/ldj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
