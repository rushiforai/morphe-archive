.class public final synthetic Ll/a810;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a810;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/a810;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/a810;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/a810;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/a810;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/a810;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/a810;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/a810;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/a810;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/a810;->e:Ljava/lang/Runnable;

    move-object v5, p1

    check-cast v5, Ll/uxj0;

    invoke-static/range {v0 .. v5}, Ll/d810;->f(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/uxj0;)V

    return-void
.end method
