.class public final synthetic Ll/xh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yh2;


# direct methods
.method public synthetic constructor <init>(Ll/yh2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xh2;->a:Ll/yh2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xh2;->a:Ll/yh2;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    invoke-static {p0, p1}, Ll/yh2;->S3(Ll/yh2;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/util/List;

    return-void
.end method
