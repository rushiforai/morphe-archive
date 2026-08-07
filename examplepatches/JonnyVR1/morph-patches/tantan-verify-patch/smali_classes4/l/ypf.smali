.class public final synthetic Ll/ypf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/aqf$a;


# direct methods
.method public synthetic constructor <init>(Ll/aqf$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ypf;->a:Ll/aqf$a;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypf;->a:Ll/aqf$a;

    invoke-static {p0, p1}, Ll/aqf$a;->a(Ll/aqf$a;Landroid/content/DialogInterface;)V

    return-void
.end method
