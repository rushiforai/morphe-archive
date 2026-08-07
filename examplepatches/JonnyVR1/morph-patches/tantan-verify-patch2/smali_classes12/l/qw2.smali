.class public final synthetic Ll/qw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Ll/uw2;FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qw2;->a:Ll/uw2;

    iput p2, p0, Ll/qw2;->b:F

    iput p3, p0, Ll/qw2;->c:F

    iput p4, p0, Ll/qw2;->d:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qw2;->a:Ll/uw2;

    iget v1, p0, Ll/qw2;->b:F

    iget v2, p0, Ll/qw2;->c:F

    iget p0, p0, Ll/qw2;->d:F

    invoke-static {v0, v1, v2, p0}, Ll/uw2;->J(Ll/uw2;FFF)V

    return-void
.end method
