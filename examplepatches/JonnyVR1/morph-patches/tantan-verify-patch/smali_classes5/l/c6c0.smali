.class public final synthetic Ll/c6c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/g6c0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/g6c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6c0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/c6c0;->b:Ll/g6c0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c6c0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/c6c0;->b:Ll/g6c0;

    invoke-static {v0, p0, p1}, Ll/g6c0;->c(Ljava/lang/String;Ll/g6c0;Landroid/view/View;)V

    return-void
.end method
