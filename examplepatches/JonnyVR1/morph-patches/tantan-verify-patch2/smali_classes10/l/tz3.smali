.class public final synthetic Ll/tz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/a04;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;


# direct methods
.method public synthetic constructor <init>(Ll/a04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tz3;->a:Ll/a04;

    iput-object p2, p0, Ll/tz3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tz3;->a:Ll/a04;

    iget-object p0, p0, Ll/tz3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, p0, p1}, Ll/a04;->p4(Ll/a04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V

    return-void
.end method
