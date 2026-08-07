.class public final synthetic Ll/rc90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tc90;


# direct methods
.method public synthetic constructor <init>(Ll/tc90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rc90;->a:Ll/tc90;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rc90;->a:Ll/tc90;

    invoke-static {p0, p1}, Ll/tc90;->q(Ll/tc90;Landroid/view/View;)V

    return-void
.end method
