.class public final synthetic Ll/ahk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/chk;


# direct methods
.method public synthetic constructor <init>(Ll/chk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ahk;->a:Ll/chk;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahk;->a:Ll/chk;

    invoke-static {p0, p1}, Ll/chk;->b(Ll/chk;Landroid/view/View;)V

    return-void
.end method
