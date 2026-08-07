.class public final synthetic Ll/zzc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/e0d0;


# direct methods
.method public synthetic constructor <init>(Ll/e0d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zzc0;->a:Ll/e0d0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zzc0;->a:Ll/e0d0;

    invoke-static {p0, p1}, Ll/e0d0;->a(Ll/e0d0;Landroid/content/DialogInterface;)V

    return-void
.end method
