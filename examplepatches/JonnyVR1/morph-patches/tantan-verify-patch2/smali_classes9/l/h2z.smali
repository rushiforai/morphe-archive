.class public final synthetic Ll/h2z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h2z;->a:Landroid/view/View;

    iput p2, p0, Ll/h2z;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h2z;->a:Landroid/view/View;

    iget p0, p0, Ll/h2z;->b:F

    invoke-static {v0, p0}, Ll/d3z;->s(Landroid/view/View;F)V

    return-void
.end method
