.class public final synthetic Ll/g8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/l8l;


# direct methods
.method public synthetic constructor <init>(Ll/l8l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8l;->a:Ll/l8l;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8l;->a:Ll/l8l;

    invoke-static {p0, p1}, Ll/l8l;->y(Ll/l8l;Landroid/content/DialogInterface;)V

    return-void
.end method
