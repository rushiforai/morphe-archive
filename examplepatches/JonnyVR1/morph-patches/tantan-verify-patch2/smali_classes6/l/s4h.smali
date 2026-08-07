.class public final synthetic Ll/s4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/v4h;


# direct methods
.method public synthetic constructor <init>(Ll/v4h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4h;->a:Ll/v4h;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4h;->a:Ll/v4h;

    invoke-static {p0, p1}, Ll/v4h;->x(Ll/v4h;Landroid/content/DialogInterface;)V

    return-void
.end method
