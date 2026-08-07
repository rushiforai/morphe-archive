.class public final synthetic Ll/ggi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ggi0;->a:Ll/l4g0;

    iput-object p2, p0, Ll/ggi0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ggi0;->a:Ll/l4g0;

    iget-object p0, p0, Ll/ggi0;->b:Ll/xc00;

    invoke-static {v0, p0}, Ll/igi0;->K(Ll/l4g0;Ll/xc00;)V

    return-void
.end method
