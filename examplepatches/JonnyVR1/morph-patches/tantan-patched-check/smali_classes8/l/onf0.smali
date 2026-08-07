.class public final synthetic Ll/onf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/rnf0;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/rnf0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/onf0;->a:Ll/rnf0;

    iput-object p2, p0, Ll/onf0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/onf0;->a:Ll/rnf0;

    iget-object p0, p0, Ll/onf0;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/rnf0;->d(Ll/rnf0;Ljava/util/List;Landroid/content/DialogInterface;)V

    return-void
.end method
