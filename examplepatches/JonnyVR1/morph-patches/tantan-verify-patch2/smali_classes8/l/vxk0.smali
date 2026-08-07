.class public final synthetic Ll/vxk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VFrame_Anim;

.field public final synthetic b:Ll/qcj;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lv/VFrame_Anim;Ll/qcj;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vxk0;->a:Lv/VFrame_Anim;

    iput-object p2, p0, Ll/vxk0;->b:Ll/qcj;

    iput-boolean p3, p0, Ll/vxk0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vxk0;->a:Lv/VFrame_Anim;

    iget-object v1, p0, Ll/vxk0;->b:Ll/qcj;

    iget-boolean p0, p0, Ll/vxk0;->c:Z

    check-cast p1, Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lv/VFrame_Anim;->w(Lv/VFrame_Anim;Ll/qcj;ZLandroid/view/View;)V

    return-void
.end method
