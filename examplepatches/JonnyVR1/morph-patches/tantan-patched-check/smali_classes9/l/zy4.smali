.class public final synthetic Ll/zy4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/az4;


# direct methods
.method public synthetic constructor <init>(Ll/az4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zy4;->a:Ll/az4;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zy4;->a:Ll/az4;

    invoke-static {p0, p1}, Ll/az4;->c(Ll/az4;Landroid/content/DialogInterface;)V

    return-void
.end method
