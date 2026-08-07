.class public final synthetic Ll/lvn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nvn;


# direct methods
.method public synthetic constructor <init>(Ll/nvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvn;->a:Ll/nvn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lvn;->a:Ll/nvn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    invoke-static {p0, p1}, Ll/mvn;->b(Ll/nvn;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
