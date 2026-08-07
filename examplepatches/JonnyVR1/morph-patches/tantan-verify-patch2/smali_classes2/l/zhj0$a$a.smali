.class public Ll/zhj0$a$a;
.super Ll/yhj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zhj0$a;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l01;

.field public final synthetic b:Ll/zhj0$a;


# direct methods
.method public constructor <init>(Ll/zhj0$a;Ll/l01;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zhj0$a$a;->b:Ll/zhj0$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zhj0$a$a;->a:Ll/l01;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yhj0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ll/ygj0;)V
    .locals 2
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zhj0$a$a;->a:Ll/l01;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zhj0$a$a;->b:Ll/zhj0$a;

    .line 4
    .line 5
    iget-object v1, v1, Ll/zhj0$a;->b:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/ygj0;->removeListener(Ll/ygj0$g;)Ll/ygj0;

    .line 17
    .line 18
    .line 19
    return-void
.end method
