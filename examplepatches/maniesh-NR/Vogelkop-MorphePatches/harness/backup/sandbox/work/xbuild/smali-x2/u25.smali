.class public final synthetic Lu25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/BrowserDataManager$SizeCallback;
.implements Lcom/opera/android/readermode/ReaderModeHelper$SizeCallback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv25;

.field public final synthetic c:Ls25;

.field public final synthetic d:Liu2;


# direct methods
.method public synthetic constructor <init>(Lv25;Ls25;Liu2;B)V
    .registers 5

    iput-byte p4, p0, Lu25;->a:B

    iput-object p1, p0, Lu25;->b:Lv25;

    iput-object p2, p0, Lu25;->c:Ls25;

    iput-object p3, p0, Lu25;->d:Liu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(J)V
    .registers 8

    iget-byte v0, p0, Lu25;->a:B

    iget-object v1, p0, Lu25;->d:Liu2;

    iget-object v2, p0, Lu25;->c:Ls25;

    iget-object p0, p0, Lu25;->b:Lv25;

    packed-switch v0, :pswitch_data_1e

    iget-wide v3, p0, Lv25;->f:J

    add-long/2addr v3, p1

    iput-wide v3, p0, Lv25;->f:J

    invoke-virtual {p0, v2, v1}, Lv25;->e(Ls25;Liu2;)V

    return-void

    :pswitch_14
    iget-wide v3, p0, Lv25;->f:J

    add-long/2addr v3, p1

    iput-wide v3, p0, Lv25;->f:J

    invoke-virtual {p0, v2, v1}, Lv25;->e(Ls25;Liu2;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
