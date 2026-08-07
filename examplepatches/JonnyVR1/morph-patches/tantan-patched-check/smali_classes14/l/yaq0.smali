.class public final synthetic Ll/yaq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/data/WeChatToken;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yaq0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iput-object p2, p0, Ll/yaq0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yaq0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iget-object p0, p0, Ll/yaq0;->b:Ljava/lang/Runnable;

    check-cast p1, Lcom/p1/mobile/putong/account/data/WeChatToken;

    invoke-static {v0, p0, p1}, Ll/ccq0;->X0(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
