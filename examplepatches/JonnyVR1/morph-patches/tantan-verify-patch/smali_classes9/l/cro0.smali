.class public final synthetic Ll/cro0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dro0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;


# direct methods
.method public synthetic constructor <init>(Ll/dro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cro0;->a:Ll/dro0;

    iput-object p2, p0, Ll/cro0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cro0;->a:Ll/dro0;

    iget-object p0, p0, Ll/cro0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    invoke-static {v0, p0}, Ll/dro0;->J3(Ll/dro0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;)V

    return-void
.end method
