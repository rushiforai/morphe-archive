.class public final synthetic Ll/mur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mur;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    iput-object p2, p0, Ll/mur;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/mur;->c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mur;->a:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    iget-object v1, p0, Ll/mur;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/mur;->c:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->c2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/uxj0;)V

    return-void
.end method
