.class public final synthetic Ll/bdm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/edm;


# direct methods
.method public synthetic constructor <init>(Ll/edm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bdm;->a:Ll/edm;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bdm;->a:Ll/edm;

    invoke-static {p0}, Ll/edm;->k(Ll/edm;)V

    return-void
.end method
