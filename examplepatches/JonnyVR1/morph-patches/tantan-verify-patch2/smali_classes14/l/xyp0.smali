.class public final synthetic Ll/xyp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/data/WeChatToken;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/data/WeChatToken;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xyp0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iput-object p2, p0, Ll/xyp0;->b:Ll/y20;

    iput-object p3, p0, Ll/xyp0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xyp0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iget-object v1, p0, Ll/xyp0;->b:Ll/y20;

    iget-object p0, p0, Ll/xyp0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/v3q0;->r0(Lcom/p1/mobile/putong/account/data/WeChatToken;Ll/y20;Ljava/lang/Runnable;)V

    return-void
.end method
