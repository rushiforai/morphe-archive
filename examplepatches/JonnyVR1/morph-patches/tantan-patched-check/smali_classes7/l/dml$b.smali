.class public Ll/dml$b;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dml;->o0(IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:Ll/dml;


# direct methods
.method public varargs constructor <init>(Ll/dml;Ljava/lang/String;[Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$b;->d:Ll/dml;

    .line 2
    .line 3
    iput p4, p0, Ll/dml$b;->b:I

    .line 4
    .line 5
    iput-wide p5, p0, Ll/dml$b;->c:J

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
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/dml$b;->d:Ll/dml;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dml;->w:Ll/hml;

    .line 4
    .line 5
    iget v1, p0, Ll/dml$b;->b:I

    .line 6
    .line 7
    iget-wide v2, p0, Ll/dml$b;->c:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/hml;->J(IJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    iget-object p0, p0, Ll/dml$b;->d:Ll/dml;

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/dml;->b(Ll/dml;Ljava/io/IOException;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
