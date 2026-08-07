.class public final synthetic Ll/r1s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/v1s;


# direct methods
.method public synthetic constructor <init>(Ll/v1s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r1s;->a:Ll/v1s;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r1s;->a:Ll/v1s;

    invoke-static {p0, p1}, Ll/v1s;->I(Ll/v1s;Landroid/view/View;)V

    return-void
.end method
