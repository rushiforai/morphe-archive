.class public final synthetic Ll/ttp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xup;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/xup;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ttp;->a:Ll/xup;

    iput-object p2, p0, Ll/ttp;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ttp;->a:Ll/xup;

    iget-object p0, p0, Ll/ttp;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    invoke-static {v0, p0, p1}, Ll/utp;->q0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V

    return-void
.end method
