.class public final synthetic Ll/u2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b3f0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/b3f0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u2f0;->a:Ll/b3f0;

    iput-object p2, p0, Ll/u2f0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2f0;->a:Ll/b3f0;

    iget-object p0, p0, Ll/u2f0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/b3f0;->i(Ll/b3f0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
