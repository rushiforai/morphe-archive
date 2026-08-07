.class public final synthetic Ll/s6m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w6m0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;


# direct methods
.method public synthetic constructor <init>(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s6m0;->a:Ll/w6m0;

    iput-object p2, p0, Ll/s6m0;->b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s6m0;->a:Ll/w6m0;

    iget-object p0, p0, Ll/s6m0;->b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/w6m0;->A4(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
