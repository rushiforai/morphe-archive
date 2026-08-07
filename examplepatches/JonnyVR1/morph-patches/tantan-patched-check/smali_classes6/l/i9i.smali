.class public final synthetic Ll/i9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/o9i;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/o9i;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9i;->a:Ll/o9i;

    iput-object p2, p0, Ll/i9i;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i9i;->a:Ll/o9i;

    iget-object p0, p0, Ll/i9i;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/o9i;->e(Ll/o9i;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
