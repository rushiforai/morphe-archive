.class public final synthetic Ll/y580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y580;->a:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y580;->a:Ll/i6t;

    invoke-static {p0, p1}, Ll/c680;->g(Ll/i6t;Landroid/content/DialogInterface;)V

    return-void
.end method
