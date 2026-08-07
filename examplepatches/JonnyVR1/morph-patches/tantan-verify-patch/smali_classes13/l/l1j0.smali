.class public final synthetic Ll/l1j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/Toast;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Toast;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l1j0;->a:Landroid/widget/Toast;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l1j0;->a:Landroid/widget/Toast;

    invoke-static {p0}, Ll/o1j0;->a(Landroid/widget/Toast;)V

    return-void
.end method
