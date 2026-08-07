.class public final synthetic Ll/d90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/f90;

.field public final synthetic b:Ll/g90;


# direct methods
.method public synthetic constructor <init>(Ll/f90;Ll/g90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d90;->a:Ll/f90;

    iput-object p2, p0, Ll/d90;->b:Ll/g90;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d90;->a:Ll/f90;

    iget-object p0, p0, Ll/d90;->b:Ll/g90;

    invoke-static {v0, p0, p1}, Ll/f90;->t(Ll/f90;Ll/g90;Landroid/view/View;)V

    return-void
.end method
