.class public final synthetic Ll/jr60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

.field public final synthetic b:J

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;JLcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jr60;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    iput-wide p2, p0, Ll/jr60;->b:J

    iput-object p4, p0, Ll/jr60;->c:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    iput p5, p0, Ll/jr60;->d:I

    iput p6, p0, Ll/jr60;->e:I

    iput-object p7, p0, Ll/jr60;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/jr60;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    iget-wide v1, p0, Ll/jr60;->b:J

    iget-object v3, p0, Ll/jr60;->c:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    iget v4, p0, Ll/jr60;->d:I

    iget v5, p0, Ll/jr60;->e:I

    iget-object v6, p0, Ll/jr60;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->d(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;JLcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;IILjava/lang/String;)V

    return-void
.end method
