.class public final synthetic Ll/jm1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lm1;


# direct methods
.method public synthetic constructor <init>(Ll/lm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jm1;->a:Ll/lm1;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jm1;->a:Ll/lm1;

    invoke-static {p0, p1}, Ll/lm1;->a(Ll/lm1;Landroid/view/View;)V

    return-void
.end method
