.class public final synthetic Ll/ot70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/st70;


# direct methods
.method public synthetic constructor <init>(Ll/st70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ot70;->a:Ll/st70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ot70;->a:Ll/st70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    invoke-static {p0, p1}, Ll/st70;->K3(Ll/st70;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
