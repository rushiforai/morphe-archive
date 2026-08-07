.class public final synthetic Ll/yi00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hj00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yi00;->a:Ll/hj00;

    iput-object p2, p0, Ll/yi00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yi00;->a:Ll/hj00;

    iget-object p0, p0, Ll/yi00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/hj00;->D0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method
