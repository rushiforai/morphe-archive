.class public final synthetic Ll/z1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(ZLandroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/z1h;->a:Z

    iput-object p2, p0, Ll/z1h;->b:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/z1h;->a:Z

    iget-object p0, p0, Ll/z1h;->b:Landroid/widget/TextView;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/k3h;->K(ZLandroid/widget/TextView;Ljava/lang/String;)V

    return-void
.end method
