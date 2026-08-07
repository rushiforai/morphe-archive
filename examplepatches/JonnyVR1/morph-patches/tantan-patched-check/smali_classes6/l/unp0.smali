.class public final synthetic Ll/unp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/unp0;->a:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/unp0;->a:Z

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/ynp0;->f(ZLandroid/view/View;)V

    return-void
.end method
