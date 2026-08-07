.class public final synthetic Ll/p4m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/k5m0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/k5m0;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4m0;->a:Ll/k5m0;

    iput-boolean p2, p0, Ll/p4m0;->b:Z

    iput-object p3, p0, Ll/p4m0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p4m0;->a:Ll/k5m0;

    iget-boolean v1, p0, Ll/p4m0;->b:Z

    iget-object p0, p0, Ll/p4m0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/k5m0;->X(Ll/k5m0;ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method
