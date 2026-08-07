.class public final synthetic Ll/rja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rja;->a:Ll/jka;

    iput-object p2, p0, Ll/rja;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rja;->a:Ll/jka;

    iget-object p0, p0, Ll/rja;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, p0, p1}, Ll/jka;->B3(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Lrx/Notification;)Lrx/Notification;

    move-result-object p0

    return-object p0
.end method
