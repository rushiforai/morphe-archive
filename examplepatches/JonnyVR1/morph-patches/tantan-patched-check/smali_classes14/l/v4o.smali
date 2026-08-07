.class public final synthetic Ll/v4o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public final synthetic b:I

.field public final synthetic c:Ll/str;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4o;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    iput p2, p0, Ll/v4o;->b:I

    iput-object p3, p0, Ll/v4o;->c:Ll/str;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v4o;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    iget v1, p0, Ll/v4o;->b:I

    iget-object p0, p0, Ll/v4o;->c:Ll/str;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->o5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    return-void
.end method
