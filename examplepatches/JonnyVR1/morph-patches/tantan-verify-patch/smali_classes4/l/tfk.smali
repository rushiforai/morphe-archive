.class public final synthetic Ll/tfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vfk;


# direct methods
.method public synthetic constructor <init>(Ll/vfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfk;->a:Ll/vfk;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfk;->a:Ll/vfk;

    invoke-static {p0, p1}, Ll/vfk;->c(Ll/vfk;Landroid/view/View;)V

    return-void
.end method
