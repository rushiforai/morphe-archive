.class public final synthetic Ll/wby;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wby;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/wby;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/wby;->c:Lcom/p1/mobile/putong/data/User;

    iput-boolean p4, p0, Ll/wby;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wby;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object v1, p0, Ll/wby;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/wby;->c:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/wby;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/yby;->d(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
