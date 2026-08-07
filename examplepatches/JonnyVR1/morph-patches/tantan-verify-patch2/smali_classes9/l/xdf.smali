.class public final synthetic Ll/xdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cef;

.field public final synthetic b:[Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/cef;[ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xdf;->a:Ll/cef;

    iput-object p2, p0, Ll/xdf;->b:[Z

    iput-object p3, p0, Ll/xdf;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xdf;->a:Ll/cef;

    iget-object v1, p0, Ll/xdf;->b:[Z

    iget-object p0, p0, Ll/xdf;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/cef;->T(Ll/cef;[ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method
