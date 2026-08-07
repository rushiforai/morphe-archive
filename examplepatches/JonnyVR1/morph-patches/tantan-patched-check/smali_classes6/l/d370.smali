.class public final synthetic Ll/d370;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/MomentActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d370;->a:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d370;->a:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {p0, p1}, Ll/v370;->f(Lcom/p1/mobile/putong/feed/data/MomentActivity;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
