.class Ll/koh0$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/koh0$e;->c(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/koh0$e;


# direct methods
.method public constructor <init>(Ll/koh0$e;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/koh0$e$a;->c:Ll/koh0$e;

    .line 2
    .line 3
    iput p2, p0, Ll/koh0$e$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/koh0$e$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/koh0$e$a;->c:Ll/koh0$e;

    .line 2
    .line 3
    invoke-static {v0}, Ll/koh0$e;->a(Ll/koh0$e;)Ll/loh0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Ll/koh0$e$a;->a:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/koh0$e$a;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Ll/loh0;->c(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
