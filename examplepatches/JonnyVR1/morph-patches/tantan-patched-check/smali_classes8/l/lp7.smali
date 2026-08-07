.class public final synthetic Ll/lp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qp7;

.field public final synthetic b:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/qp7;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lp7;->a:Ll/qp7;

    iput-object p2, p0, Ll/lp7;->b:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lp7;->a:Ll/qp7;

    iget-object p0, p0, Ll/lp7;->b:Landroid/widget/TextView;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Ll/qp7;->x(Ll/qp7;Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method
