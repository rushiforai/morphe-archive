.class public final synthetic Ll/upm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/aqm0;

.field public final synthetic b:Ll/mpm0;


# direct methods
.method public synthetic constructor <init>(Ll/aqm0;Ll/mpm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/upm0;->a:Ll/aqm0;

    iput-object p2, p0, Ll/upm0;->b:Ll/mpm0;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/upm0;->a:Ll/aqm0;

    iget-object p0, p0, Ll/upm0;->b:Ll/mpm0;

    invoke-static {v0, p0, p1}, Ll/aqm0;->M3(Ll/aqm0;Ll/mpm0;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
