.class public final synthetic Ll/cl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/dl0;


# direct methods
.method public synthetic constructor <init>(Ll/dl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cl0;->a:Ll/dl0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cl0;->a:Ll/dl0;

    invoke-static {p0, p1}, Ll/dl0;->y(Ll/dl0;Landroid/view/View;)V

    return-void
.end method
