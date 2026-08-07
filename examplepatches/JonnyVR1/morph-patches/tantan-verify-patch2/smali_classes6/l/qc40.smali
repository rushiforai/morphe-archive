.class public final synthetic Ll/qc40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/NotifyUsers;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qc40;->a:Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qc40;->a:Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/NotifyUser;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Lcom/p1/mobile/putong/feed/data/NotifyUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
