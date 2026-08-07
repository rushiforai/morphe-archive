.class public final synthetic Ll/z4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b5h;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/b5h;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4h;->a:Ll/b5h;

    iput-object p2, p0, Ll/z4h;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/z4h;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/z4h;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z4h;->a:Ll/b5h;

    iget-object v1, p0, Ll/z4h;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/z4h;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/z4h;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/b5h;->a(Ll/b5h;Ljava/lang/String;Ljava/lang/String;Ll/y20;Landroid/view/View;)V

    return-void
.end method
