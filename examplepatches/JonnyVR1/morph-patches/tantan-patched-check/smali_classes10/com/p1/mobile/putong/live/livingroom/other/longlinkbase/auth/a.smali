.class public abstract Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "room"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract b(Ll/smc0;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;
        }
    .end annotation
.end method
