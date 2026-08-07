.class public final synthetic Ll/x0l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i1l;


# direct methods
.method public synthetic constructor <init>(Ll/i1l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x0l;->a:Ll/i1l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0l;->a:Ll/i1l;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    invoke-static {p0, p1}, Ll/i1l;->c4(Ll/i1l;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;)V

    return-void
.end method
