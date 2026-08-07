.class public final synthetic Ll/hax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jax;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:[Ll/nqy;


# direct methods
.method public synthetic constructor <init>(Ll/jax;Lv/VEditText;[Ll/nqy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hax;->a:Ll/jax;

    iput-object p2, p0, Ll/hax;->b:Lv/VEditText;

    iput-object p3, p0, Ll/hax;->c:[Ll/nqy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hax;->a:Ll/jax;

    iget-object v1, p0, Ll/hax;->b:Lv/VEditText;

    iget-object p0, p0, Ll/hax;->c:[Ll/nqy;

    invoke-static {v0, v1, p0, p1}, Ll/jax;->n(Ll/jax;Lv/VEditText;[Ll/nqy;Landroid/view/View;)V

    return-void
.end method
