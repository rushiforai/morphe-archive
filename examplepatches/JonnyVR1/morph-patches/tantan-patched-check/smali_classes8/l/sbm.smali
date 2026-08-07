.class public final synthetic Ll/sbm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/hcm;


# direct methods
.method public synthetic constructor <init>(Ll/hcm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sbm;->a:Ll/hcm;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sbm;->a:Ll/hcm;

    invoke-static {p0, p1}, Ll/hcm;->d(Ll/hcm;Landroid/content/DialogInterface;)V

    return-void
.end method
