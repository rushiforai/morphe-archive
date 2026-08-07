.class public final synthetic Ll/s1o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/u1o0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/u1o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s1o0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/s1o0;->b:Ll/u1o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s1o0;->a:Ljava/util/List;

    iget-object p0, p0, Ll/s1o0;->b:Ll/u1o0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    invoke-static {v0, p0, p1}, Ll/u1o0;->p(Ljava/util/List;Ll/u1o0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;)V

    return-void
.end method
