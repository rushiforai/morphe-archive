.class public final synthetic Ll/x6q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ccq0;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/WeChatUserInfo;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x6q0;->a:Ll/ccq0;

    iput-object p2, p0, Ll/x6q0;->b:Lcom/p1/mobile/putong/account/data/WeChatUserInfo;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6q0;->a:Ll/ccq0;

    iget-object p0, p0, Ll/x6q0;->b:Lcom/p1/mobile/putong/account/data/WeChatUserInfo;

    invoke-static {v0, p0}, Ll/ccq0;->u0(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method
