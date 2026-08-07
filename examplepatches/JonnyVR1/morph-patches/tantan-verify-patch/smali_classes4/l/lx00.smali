.class public final synthetic Ll/lx00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rx00;


# direct methods
.method public synthetic constructor <init>(Ll/rx00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lx00;->a:Ll/rx00;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lx00;->a:Ll/rx00;

    invoke-static {p0, p1}, Ll/rx00;->D(Ll/rx00;Landroid/view/View;)V

    return-void
.end method
