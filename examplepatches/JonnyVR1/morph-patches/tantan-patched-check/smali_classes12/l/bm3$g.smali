.class final Ll/bm3$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bm3;->v([Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/content/DialogInterface;",
        "kotlin.jvm.PlatformType",
        "onCancel"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/bm3;

.field final synthetic b:I


# direct methods
.method public constructor <init>(Ll/bm3;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bm3$g;->a:Ll/bm3;

    .line 2
    .line 3
    iput p2, p0, Ll/bm3$g;->b:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bm3$g;->a:Ll/bm3;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bm3;->e(Ll/bm3;Landroid/app/AlertDialog;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/bm3$g;->a:Ll/bm3;

    .line 8
    .line 9
    invoke-static {p1}, Ll/bm3;->b(Ll/bm3;)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget v0, p0, Ll/bm3$g;->b:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/bm3$g;->a:Ll/bm3;

    .line 23
    .line 24
    iget p0, p0, Ll/bm3$g;->b:I

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/bm3;->c(Ll/bm3;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
