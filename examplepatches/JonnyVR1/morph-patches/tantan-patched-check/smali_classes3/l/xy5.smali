.class public final synthetic Ll/xy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/yy5;


# direct methods
.method public synthetic constructor <init>(Ll/yy5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xy5;->a:Ll/yy5;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xy5;->a:Ll/yy5;

    invoke-static {p0, p1}, Ll/yy5;->b(Ll/yy5;Landroid/content/DialogInterface;)V

    return-void
.end method
