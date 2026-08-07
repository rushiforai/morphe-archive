.class public final synthetic Ll/le6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/le6;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/le6;->a:I

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/ue6;->v0(ILandroid/view/View;)V

    return-void
.end method
