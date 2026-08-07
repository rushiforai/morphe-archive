.class public final synthetic Ll/qur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qur;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    iput-object p2, p0, Ll/qur;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qur;->c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qur;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    iget-object v1, p0, Ll/qur;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/qur;->c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->l2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method
