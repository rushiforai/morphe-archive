.class public final synthetic Ll/etp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ftp;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/ftp;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/etp;->a:Ll/ftp;

    iput-object p2, p0, Ll/etp;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/etp;->a:Ll/ftp;

    iget-object p0, p0, Ll/etp;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Ll/ftp;->n0(Ll/ftp;Ll/x20;Landroid/view/View;)V

    return-void
.end method
