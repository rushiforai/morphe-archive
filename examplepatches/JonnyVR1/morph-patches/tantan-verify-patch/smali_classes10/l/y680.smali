.class public final synthetic Ll/y680;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/k780;


# direct methods
.method public synthetic constructor <init>(Ll/k780;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y680;->a:Ll/k780;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y680;->a:Ll/k780;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    invoke-static {p0, p1}, Ll/k780;->J3(Ll/k780;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
