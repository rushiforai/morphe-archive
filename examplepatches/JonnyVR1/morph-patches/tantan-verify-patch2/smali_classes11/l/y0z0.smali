.class public final Ll/y0z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f2z0;


# instance fields
.field public final a:I

.field public final synthetic b:Ll/b1z0;


# direct methods
.method public constructor <init>(Ll/b1z0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y0z0;->b:Ll/b1z0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/y0z0;->a:I

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic c(Ll/y0z0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/y0z0;->a:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final a(J)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0z0;->b:Ll/b1z0;

    .line 2
    .line 3
    iget p0, p0, Ll/y0z0;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/b1z0;->J(IJ)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final b(Ll/l9y0;Ll/evx0;I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0z0;->b:Ll/b1z0;

    .line 2
    .line 3
    iget p0, p0, Ll/y0z0;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/b1z0;->I(ILl/l9y0;Ll/evx0;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final zzd()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y0z0;->b:Ll/b1z0;

    .line 2
    .line 3
    iget p0, p0, Ll/y0z0;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/b1z0;->v(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zze()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0z0;->b:Ll/b1z0;

    .line 2
    .line 3
    iget p0, p0, Ll/y0z0;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/b1z0;->x(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
