.class public final synthetic Ll/c3q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c3q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/c3q0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c3q0;->a:Ll/v3q0;

    iget-object p0, p0, Ll/c3q0;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/v3q0;->I1(Ll/v3q0;Landroid/view/View;)V

    return-void
.end method
