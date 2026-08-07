.class public final synthetic Ll/the;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bie;

.field public final synthetic b:Ll/fzq;


# direct methods
.method public synthetic constructor <init>(Ll/bie;Ll/fzq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/the;->a:Ll/bie;

    iput-object p2, p0, Ll/the;->b:Ll/fzq;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/the;->a:Ll/bie;

    iget-object p0, p0, Ll/the;->b:Ll/fzq;

    invoke-static {v0, p0, p1}, Ll/bie;->T(Ll/bie;Ll/fzq;Landroid/view/View;)V

    return-void
.end method
