.class public final synthetic Ll/ow2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Ll/uw2;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ow2;->a:Ll/uw2;

    iput p2, p0, Ll/ow2;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ow2;->a:Ll/uw2;

    iget p0, p0, Ll/ow2;->b:F

    invoke-static {v0, p0}, Ll/uw2;->C(Ll/uw2;F)V

    return-void
.end method
