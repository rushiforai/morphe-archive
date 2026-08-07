.class public final synthetic Ll/dif0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dif0;->a:Ll/zif0;

    iput-object p2, p0, Ll/dif0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/dif0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dif0;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dif0;->a:Ll/zif0;

    iget-object v1, p0, Ll/dif0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/dif0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/dif0;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/zif0;->p(Ll/zif0;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method
