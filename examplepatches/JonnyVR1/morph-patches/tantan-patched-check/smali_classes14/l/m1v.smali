.class public Ll/m1v;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesFooterView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:I


# direct methods
.method public constructor <init>(ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/m1v;->c:I

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/m1v;->a:Z

    .line 8
    .line 9
    iput-boolean p2, p0, Ll/m1v;->b:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(ZZI)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 13
    iput-boolean p1, p0, Ll/m1v;->a:Z

    .line 14
    iput-boolean p2, p0, Ll/m1v;->b:Z

    .line 15
    iput p3, p0, Ll/m1v;->c:I

    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesFooterView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/m1v;->a:Z

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/m1v;->b:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesFooterView;->q(ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->O1:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/m1v;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesFooterView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1v;->H(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesFooterView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
