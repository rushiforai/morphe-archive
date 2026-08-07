.class public final synthetic Ll/mgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/data/LikeExtraData;

.field public final synthetic h:Ll/y20;

.field public final synthetic i:Lcom/p1/mobile/putong/core/newui/home/d;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgr;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/mgr;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/mgr;->c:Z

    iput-boolean p4, p0, Ll/mgr;->d:Z

    iput-boolean p5, p0, Ll/mgr;->e:Z

    iput-object p6, p0, Ll/mgr;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/mgr;->g:Lcom/p1/mobile/putong/data/LikeExtraData;

    iput-object p8, p0, Ll/mgr;->h:Ll/y20;

    iput-object p9, p0, Ll/mgr;->i:Lcom/p1/mobile/putong/core/newui/home/d;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/mgr;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/mgr;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/mgr;->c:Z

    iget-boolean v3, p0, Ll/mgr;->d:Z

    iget-boolean v4, p0, Ll/mgr;->e:Z

    iget-object v5, p0, Ll/mgr;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/mgr;->g:Lcom/p1/mobile/putong/data/LikeExtraData;

    iget-object v7, p0, Ll/mgr;->h:Ll/y20;

    iget-object v8, p0, Ll/mgr;->i:Lcom/p1/mobile/putong/core/newui/home/d;

    move-object v9, p1

    check-cast v9, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v9}, Ll/rgr;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
