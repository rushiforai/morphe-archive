.class public final Lcom/opera/android/shortcut/SearchShortcutWidgetActivity;
.super Lwz5;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/shortcut/SearchShortcutWidgetActivity;",
        "Lwz5;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 4

    const v0, 0x7f110005

    const-string v1, "com.opera.android.action.SEARCH_FROM_SHORTCUT_WIDGET"

    const-string v2, "searchWidgetShort"

    invoke-direct {p0, v2, v0, v1}, Lwz5;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method
