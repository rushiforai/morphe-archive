.class public final synthetic Ll/kzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic e:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/kzi;->a:Z

    iput-object p2, p0, Ll/kzi;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/kzi;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/kzi;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p5, p0, Ll/kzi;->e:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/kzi;->a:Z

    iget-object v1, p0, Ll/kzi;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/kzi;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/kzi;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/kzi;->e:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    invoke-static {v0, v1, v2, v3, p0}, Ll/rzi;->v(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method
