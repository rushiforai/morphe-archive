.class public Ll/fiy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fiy;->k(Ll/zbr;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fiy;


# direct methods
.method public constructor <init>(Ll/fiy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fiy$a;->a:Ll/fiy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fiy$a;->a:Ll/fiy;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fiy;->f(Ll/fiy;)Ll/riy;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/fiy$a;->a:Ll/fiy;

    .line 10
    .line 11
    invoke-static {p0}, Ll/fiy;->f(Ll/fiy;)Ll/riy;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/riy;->V3()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
