.class public final synthetic Ll/s5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/s5;->a:Z

    iput p2, p0, Ll/s5;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s5;->a:Z

    iget p0, p0, Ll/s5;->b:I

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/t5;->c(ZILandroid/view/View;)V

    return-void
.end method
