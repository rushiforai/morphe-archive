.class public final synthetic Ll/qok0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ipk0;

.field public final synthetic b:Ll/ovn0;


# direct methods
.method public synthetic constructor <init>(Ll/ipk0;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qok0;->a:Ll/ipk0;

    iput-object p2, p0, Ll/qok0;->b:Ll/ovn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qok0;->a:Ll/ipk0;

    iget-object p0, p0, Ll/qok0;->b:Ll/ovn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0, p1}, Ll/ipk0;->S3(Ll/ipk0;Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method
