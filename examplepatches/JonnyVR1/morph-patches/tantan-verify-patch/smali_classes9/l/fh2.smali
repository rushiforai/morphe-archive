.class public final synthetic Ll/fh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yh2;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/yh2;Ljava/lang/String;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fh2;->a:Ll/yh2;

    iput-object p2, p0, Ll/fh2;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fh2;->c:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fh2;->a:Ll/yh2;

    iget-object v1, p0, Ll/fh2;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/fh2;->c:Ll/qcj;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    invoke-static {v0, v1, p0, p1}, Ll/yh2;->b4(Ll/yh2;Ljava/lang/String;Ll/qcj;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    return-void
.end method
