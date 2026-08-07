.class public final synthetic Ll/pzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzi;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/pzi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p3, p0, Ll/pzi;->c:Z

    iput-object p4, p0, Ll/pzi;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pzi;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/pzi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean v2, p0, Ll/pzi;->c:Z

    iget-object p0, p0, Ll/pzi;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0}, Ll/rzi;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
