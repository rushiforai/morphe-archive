.class public final synthetic Ll/dgt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/egt;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;


# direct methods
.method public synthetic constructor <init>(Ll/egt;Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgt;->a:Ll/egt;

    iput-object p2, p0, Ll/dgt;->b:Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dgt;->a:Ll/egt;

    iget-object p0, p0, Ll/dgt;->b:Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;

    invoke-static {v0, p0}, Ll/egt;->J3(Ll/egt;Lcom/p1/mobile/longlink/msg/livedistribution/LongLinkReportMsg$LiveReportMsg;)V

    return-void
.end method
