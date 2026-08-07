.class public final synthetic Ll/b8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/f8i;


# direct methods
.method public synthetic constructor <init>(Ll/f8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b8i;->a:Ll/f8i;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8i;->a:Ll/f8i;

    invoke-static {p0, p1}, Ll/f8i;->p(Ll/f8i;Landroid/view/View;)V

    return-void
.end method
