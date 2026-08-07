.class public final synthetic Ll/mmm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hnm0;


# direct methods
.method public synthetic constructor <init>(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mmm0;->a:Ll/hnm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmm0;->a:Ll/hnm0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    invoke-static {p0, p1}, Ll/hnm0;->b4(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method
