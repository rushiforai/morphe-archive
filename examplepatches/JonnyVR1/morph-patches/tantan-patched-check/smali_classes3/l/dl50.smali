.class public final synthetic Ll/dl50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/zpq;


# direct methods
.method public synthetic constructor <init>(Ll/zpq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dl50;->a:Ll/zpq;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl50;->a:Ll/zpq;

    invoke-static {p0, p1}, Ll/el50;->a(Ll/zpq;Landroid/content/DialogInterface;)V

    return-void
.end method
