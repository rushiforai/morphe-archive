.class public final synthetic Ll/c80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e80;


# direct methods
.method public synthetic constructor <init>(Ll/e80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c80;->a:Ll/e80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c80;->a:Ll/e80;

    invoke-virtual {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    return-void
.end method
