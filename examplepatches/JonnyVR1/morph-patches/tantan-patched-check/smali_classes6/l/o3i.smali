.class public final synthetic Ll/o3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iput p2, p0, Ll/o3i;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iget p0, p0, Ll/o3i;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->H(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;I)V

    return-void
.end method
