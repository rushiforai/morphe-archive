.class public Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView$a;->a:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Ll/iwk;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView$a;-><init>(Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView$a;->a:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->c(Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
