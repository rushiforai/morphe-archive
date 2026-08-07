.class public final Ll/nog0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nog0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/nog0;->b:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/nog0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Ll/nog0;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nog0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/nog0;->b:Z

    .line 4
    .line 5
    sget-object v2, Ll/utg0;->b:Ll/uyg0;

    .line 6
    .line 7
    invoke-virtual {v2, v0, v1}, Ll/uyg0;->p(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/fug0;->b:Ltech/sud/gip/core/ISudListenerReportStatsEvent;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/nog0;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget v2, p0, Ll/nog0;->d:I

    .line 17
    .line 18
    iget-object p0, p0, Ll/nog0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, v1, v2, p0}, Ltech/sud/gip/core/ISudListenerReportStatsEvent;->onReportStatsEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
