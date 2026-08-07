.class public Ll/bmp$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bmp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bmp;


# direct methods
.method public constructor <init>(Ll/bmp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp$b;->a:Ll/bmp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bmp$b;->a:Ll/bmp;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bmp;->b(Ll/bmp;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/bmp$b;->a:Ll/bmp;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bmp;->b(Ll/bmp;)Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
