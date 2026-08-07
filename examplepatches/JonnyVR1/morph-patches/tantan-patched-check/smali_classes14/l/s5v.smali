.class public final synthetic Ll/s5v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/s5v;->a:I

    iput-object p2, p0, Ll/s5v;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/s5v;->a:I

    iget-object p0, p0, Ll/s5v;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    invoke-static {v0, p0, p1}, Ll/v5v;->l0(ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;)Ll/j0v;

    move-result-object p0

    return-object p0
.end method
