.class public final synthetic Ll/j8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l8l;


# direct methods
.method public synthetic constructor <init>(Ll/l8l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j8l;->a:Ll/l8l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j8l;->a:Ll/l8l;

    invoke-static {p0, p1}, Ll/l8l;->z(Ll/l8l;Landroid/view/View;)V

    return-void
.end method
