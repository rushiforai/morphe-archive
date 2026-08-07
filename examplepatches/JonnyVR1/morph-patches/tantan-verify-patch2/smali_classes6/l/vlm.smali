.class public final synthetic Ll/vlm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fmm;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vlm;->a:Ll/fmm;

    iput-object p2, p0, Ll/vlm;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vlm;->a:Ll/fmm;

    iget-object p0, p0, Ll/vlm;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/fmm;->p0(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method
