.class public final synthetic Ll/x710;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/Runnable;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x710;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/x710;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/x710;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/x710;->d:Ljava/lang/Runnable;

    iput-object p5, p0, Ll/x710;->e:Ljava/lang/Runnable;

    iput-object p6, p0, Ll/x710;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/x710;->g:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/x710;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/x710;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/x710;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/x710;->d:Ljava/lang/Runnable;

    iget-object v4, p0, Ll/x710;->e:Ljava/lang/Runnable;

    iget-object v5, p0, Ll/x710;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/x710;->g:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    invoke-static/range {v0 .. v6}, Ll/d810;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V

    return-void
.end method
