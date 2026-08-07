.class public final synthetic Ll/xny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/boy;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;


# direct methods
.method public synthetic constructor <init>(Ll/boy;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xny;->a:Ll/boy;

    iput-object p2, p0, Ll/xny;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xny;->a:Ll/boy;

    iget-object p0, p0, Ll/xny;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/boy;->a4(Ll/boy;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
