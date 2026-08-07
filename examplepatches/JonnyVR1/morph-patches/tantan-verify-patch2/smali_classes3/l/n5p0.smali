.class public final synthetic Ll/n5p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:F


# direct methods
.method public synthetic constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/n5p0;->a:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/n5p0;->a:F

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/e6p0;->O(FLandroid/view/View;)V

    return-void
.end method
