.class public final synthetic Ll/kp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

.field public final synthetic b:Ll/wtl;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;Ll/wtl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kp0;->a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

    iput-object p2, p0, Ll/kp0;->b:Ll/wtl;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kp0;->a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

    iget-object p0, p0, Ll/kp0;->b:Ll/wtl;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g(Lcom/p1/mobile/putong/live/base/vap/AnimView;Ll/wtl;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
