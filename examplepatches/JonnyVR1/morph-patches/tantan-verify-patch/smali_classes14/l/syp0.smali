.class public final synthetic Ll/syp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/WeChatToken;

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syp0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/syp0;->b:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iput-object p3, p0, Ll/syp0;->c:Ljava/lang/Runnable;

    iput-object p4, p0, Ll/syp0;->d:Ll/y20;

    iput-object p5, p0, Ll/syp0;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/syp0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/syp0;->b:Lcom/p1/mobile/putong/account/data/WeChatToken;

    iget-object v2, p0, Ll/syp0;->c:Ljava/lang/Runnable;

    iget-object v3, p0, Ll/syp0;->d:Ll/y20;

    iget-object v4, p0, Ll/syp0;->e:Ljava/lang/Runnable;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/v3q0;->d3(Ll/v3q0;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method
