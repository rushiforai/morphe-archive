.class public final synthetic Ll/elc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/b240;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Ll/b240;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/elc;->a:Ll/b240;

    iput-object p2, p0, Ll/elc;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/elc;->a:Ll/b240;

    iget-object p0, p0, Ll/elc;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->F0(Ll/b240;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
