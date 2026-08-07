.class public final synthetic Ll/v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x0;


# direct methods
.method public synthetic constructor <init>(Ll/x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v0;->a:Ll/x0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v0;->a:Ll/x0;

    invoke-static {p0, p1}, Ll/x0;->b(Ll/x0;Landroid/view/View;)V

    return-void
.end method
