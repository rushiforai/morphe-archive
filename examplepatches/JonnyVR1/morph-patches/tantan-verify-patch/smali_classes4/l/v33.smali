.class public final synthetic Ll/v33;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w33;


# direct methods
.method public synthetic constructor <init>(Ll/w33;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v33;->a:Ll/w33;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v33;->a:Ll/w33;

    invoke-static {p0, p1}, Ll/w33;->x(Ll/w33;Landroid/view/View;)V

    return-void
.end method
