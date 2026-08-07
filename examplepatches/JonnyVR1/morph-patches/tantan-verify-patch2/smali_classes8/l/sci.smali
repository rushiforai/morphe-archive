.class public final synthetic Ll/sci;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pdi;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sci;->a:Ll/pdi;

    iput-object p2, p0, Ll/sci;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sci;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sci;->a:Ll/pdi;

    iget-object v1, p0, Ll/sci;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/sci;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/pdi;->w(Ll/pdi;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
