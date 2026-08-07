.class public final synthetic Ll/ed2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fd2;


# direct methods
.method public synthetic constructor <init>(Ll/fd2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ed2;->a:Ll/fd2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ed2;->a:Ll/fd2;

    invoke-static {p0, p1}, Ll/fd2;->a(Ll/fd2;Landroid/view/View;)V

    return-void
.end method
