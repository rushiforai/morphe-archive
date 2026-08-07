.class public final synthetic Ll/t1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y1x;


# direct methods
.method public synthetic constructor <init>(Ll/y1x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t1x;->a:Ll/y1x;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t1x;->a:Ll/y1x;

    invoke-static {p0, p1}, Ll/y1x;->i0(Ll/y1x;Landroid/view/View;)V

    return-void
.end method
