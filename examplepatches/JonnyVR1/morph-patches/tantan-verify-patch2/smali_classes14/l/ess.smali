.class public final synthetic Ll/ess;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PushMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ess;->a:Lcom/p1/mobile/putong/data/PushMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ess;->a:Lcom/p1/mobile/putong/data/PushMessage;

    check-cast p1, Ll/mwl;

    invoke-static {p0, p1}, Ll/fss;->a(Lcom/p1/mobile/putong/data/PushMessage;Ll/mwl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
