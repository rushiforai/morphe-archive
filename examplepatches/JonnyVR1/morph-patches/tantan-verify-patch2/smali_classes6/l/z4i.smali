.class public final synthetic Ll/z4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/b5i;


# direct methods
.method public synthetic constructor <init>(Ll/b5i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4i;->a:Ll/b5i;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z4i;->a:Ll/b5i;

    invoke-static {p0}, Ll/b5i;->a(Ll/b5i;)V

    return-void
.end method
