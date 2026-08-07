.class public final synthetic Ll/vsd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/atd$h$a;


# instance fields
.field public final synthetic a:Ll/atd;

.field public final synthetic b:Ll/atd$d;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/atd;Ll/atd$d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vsd;->a:Ll/atd;

    iput-object p2, p0, Ll/vsd;->b:Ll/atd$d;

    iput-boolean p3, p0, Ll/vsd;->c:Z

    return-void
.end method


# virtual methods
.method public final a(ILl/dfj0;[I)Ljava/util/List;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vsd;->a:Ll/atd;

    iget-object v1, p0, Ll/vsd;->b:Ll/atd$d;

    iget-boolean v2, p0, Ll/vsd;->c:Z

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Ll/atd;->w(Ll/atd;Ll/atd$d;ZILl/dfj0;[I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
