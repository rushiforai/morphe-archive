.class public final synthetic Ll/dz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dz3;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dz3;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;

    check-cast p1, Ll/y34;

    invoke-static {p0, p1}, Ll/hz3;->S3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;Ll/y34;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
