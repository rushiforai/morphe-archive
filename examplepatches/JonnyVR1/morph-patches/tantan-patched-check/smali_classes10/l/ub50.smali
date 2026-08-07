.class public final synthetic Ll/ub50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yb50;


# direct methods
.method public synthetic constructor <init>(Ll/yb50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ub50;->a:Ll/yb50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ub50;->a:Ll/yb50;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p0, p1}, Ll/yb50;->R3(Ll/yb50;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
