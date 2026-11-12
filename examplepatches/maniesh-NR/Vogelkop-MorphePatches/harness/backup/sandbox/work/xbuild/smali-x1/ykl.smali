.class public final Lykl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupMenu$OnDismissListener;


# instance fields
.field public final synthetic a:Lorg/chromium/ui/widget/TextViewWithClickableSpans;


# direct methods
.method public constructor <init>(Lorg/chromium/ui/widget/TextViewWithClickableSpans;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lykl;->a:Lorg/chromium/ui/widget/TextViewWithClickableSpans;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/widget/PopupMenu;)V
    .registers 2

    iget-object p0, p0, Lykl;->a:Lorg/chromium/ui/widget/TextViewWithClickableSpans;

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->h:Landroid/widget/PopupMenu;

    return-void
.end method
