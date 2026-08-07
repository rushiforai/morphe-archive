.class public final synthetic Ll/bbv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fbv;


# direct methods
.method public synthetic constructor <init>(Ll/fbv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bbv;->a:Ll/fbv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbv;->a:Ll/fbv;

    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;

    invoke-static {p0, p1}, Ll/fbv;->s2(Ll/fbv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method
