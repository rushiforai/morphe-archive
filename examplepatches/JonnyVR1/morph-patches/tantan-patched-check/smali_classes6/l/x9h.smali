.class public final synthetic Ll/x9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x9h;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9h;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {p0, p1}, Ll/y9h;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
