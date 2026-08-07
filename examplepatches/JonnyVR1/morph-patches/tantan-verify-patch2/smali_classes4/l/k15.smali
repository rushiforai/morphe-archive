.class public final synthetic Ll/k15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r15;


# direct methods
.method public synthetic constructor <init>(Ll/r15;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k15;->a:Ll/r15;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k15;->a:Ll/r15;

    invoke-static {p0, p1}, Ll/r15;->e(Ll/r15;Landroid/view/View;)V

    return-void
.end method
