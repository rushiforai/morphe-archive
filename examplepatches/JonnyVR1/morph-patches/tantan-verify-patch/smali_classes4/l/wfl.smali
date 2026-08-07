.class public final synthetic Ll/wfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yfl;

.field public final synthetic b:Ll/f1g0;


# direct methods
.method public synthetic constructor <init>(Ll/yfl;Ll/f1g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wfl;->a:Ll/yfl;

    iput-object p2, p0, Ll/wfl;->b:Ll/f1g0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wfl;->a:Ll/yfl;

    iget-object p0, p0, Ll/wfl;->b:Ll/f1g0;

    invoke-static {v0, p0, p1}, Ll/yfl;->z(Ll/yfl;Ll/f1g0;Landroid/view/View;)V

    return-void
.end method
