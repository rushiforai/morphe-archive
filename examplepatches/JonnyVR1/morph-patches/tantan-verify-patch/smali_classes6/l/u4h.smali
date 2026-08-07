.class public final synthetic Ll/u4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/v4h;


# direct methods
.method public synthetic constructor <init>(Ll/v4h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u4h;->a:Ll/v4h;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4h;->a:Ll/v4h;

    invoke-static {p0, p1}, Ll/v4h;->z(Ll/v4h;Landroid/view/View;)V

    return-void
.end method
