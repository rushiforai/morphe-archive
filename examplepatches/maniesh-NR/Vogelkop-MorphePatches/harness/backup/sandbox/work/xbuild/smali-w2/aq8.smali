.class public final synthetic Laq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpwe;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Laq8;->a:B

    iput-object p1, p0, Laq8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 6

    iget-byte v0, p0, Laq8;->a:B

    iget-object p0, p0, Laq8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lfzk;

    invoke-virtual {p0}, Lfzk;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object p0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    if-eqz p0, :cond_22

    iget p1, p1, Lbp;->a:I

    iget-object p0, p0, Lzll;->a:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    iget-wide v0, p0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->d:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_22

    invoke-static {v0, v1, p1}, LJ/N;->MwkfWGl7(JI)V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
