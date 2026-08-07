.class public Ll/pvg$b;
.super Ll/pvg$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pvg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic b:Ll/pvg;


# direct methods
.method public constructor <init>(Ll/pvg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pvg$b;->b:Ll/pvg;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/pvg$c;-><init>(Ll/pvg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget p0, Ll/lbc0;->p3:I

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    sget p0, Ll/lbc0;->e6:I

    .line 15
    .line 16
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    const/16 p0, 0x64

    .line 2
    .line 3
    return p0
.end method
