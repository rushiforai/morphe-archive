.class public final synthetic Ll/k5k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/k5k0;->a:Z

    iput p2, p0, Ll/k5k0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/k5k0;->a:Z

    iget p0, p0, Ll/k5k0;->b:I

    invoke-static {v0, p0}, Ll/q5k0;->l(ZI)V

    return-void
.end method
