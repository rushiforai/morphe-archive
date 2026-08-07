.class public final synthetic Ll/xsc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zsc0$a;


# direct methods
.method public synthetic constructor <init>(Ll/zsc0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xsc0;->a:Ll/zsc0$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsc0;->a:Ll/zsc0$a;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;

    invoke-static {p0, p1}, Ll/zsc0$a;->a(Ll/zsc0$a;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
