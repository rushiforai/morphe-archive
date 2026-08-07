.class public final synthetic Ll/vae;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/vae;->a:F

    iput p2, p0, Ll/vae;->b:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/vae;->a:F

    iget p0, p0, Ll/vae;->b:F

    check-cast p1, Ll/rae;

    invoke-static {v0, p0, p1}, Ll/xae;->e(FFLl/rae;)V

    return-void
.end method
