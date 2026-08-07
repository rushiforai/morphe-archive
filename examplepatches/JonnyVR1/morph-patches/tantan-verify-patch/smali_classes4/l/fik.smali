.class public final synthetic Ll/fik;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/GroupApply;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fik;->a:Lcom/p1/mobile/putong/core/data/GroupApply;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fik;->a:Lcom/p1/mobile/putong/core/data/GroupApply;

    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupNotification;

    invoke-static {p0, p1}, Ll/gik;->E(Lcom/p1/mobile/putong/core/data/GroupApply;Lcom/p1/mobile/putong/core/data/GroupNotification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
