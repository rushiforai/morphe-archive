.class public Ll/fsb0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ukm;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb0;->e(Ll/rg50;)Ll/ug50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fsb0;


# direct methods
.method public constructor <init>(Ll/fsb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsb0$c;->a:Ll/fsb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/kl20;->b()Ll/kl20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/hl20;->c(Ll/x1d0;Ll/v4m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/x1d0;Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/hl20;->b(Ll/x1d0;Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/x1d0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/hl20;->a(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/fsb0;->C()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Ll/fsb0;->W(Ljava/lang/Throwable;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    new-instance p0, Lcom/p1/mobile/putong/api/fresco/FrescoImageRequestException;

    .line 17
    .line 18
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/api/fresco/FrescoImageRequestException;-><init>(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public requestCancel(Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hl20;->d(Ll/x1d0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
