.class public Ll/v0j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v0j;->e(Landroid/content/Context;Ll/t0j;Ll/c94;II)Landroid/graphics/Typeface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ll/v0j$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/t0j;

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Ll/t0j;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v0j$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/v0j$a;->b:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Ll/v0j$a;->c:Ll/t0j;

    .line 6
    .line 7
    iput p4, p0, Ll/v0j$a;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/v0j$e;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v0j$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v0j$a;->b:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Ll/v0j$a;->c:Ll/t0j;

    .line 6
    .line 7
    iget p0, p0, Ll/v0j$a;->d:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Ll/v0j;->c(Ljava/lang/String;Landroid/content/Context;Ll/t0j;I)Ll/v0j$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/v0j$a;->a()Ll/v0j$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
