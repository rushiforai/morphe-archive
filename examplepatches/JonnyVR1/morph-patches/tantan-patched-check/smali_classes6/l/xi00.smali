.class public final synthetic Ll/xi00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hj00;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xi00;->a:Ll/hj00;

    iput-object p2, p0, Ll/xi00;->b:Ll/x20;

    iput-object p3, p0, Ll/xi00;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xi00;->a:Ll/hj00;

    iget-object v1, p0, Ll/xi00;->b:Ll/x20;

    iget-object p0, p0, Ll/xi00;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, v1, p0, p1}, Ll/hj00;->i0(Ll/hj00;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
