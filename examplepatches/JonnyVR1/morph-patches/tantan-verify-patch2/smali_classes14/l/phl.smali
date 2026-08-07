.class public final synthetic Ll/phl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/HotLauncherAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/HotLauncherAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/phl;->a:Lcom/p1/mobile/putong/api/HotLauncherAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/phl;->a:Lcom/p1/mobile/putong/api/HotLauncherAct;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->Y1(Lcom/p1/mobile/putong/api/HotLauncherAct;)V

    return-void
.end method
