.class public final Ll/qqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aug0;

.field public final synthetic b:I

.field public final synthetic c:J


# direct methods
.method public constructor <init>(Ll/aug0;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qqg0;->a:Ll/aug0;

    .line 2
    .line 3
    iput p2, p0, Ll/qqg0;->b:I

    .line 4
    .line 5
    iput-wide p3, p0, Ll/qqg0;->c:J

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qqg0;->a:Ll/aug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/aug0;->p:Ll/eog0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/qqg0;->a:Ll/aug0;

    .line 6
    .line 7
    iget v2, p0, Ll/qqg0;->b:I

    .line 8
    .line 9
    iget-wide v3, p0, Ll/qqg0;->c:J

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/rkg0;->e(Ll/aug0;IJ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
