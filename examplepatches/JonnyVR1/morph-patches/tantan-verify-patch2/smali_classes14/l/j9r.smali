.class public final synthetic Ll/j9r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/LauncherAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/LauncherAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9r;->a:Lcom/p1/mobile/putong/core/LauncherAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j9r;->a:Lcom/p1/mobile/putong/core/LauncherAct;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/LauncherAct;->Z1(Lcom/p1/mobile/putong/core/LauncherAct;Ljava/lang/Boolean;)V

    return-void
.end method
