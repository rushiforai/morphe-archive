.class public final synthetic Ll/iyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Landroid/widget/EditText;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iyh0;->a:Landroid/widget/EditText;

    iput-boolean p2, p0, Ll/iyh0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iyh0;->a:Landroid/widget/EditText;

    iget-boolean p0, p0, Ll/iyh0;->b:Z

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/kyh0;->b(Landroid/widget/EditText;ZLl/gcg0;)V

    return-void
.end method
