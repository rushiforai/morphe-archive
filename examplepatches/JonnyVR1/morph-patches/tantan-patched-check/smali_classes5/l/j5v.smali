.class public final synthetic Ll/j5v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l5v;


# direct methods
.method public synthetic constructor <init>(Ll/l5v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5v;->a:Ll/l5v;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j5v;->a:Ll/l5v;

    invoke-static {p0, p1}, Ll/l5v;->b(Ll/l5v;Landroid/view/View;)V

    return-void
.end method
