.class public Ll/dml$l$b;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dml$l;->h(ZLl/vve0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Z

.field public final synthetic c:Ll/vve0;

.field public final synthetic d:Ll/dml$l;


# direct methods
.method public varargs constructor <init>(Ll/dml$l;Ljava/lang/String;[Ljava/lang/Object;ZLl/vve0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$l$b;->d:Ll/dml$l;

    .line 2
    .line 3
    iput-boolean p4, p0, Ll/dml$l$b;->b:Z

    .line 4
    .line 5
    iput-object p5, p0, Ll/dml$l$b;->c:Ll/vve0;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dml$l$b;->d:Ll/dml$l;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/dml$l$b;->b:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/dml$l$b;->c:Ll/vve0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/dml$l;->l(ZLl/vve0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
