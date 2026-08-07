.class public final Ll/y0v0;
.super Ll/w8d0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/d1v0;


# direct methods
.method public constructor <init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/y0v0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/y0v0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/y0v0;->c:Ll/d1v0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/w8d0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/jtv;)V
    .locals 1
    .param p1    # Ll/jtv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/y0v0;->c:Ll/d1v0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/d1v0;->p8(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/y0v0;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, p1, p0}, Ll/d1v0;->q8(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final bridge synthetic b(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/v8d0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/y0v0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Ll/y0v0;->c:Ll/d1v0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/y0v0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, p0, p1, v0}, Ll/d1v0;->s8(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
