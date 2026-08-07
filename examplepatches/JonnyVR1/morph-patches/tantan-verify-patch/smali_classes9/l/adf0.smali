.class public final synthetic Ll/adf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/cdf0;


# direct methods
.method public synthetic constructor <init>(Ll/cdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/adf0;->a:Ll/cdf0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/adf0;->a:Ll/cdf0;

    invoke-static {p0, p1}, Ll/cdf0;->a(Ll/cdf0;Landroid/content/DialogInterface;)V

    return-void
.end method
