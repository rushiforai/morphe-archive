.class public final synthetic Ll/ebq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ccq0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/putong/account/data/WeChatToken;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ebq0;->a:Ll/ccq0;

    iput-object p2, p0, Ll/ebq0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/ebq0;->c:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iput-object p4, p0, Ll/ebq0;->d:Ljava/lang/Runnable;

    iput-object p5, p0, Ll/ebq0;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ebq0;->a:Ll/ccq0;

    iget-object v1, p0, Ll/ebq0;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/ebq0;->c:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iget-object v3, p0, Ll/ebq0;->d:Ljava/lang/Runnable;

    iget-object v4, p0, Ll/ebq0;->e:Ljava/lang/Runnable;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/ccq0;->H1(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method
