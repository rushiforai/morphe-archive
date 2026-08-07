.class public final synthetic Ll/iax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jax;

.field public final synthetic b:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Ll/jax;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iax;->a:Ll/jax;

    iput-object p2, p0, Ll/iax;->b:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iax;->a:Ll/jax;

    iget-object p0, p0, Ll/iax;->b:Lv/VEditText;

    invoke-static {v0, p0}, Ll/jax;->l(Ll/jax;Lv/VEditText;)V

    return-void
.end method
