.class public final synthetic Ll/a6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c6g;

.field public final synthetic b:Ll/fes;


# direct methods
.method public synthetic constructor <init>(Ll/c6g;Ll/fes;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6g;->a:Ll/c6g;

    iput-object p2, p0, Ll/a6g;->b:Ll/fes;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a6g;->a:Ll/c6g;

    iget-object p0, p0, Ll/a6g;->b:Ll/fes;

    invoke-static {v0, p0, p1}, Ll/c6g;->e0(Ll/c6g;Ll/fes;Landroid/view/View;)V

    return-void
.end method
