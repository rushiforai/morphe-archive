.class public final synthetic Ll/otd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qtd;

.field public final synthetic b:Ll/bkj0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/qtd;Ll/bkj0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/otd;->a:Ll/qtd;

    iput-object p2, p0, Ll/otd;->b:Ll/bkj0;

    iput-object p3, p0, Ll/otd;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/otd;->a:Ll/qtd;

    iget-object v1, p0, Ll/otd;->b:Ll/bkj0;

    iget-object p0, p0, Ll/otd;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/qtd;->w(Ll/qtd;Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
