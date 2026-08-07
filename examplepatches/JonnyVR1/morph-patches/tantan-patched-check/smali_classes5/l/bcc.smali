.class public final synthetic Ll/bcc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Ll/b240;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bcc;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/bcc;->b:Ll/b240;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bcc;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object p0, p0, Ll/bcc;->b:Ll/b240;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Th(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)V

    return-void
.end method
