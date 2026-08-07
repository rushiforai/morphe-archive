.class public final synthetic Ll/na7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Lcom/p1/mobile/putong/data/User;

.field public final synthetic g:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/na7;->a:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    iput-object p2, p0, Ll/na7;->b:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p3, p0, Ll/na7;->c:Z

    iput-boolean p4, p0, Ll/na7;->d:Z

    iput-boolean p5, p0, Ll/na7;->e:Z

    iput-object p6, p0, Ll/na7;->f:Lcom/p1/mobile/putong/data/User;

    iput-object p7, p0, Ll/na7;->g:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/na7;->a:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    iget-object v1, p0, Ll/na7;->b:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v2, p0, Ll/na7;->c:Z

    iget-boolean v3, p0, Ll/na7;->d:Z

    iget-boolean v4, p0, Ll/na7;->e:Z

    iget-object v5, p0, Ll/na7;->f:Lcom/p1/mobile/putong/data/User;

    iget-object v6, p0, Ll/na7;->g:Lcom/p1/mobile/android/app/Act;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->au(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
