.class public final Ll/jng0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aug0;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Ll/aug0;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jng0;->a:Ll/aug0;

    .line 2
    .line 3
    iput p2, p0, Ll/jng0;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/jng0;->c:Ljava/lang/Exception;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jng0;->a:Ll/aug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/aug0;->p:Ll/eog0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/jng0;->a:Ll/aug0;

    .line 6
    .line 7
    iget v2, p0, Ll/jng0;->b:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/jng0;->c:Ljava/lang/Exception;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ll/rkg0;->i(Ll/aug0;ILjava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
