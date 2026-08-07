.class public final synthetic Ll/pli0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/vli0;


# direct methods
.method public synthetic constructor <init>(Ll/vli0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pli0;->a:Ll/vli0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pli0;->a:Ll/vli0;

    invoke-static {p0, p1}, Ll/vli0;->d(Ll/vli0;Landroid/content/DialogInterface;)V

    return-void
.end method
