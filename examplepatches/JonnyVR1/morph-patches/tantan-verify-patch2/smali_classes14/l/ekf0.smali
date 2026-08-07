.class public final synthetic Ll/ekf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rkf0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/rkf0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ekf0;->a:Ll/rkf0;

    iput-object p2, p0, Ll/ekf0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ekf0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ekf0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ekf0;->a:Ll/rkf0;

    iget-object v1, p0, Ll/ekf0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ekf0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/ekf0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/rkf0;->y(Ll/rkf0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
