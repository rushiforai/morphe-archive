.class public final synthetic Ll/juk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kuk0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;


# direct methods
.method public synthetic constructor <init>(Ll/kuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/juk0;->a:Ll/kuk0;

    iput-object p2, p0, Ll/juk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/juk0;->a:Ll/kuk0;

    iget-object p0, p0, Ll/juk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    invoke-static {v0, p0, p1}, Ll/kuk0;->a(Ll/kuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Landroid/view/View;)V

    return-void
.end method
