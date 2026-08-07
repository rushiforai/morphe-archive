.class public final synthetic Ll/xvz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xvz;->a:Ll/yxz;

    iput-object p2, p0, Ll/xvz;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xvz;->a:Ll/yxz;

    iget-object p0, p0, Ll/xvz;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/yxz;->A2(Ll/yxz;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
