.class public final synthetic Ll/buj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/me20;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Z

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Ll/me20;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/buj0;->a:Ll/me20;

    iput-object p2, p0, Ll/buj0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/buj0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/buj0;->d:Z

    iput-boolean p5, p0, Ll/buj0;->e:Z

    iput-boolean p6, p0, Ll/buj0;->f:Z

    iput-object p7, p0, Ll/buj0;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/buj0;->h:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/buj0;->a:Ll/me20;

    iget-object v1, p0, Ll/buj0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/buj0;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/buj0;->d:Z

    iget-boolean v4, p0, Ll/buj0;->e:Z

    iget-boolean v5, p0, Ll/buj0;->f:Z

    iget-object v6, p0, Ll/buj0;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/buj0;->h:Ljava/util/concurrent/CountDownLatch;

    invoke-static/range {v0 .. v7}, Ll/duj0;->b(Ll/me20;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method
