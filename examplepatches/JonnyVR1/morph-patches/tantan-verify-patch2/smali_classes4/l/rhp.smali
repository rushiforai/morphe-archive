.class public final synthetic Ll/rhp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/hjp;


# direct methods
.method public synthetic constructor <init>(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rhp;->a:Ll/hjp;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rhp;->a:Ll/hjp;

    invoke-static {p0, p1}, Ll/hjp;->y0(Ll/hjp;Landroid/content/DialogInterface;)V

    return-void
.end method
