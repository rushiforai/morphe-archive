.class public final synthetic Ll/em70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/gm70;


# direct methods
.method public synthetic constructor <init>(Ll/gm70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/em70;->a:Ll/gm70;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/em70;->a:Ll/gm70;

    invoke-static {p0}, Ll/gm70;->B(Ll/gm70;)V

    return-void
.end method
