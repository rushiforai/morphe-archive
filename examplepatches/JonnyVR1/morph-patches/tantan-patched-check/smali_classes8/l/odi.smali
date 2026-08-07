.class public final synthetic Ll/odi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/pdi;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/odi;->a:Ll/pdi;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/odi;->a:Ll/pdi;

    invoke-static {p0}, Ll/pdi;->p(Ll/pdi;)V

    return-void
.end method
