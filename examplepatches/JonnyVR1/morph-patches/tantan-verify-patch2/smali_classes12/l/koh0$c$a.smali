.class Ll/koh0$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wr4$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/koh0$c;->f(Ljava/util/List;Ll/aje;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/aje;

.field final synthetic b:Ll/koh0$c;


# direct methods
.method public constructor <init>(Ll/koh0$c;Ll/aje;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/koh0$c$a;->b:Ll/koh0$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/koh0$c$a;->a:Ll/aje;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(FDLl/wr4;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/koh0$c$a;->b:Ll/koh0$c;

    .line 2
    .line 3
    iget-object v2, p0, Ll/koh0$c$a;->a:Ll/aje;

    .line 4
    .line 5
    move v5, p1

    .line 6
    move-wide v3, p2

    .line 7
    move-object v1, p4

    .line 8
    invoke-static/range {v0 .. v5}, Ll/koh0$c;->b(Ll/koh0$c;Ll/wr4;Ll/aje;DF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
