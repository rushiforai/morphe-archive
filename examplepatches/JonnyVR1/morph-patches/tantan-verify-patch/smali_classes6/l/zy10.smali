.class public final synthetic Ll/zy10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/b;

    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->F(Lcom/p1/mobile/putong/feed/newui/camera/b;Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
