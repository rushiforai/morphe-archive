.class public final synthetic Ll/i0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i0i;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/i0i;->b:Z

    iput-object p3, p0, Ll/i0i;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i0i;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean v1, p0, Ll/i0i;->b:Z

    iget-object p0, p0, Ll/i0i;->c:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->K(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method
