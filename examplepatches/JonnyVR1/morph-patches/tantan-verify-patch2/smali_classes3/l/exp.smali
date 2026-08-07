.class public final synthetic Ll/exp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/gxp;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/gxp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exp;->a:Ljava/util/List;

    iput-object p2, p0, Ll/exp;->b:Ll/gxp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/exp;->a:Ljava/util/List;

    iget-object p0, p0, Ll/exp;->b:Ll/gxp;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    invoke-static {v0, p0, p1}, Ll/gxp;->a(Ljava/util/List;Ll/gxp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;)V

    return-void
.end method
