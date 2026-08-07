.class public final synthetic Ll/j2q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j2q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/j2q0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/j2q0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/j2q0;->d:Ljava/lang/Runnable;

    iput-object p5, p0, Ll/j2q0;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/j2q0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/j2q0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/j2q0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/j2q0;->d:Ljava/lang/Runnable;

    iget-object v4, p0, Ll/j2q0;->e:Ljava/lang/Runnable;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;

    invoke-static/range {v0 .. v5}, Ll/v3q0;->g0(Ll/v3q0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method
