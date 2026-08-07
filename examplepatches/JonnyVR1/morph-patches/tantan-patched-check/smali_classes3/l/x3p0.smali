.class public final synthetic Ll/x3p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/c4p0;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/c4p0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x3p0;->a:Ll/c4p0;

    iput-object p2, p0, Ll/x3p0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x3p0;->a:Ll/c4p0;

    iget-object p0, p0, Ll/x3p0;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/c4p0;->b(Ll/c4p0;Ljava/util/List;Landroid/content/DialogInterface;)V

    return-void
.end method
