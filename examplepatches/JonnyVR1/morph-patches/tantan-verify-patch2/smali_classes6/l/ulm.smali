.class public final synthetic Ll/ulm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fmm;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ulm;->a:Ll/fmm;

    iput-object p2, p0, Ll/ulm;->b:Ll/x20;

    iput-object p3, p0, Ll/ulm;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ulm;->a:Ll/fmm;

    iget-object v1, p0, Ll/ulm;->b:Ll/x20;

    iget-object p0, p0, Ll/ulm;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, v1, p0, p1}, Ll/fmm;->h0(Ll/fmm;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
