.class public final synthetic Ll/nk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/tk5;


# direct methods
.method public synthetic constructor <init>(Ll/tk5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nk5;->a:Ll/tk5;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk5;->a:Ll/tk5;

    invoke-static {p0, p1}, Ll/tk5;->z(Ll/tk5;Landroid/content/DialogInterface;)V

    return-void
.end method
