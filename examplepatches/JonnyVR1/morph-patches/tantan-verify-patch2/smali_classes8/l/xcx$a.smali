.class public Ll/xcx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xcx;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xcx;


# direct methods
.method public constructor <init>(Ll/xcx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx$a;->a:Ll/xcx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xcx$a;->a:Ll/xcx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/xcx$a;->a:Ll/xcx;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
