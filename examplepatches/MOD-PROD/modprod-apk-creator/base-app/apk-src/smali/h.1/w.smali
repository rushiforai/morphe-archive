.class public final Lh/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Lh/x;


# direct methods
.method public constructor <init>(Lh/x;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh/w;->a:Lh/x;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 1

    iget-object v0, p0, Lh/w;->a:Lh/x;

    invoke-virtual {v0}, Lh/x;->c()V

    return-void
.end method
