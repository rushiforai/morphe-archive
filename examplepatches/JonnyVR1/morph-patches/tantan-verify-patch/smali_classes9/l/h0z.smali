.class public final synthetic Ll/h0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/u1z;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h0z;->a:Ll/u1z;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h0z;->a:Ll/u1z;

    invoke-static {p0, p1}, Ll/u1z;->W0(Ll/u1z;Landroid/content/DialogInterface;)V

    return-void
.end method
