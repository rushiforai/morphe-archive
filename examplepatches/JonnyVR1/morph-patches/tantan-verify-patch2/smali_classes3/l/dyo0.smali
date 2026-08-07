.class public final synthetic Ll/dyo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kyo0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/kyo0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dyo0;->a:Ll/kyo0;

    iput-object p2, p0, Ll/dyo0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dyo0;->a:Ll/kyo0;

    iget-object p0, p0, Ll/dyo0;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    invoke-static {v0, p0, p1}, Ll/kyo0;->e4(Ll/kyo0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;)V

    return-void
.end method
