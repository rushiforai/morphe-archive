.class public final synthetic Ll/i2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/j2n;


# direct methods
.method public synthetic constructor <init>(Ll/j2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2n;->a:Ll/j2n;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2n;->a:Ll/j2n;

    invoke-static {p0, p1}, Ll/j2n;->T2(Ll/j2n;Landroid/content/DialogInterface;)V

    return-void
.end method
