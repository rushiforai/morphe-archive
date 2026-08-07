.class public final synthetic Ll/ly70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/my70;


# direct methods
.method public synthetic constructor <init>(Ll/my70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ly70;->a:Ll/my70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ly70;->a:Ll/my70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    invoke-static {p0, p1}, Ll/my70;->O3(Ll/my70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method
