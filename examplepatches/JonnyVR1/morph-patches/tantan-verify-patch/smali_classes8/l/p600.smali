.class public final synthetic Ll/p600;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r600;


# direct methods
.method public synthetic constructor <init>(Ll/r600;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p600;->a:Ll/r600;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p600;->a:Ll/r600;

    invoke-static {p0, p1}, Ll/r600;->j(Ll/r600;Landroid/view/View;)V

    return-void
.end method
