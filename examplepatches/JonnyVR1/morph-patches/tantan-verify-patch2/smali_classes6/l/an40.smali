.class public final synthetic Ll/an40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/an40;->a:Z

    iput-object p2, p0, Ll/an40;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p3, p0, Ll/an40;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/an40;->a:Z

    iget-object v1, p0, Ll/an40;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean p0, p0, Ll/an40;->c:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/cn40;->d(ZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/Throwable;)V

    return-void
.end method
