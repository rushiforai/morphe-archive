.class public final synthetic Ll/j5s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5s;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j5s;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    invoke-static {p0}, Ll/p6s;->S(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
