.class public final synthetic Ll/vw30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/b240;


# direct methods
.method public synthetic constructor <init>(Ll/b240;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vw30;->a:Ll/b240;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw30;->a:Ll/b240;

    invoke-static {p0, p1}, Ll/b240;->x3(Ll/b240;Landroid/content/DialogInterface;)V

    return-void
.end method
