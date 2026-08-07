.class public final synthetic Ll/nsc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nsc0;->a:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsc0;->a:Ljava/lang/Integer;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    invoke-static {p0, p1}, Ll/osc0;->N3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
