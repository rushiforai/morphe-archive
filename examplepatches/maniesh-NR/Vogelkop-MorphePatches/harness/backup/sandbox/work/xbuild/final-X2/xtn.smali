.class public final synthetic Lxtn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/history/g;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/history/g;B)V
    .registers 3

    iput-byte p2, p0, Lxtn;->a:B

    iput-object p1, p0, Lxtn;->b:Lcom/opera/android/history/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lxtn;->a:B

    iget-object p0, p0, Lxtn;->b:Lcom/opera/android/history/g;

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getEditableString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
