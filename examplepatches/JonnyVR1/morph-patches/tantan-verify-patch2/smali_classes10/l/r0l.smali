.class public final synthetic Ll/r0l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/s0l;


# direct methods
.method public synthetic constructor <init>(Ll/s0l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r0l;->a:Ll/s0l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0l;->a:Ll/s0l;

    invoke-static {p0, p1}, Ll/s0l;->w(Ll/s0l;Landroid/view/View;)V

    return-void
.end method
