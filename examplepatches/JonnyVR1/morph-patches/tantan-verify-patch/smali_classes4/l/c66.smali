.class public final synthetic Ll/c66;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/d66;


# direct methods
.method public synthetic constructor <init>(Ll/d66;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c66;->a:Ll/d66;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c66;->a:Ll/d66;

    invoke-static {p0, p1}, Ll/d66;->a(Ll/d66;Landroid/view/View;)V

    return-void
.end method
