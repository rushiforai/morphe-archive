.class public final synthetic Ll/l6c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/m6c0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/m6c0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6c0;->a:Ll/m6c0;

    iput-object p2, p0, Ll/l6c0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6c0;->a:Ll/m6c0;

    iget-object p0, p0, Ll/l6c0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/m6c0$a;->a(Ll/m6c0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
