.class public final synthetic Ll/o27;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/q27;


# direct methods
.method public synthetic constructor <init>(Ll/q27;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o27;->a:Ll/q27;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o27;->a:Ll/q27;

    invoke-static {p0, p1}, Ll/q27;->y(Ll/q27;Landroid/content/DialogInterface;)V

    return-void
.end method
