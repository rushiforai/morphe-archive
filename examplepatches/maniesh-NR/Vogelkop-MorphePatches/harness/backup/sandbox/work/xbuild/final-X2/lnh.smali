.class public final synthetic Llnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;B)V
    .registers 3

    iput-byte p2, p0, Llnh;->a:B

    iput-object p1, p0, Llnh;->b:Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Llnh;->a:B

    iget-object p0, p0, Llnh;->b:Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;

    packed-switch p1, :pswitch_data_16

    iget p0, p0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget p0, p0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
