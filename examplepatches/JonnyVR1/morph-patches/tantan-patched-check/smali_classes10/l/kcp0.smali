.class public final synthetic Ll/kcp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kcp0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/kcp0;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/kcp0;->c:Z

    iput-object p4, p0, Ll/kcp0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/kcp0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/kcp0;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/kcp0;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/kcp0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/kcp0;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/kcp0;->c:Z

    iget-object v3, p0, Ll/kcp0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/kcp0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/kcp0;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/kcp0;->g:Ljava/lang/String;

    move-object v7, p1

    check-cast v7, Ll/gcg0;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VoiceVirtualApi;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gcg0;)V

    return-void
.end method
