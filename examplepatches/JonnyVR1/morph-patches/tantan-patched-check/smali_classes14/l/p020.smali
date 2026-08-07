.class public final synthetic Ll/p020;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q020;

.field public final synthetic b:Ll/a020;


# direct methods
.method public synthetic constructor <init>(Ll/q020;Ll/a020;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p020;->a:Ll/q020;

    iput-object p2, p0, Ll/p020;->b:Ll/a020;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p020;->a:Ll/q020;

    iget-object p0, p0, Ll/p020;->b:Ll/a020;

    invoke-static {v0, p0, p1}, Ll/q020;->b(Ll/q020;Ll/a020;Landroid/view/View;)V

    return-void
.end method
