.class public final synthetic Ll/cyn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cyn0;->a:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyn0;->a:Ll/nsv;

    check-cast p1, Ll/cen0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceLiveFansItem;->a(Ll/nsv;Ll/cen0;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
