.class public final synthetic Ll/y8c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/b9c;


# direct methods
.method public synthetic constructor <init>(Ll/b9c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8c;->a:Ll/b9c;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y8c;->a:Ll/b9c;

    invoke-static {p0, p1}, Ll/b9c;->z(Ll/b9c;Landroid/content/DialogInterface;)V

    return-void
.end method
